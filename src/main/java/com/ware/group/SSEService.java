package com.ware.group;

import java.io.IOException;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

@Service
public class SSEService {
	
	
	
	public String backEvent(String userId, String eventData, Map<String, SseEmitter> clients) {
	
		try {
			clients.get(userId).send(eventData + " " + userId);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
        return "Event triggered";
	}
}
