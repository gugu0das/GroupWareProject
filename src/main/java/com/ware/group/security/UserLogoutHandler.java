package com.ware.group.security;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.LogoutHandler;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.ware.group.member.MemberVO;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Component
public class UserLogoutHandler implements LogoutHandler{
	


	@Override
	public void logout(HttpServletRequest request, HttpServletResponse response, Authentication authentication) {
//		this.simpleLogout();
		
		try {
			
			response.sendRedirect("/");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

//	private void simpleLogout() {
//		RestTemplate restTemplate = new RestTemplate();
//		
//		MemberVO memberVO=(MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		log.error("회원번호 ::: {}", memberVO.getAttributes().get("id"));
//		//header
//		HttpHeaders headers = new HttpHeaders();
//		headers.add("Authorization", "KakaoAK "+adminKey);
//		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
//		
//		//parameter
//		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
//		params.add("target_id_type", "user_id");
//		params.add("target_id", memberVO.getAttributes().get("id").toString());
//		
//		HttpEntity<MultiValueMap<String, String>> req = new HttpEntity<>(params, headers);
//		
//		String id=restTemplate.postForObject("https://kapi.kakao.com/v1/user/logout", req, String.class);
//		log.error("logout Result : {}", id);
//		
//		
//		
//	}
	


}
