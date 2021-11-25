package com.jcpdev.board.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Heart {
	private int heart_no;
	private String c_heart_client_id;
	private int w_heart_whiteboard_no;

}
