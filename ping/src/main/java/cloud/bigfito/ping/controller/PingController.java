package cloud.bigfito.ping.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/ping-pong")
public class PingController {

    @GetMapping("/ping")
    public ResponseEntity<String> handlePing() {

        System.out.println("PING to the rescue...");
        return ResponseEntity.ok("PING");
    }

}