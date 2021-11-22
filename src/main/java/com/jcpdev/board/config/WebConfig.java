package com.jcpdev.board.config;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

	private String resourcePath = "file:///C:/img/test/";
	
	private String uploadPath="/img/**";
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
			registry.addResourceHandler(uploadPath)
			.addResourceLocations(resourcePath);
		}
}
