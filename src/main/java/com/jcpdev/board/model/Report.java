package com.jcpdev.board.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Report {
	private int report_no;
	private int w_report_whiteboard_no;
	private String c_report_client_id;
	private String report_content;


}
