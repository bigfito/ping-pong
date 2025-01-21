package cloud.bigfito.pong.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/ping-pong")
public class PongController {

    @GetMapping("/pong")
    public ResponseEntity<String> handlePong() {

        System.out.println("PONG to the rescue...");
        return ResponseEntity.ok("PONG");
    }

}