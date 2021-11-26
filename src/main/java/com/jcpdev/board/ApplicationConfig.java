package com.jcpdev.board;

import java.util.Arrays;
import java.util.List;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.jcpdev.board.interceptor.LoginInterceptor;

@Configuration
public class ApplicationConfig  implements WebMvcConfigurer{
	
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		List<String> patterns= Arrays.asList("/*","/*/*");
		List<String> excludes=Arrays.asList("/starting/login*","/starting/join","/starting/logout","/starting/logincheck","/starting/register","/starting/find_id","/starting/find_id_C","/starting/find_password","/starting/find_password_C","/starting/find_password_Com","/starting/checkId");
		registry.addInterceptor(new LoginInterceptor())
		.addPathPatterns(patterns).excludePathPatterns(excludes);
	}
	
}