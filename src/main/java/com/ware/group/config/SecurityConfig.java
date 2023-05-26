package com.ware.group.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import com.ware.group.security.UserLoginFailHandler;
import com.ware.group.security.UserLogoutHandler;
import com.ware.group.security.UserSuccessHandler;

@Configuration
@EnableWebSecurity
public class SecurityConfig{
	
	@Autowired
	private UserLogoutHandler userLogoutHandler;
	
	@Bean
	//public 을 선언하면 default로 바꾸라는 메세지 출력
	WebSecurityCustomizer webSecurityConfig() {
		//Security에서 무시해야하는 URL 패턴 등록
		return web -> web
				.ignoring()
				//.antMatchers("/**")
				.antMatchers("/images/**")
				.antMatchers("/js/**")
				.antMatchers("/css/**")
				.antMatchers("/favicon/**")
//				
				;
	}
	@Bean
	SecurityFilterChain fiterChain(HttpSecurity httpSecurity)throws Exception{
		httpSecurity
				.cors()	
				.and()
				.csrf()
				.disable()
				
			.authorizeRequests()
				//URL과 권한 매칭
			
				.antMatchers("/**").hasRole("USER")
//				.permitAll()
				.antMatchers("/member/join").permitAll()
//				.antMatchers("/notice/add").hasRole("MEMBER")
//				.antMatchers("/notice/update").hasRole("ADMIN")
//				.antMatchers("/notice/delete").hasRole("ADMIN")
//				.antMatchers("/notice/*").permitAll()
//				.antMatchers("/admin/**").hasRole("ADMIN")
//				.antMatchers("/qna/add").hasAnyRole("ADMIN", "MANAGER", "MEMBER")
				//.anyRequest().authenticated()
				.anyRequest().permitAll()
				.and()
			.formLogin()
			.usernameParameter("accountId")
				.loginPage("/member/login")
//				.defaultSuccessUrl("/")
				.successHandler(new UserSuccessHandler())
//				.failureUrl("/member/login")
				.failureHandler(new UserLoginFailHandler())
				.permitAll()
				
				.and()
			.logout()
				.logoutUrl("/member/logout")
				//.logoutSuccessUrl("/")
				.addLogoutHandler(userLogoutHandler)// 로그아웃 성공 후 이동할 URL 설정(로그아웃 핸들러 클래스로 설정했음)
//				.logoutSuccessHandler(userLogoutHandler)  // 로그아웃 성공 후 이동할 URL 설정(로그아웃 핸들러 클래스로 설정했음)
				.invalidateHttpSession(true)// 로그아웃 후 세션 초기화 설정
				.deleteCookies("JSESSIONID")// 로그아웃 후 쿠기 삭제 설정
				.permitAll()
//				.and()

//			.sessionManagement()
//				.maximumSessions(1) //최대 허용 가능한 session 수, -1 : 무제한
//				.maxSessionsPreventsLogin(false) //false : 이전사용자 세션만료, true: 새로운 사용자 인증 실패
//				
//				.expiredUrl("/")
//				.and()
//			.invalidSessionUrl("/")
//			.sessionFixation()
//				.newSession()
				;
		
		return httpSecurity.build();
	}
	@Bean
	public PasswordEncoder getPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}
}
