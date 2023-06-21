package com.ware.group;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.ware.group.alim.AllimDAO;
import com.ware.group.alim.AllimVO;
import com.ware.group.member.MemberVO;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@RestController
public class SSEController {
	 
	@Autowired
	private AllimDAO allimDAO;
	
	@Autowired
	private SSEService sseService;
	
    private List<SseEmitter> emitters = new CopyOnWriteArrayList<>(); // SSE 연결을 위한 SseEmitter 리스트
    private Map<String, SseEmitter> clients = new ConcurrentHashMap<>();

    @GetMapping("/sse")
    public SseEmitter connect(HttpSession session) {
    	Object obj =session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
		MemberVO memberVO = (MemberVO)contextImpl.getAuthentication().getPrincipal();
		
        String sessionId = memberVO.getId().toString();
        SseEmitter emitter = new SseEmitter(-1L);
        
        // 연결 저장소에 클라이언트 추가
        clients.put(sessionId, emitter);

        // SSE 연결 종료 시, 저장소에서 클라이언트 제거
        emitter.onCompletion(() -> clients.remove(sessionId));
        emitter.onTimeout(() -> clients.remove(sessionId));

        return emitter;
    }
    

    @GetMapping("/trigger-event")
    public String triggerEvent(String userId, String eventData) throws Exception{
    	
    	MemberVO memberVO = new MemberVO();
    	memberVO.setId(Long.valueOf(userId));
    	Long a=allimDAO.getAllimcount(memberVO);
    	
		clients.get(userId).send(a);
		
    	
        return "Event triggered";
    }
    
    
    
}

