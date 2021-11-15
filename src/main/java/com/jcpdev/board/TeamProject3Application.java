package com.jcpdev.board;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@EnableJpaAuditing // AuditingEntityListener 활성화
@SpringBootApplication
public class TeamProject3Application {

	public static void main(String[] args) {
		SpringApplication.run(TeamProject3Application.class, args);

	}

}
