package com.jcpdev.board.model;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class Whiteboard {

	private int whiteboard_no;
	private String whiteboard_id;
	private String whiteboard_img1;
	private String whiteboard_img2;
	private String whiteboard_img3;
	private String whiteboard_content;
	private LocalDateTime whiteboard_date;
	private int whiteboard_count;
	private int whiteboard_like;

}
