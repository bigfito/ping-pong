package cloud.bigfito.handler.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestClient;

@Slf4j
@RestController
@RequestMapping("/ping-pong")
public class HandlerController {

    @Value( "${app.ping.hostname}")
    String pingHostname;

    @Value( "${app.ping.port}")
    String pingPort;

    @Value( "${app.pong.hostname}")
    String pongHostname;

    @Value( "${app.pong.port}")
    String pongPort;

    @GetMapping("/ping")
    public ResponseEntity<String> handlePing() {

        RestClient restClient;
        String result;

        System.out.println("Retrieving PING from microservice...");

        // customize rest client base URL
        restClient = RestClient.builder()
                .baseUrl("http://" + pingHostname + ":" + pingPort)
                .build();

        result = restClient.get()
                .uri("ping-pong/ping")
                .retrieve()
                .body(String.class);

        return ResponseEntity.ok(result);
    }

    @GetMapping("/pong")
    public ResponseEntity<String> handlePong() {

        RestClient restClient;
        String result;

        System.out.println("Retrieving PONG from microservice...");

        // customize rest client base URL
        restClient = RestClient.builder()
                .baseUrl("http://" + pongHostname + ":" + pongPort)
                .build();

        result = restClient.get()
                .uri("ping-pong/pong")
                .retrieve()
                .body(String.class);

        return ResponseEntity.ok(result);
    }
}