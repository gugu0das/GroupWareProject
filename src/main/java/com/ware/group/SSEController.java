package com.ware.group;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

@RestController
public class SSEController {

    private List<SseEmitter> emitters = new CopyOnWriteArrayList<>(); // SSE 연결을 위한 SseEmitter 리스트

    @GetMapping("/sse")
    public SseEmitter connect() {
        SseEmitter emitter = new SseEmitter();
        emitters.add(emitter);
        emitter.onCompletion(() -> emitters.remove(emitter));
        return emitter;
    }

    @GetMapping("/trigger-event")
    public String triggerEvent() {
        for (SseEmitter emitter : emitters) {
            try {
                emitter.send("Event data"); // 이벤트 데이터 전송
            } catch (IOException e) {
                // 예외 처리
            }
        }
        return "Event triggered";
    }
}

