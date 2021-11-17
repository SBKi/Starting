package com.jcpdev.board.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Client {
	private String client_id;
	private String client_password;
	private String client_email;
	private String client_name;
	private String client_address;
	private String client_gender;
	private String client_birth;
	private Integer client_tall;
	private String client_img;
	private String client_instruction;
	private String client_info;
	private Integer client_status;

}
