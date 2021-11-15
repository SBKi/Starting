package com.jcpdev.board.entity;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.data.annotation.CreatedDate;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Builder
@ToString
@Table(name = "Whiteboard")
public class WhiteboardEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer whiteboard_no;

	@Column(nullable = false)
	private String whiteboard_id;
	@Column(nullable = false)
	private String whiteboard_img1;

	private String whiteboard_img2;
	private String whiteboard_img3;

	@Column(nullable = false)
	private String whiteboard_content;

	@CreatedDate
	private LocalDateTime whiteboard_date;

	@Column(nullable = false)
	private Integer whiteboard_count;

	@Column(nullable = false)
	private Integer whiteboard_like;

}