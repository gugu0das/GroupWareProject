package com.ware.group;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import java.util.ArrayList;
import java.util.List;

@Component
public class EventService {
	
    private final List<SseEmitter> emitters = new ArrayList<>();

    public void addEmitter(SseEmitter emitter) {
        emitters.add(emitter);
    }

    public void removeEmitter(SseEmitter emitter) {
        emitters.remove(emitter);
    }

    public void triggerEvent() {
        // 특정 이벤트가 발생했을 때 SSE를 실행하는 로직 작성
        // ...
    	
        sendEvent();
    }

    private void sendEvent() {
        List<SseEmitter> expiredEmitters = new ArrayList<>();
        for (SseEmitter emitter : emitters) {
            try {
                emitter.send("data: Event occurred\n\n");
            } catch (Exception e) {
                expiredEmitters.add(emitter);
            }
        }
        emitters.removeAll(expiredEmitters);
    }
}