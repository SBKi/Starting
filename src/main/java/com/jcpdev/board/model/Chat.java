
package com.jcpdev.board.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class Chat {
	private Integer chat_no;
	private String roomid;
	private String writer;
	private String message;
}

