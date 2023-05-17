package com.ware.group.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@Configuration
//***-contentx.xml
public class WebConfig implements WebMvcConfigurer{
	
	@Value("${app.upload.base}")
	private String basePath;
	
	@Value("${app.url.path}")
	private String urlPath;
	
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		//<resources mapping="/resources/**" location="/resources/" />
		//<resources mapping="/resources/file/**" location="D:/production/upload/>
		registry.addResourceHandler(urlPath) //요청 URL 주소
				.addResourceLocations(basePath);
		
	}

}
