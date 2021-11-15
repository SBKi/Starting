package com.jcpdev.board.model;

import java.time.LocalDateTime;

import javax.persistence.Column;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class Comment {
	private int comment_no;
	private int commentboard_no;
	private String comment_id;
	private String comment_content;
}
