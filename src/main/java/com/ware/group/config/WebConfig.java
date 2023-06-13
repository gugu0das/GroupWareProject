package com.ware.group.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
	
	@Value("${app.upload.base}")
	private String basePath;
	
	@Value("${app.url.path}")
	private String urlPath;
	
	@Value("${app.upload.approval.base}")
	private String base;
	
	@Value("${app.url.approval.path}")
	private String url;
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		
		registry.addResourceHandler(urlPath)
				.addResourceLocations(basePath);
		
		registry.addResourceHandler(url)
		
		.addResourceLocations(base);
	}
}	
