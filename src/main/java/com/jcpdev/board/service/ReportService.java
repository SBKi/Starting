package com.jcpdev.board.service;

import com.jcpdev.board.entity.ClientEntity;
import com.jcpdev.board.entity.ReportEntity;
import com.jcpdev.board.entity.WhiteboardEntity;
import com.jcpdev.board.model.Report;

public interface ReportService {
	default ReportEntity toEntity(Report dto) {
		ClientEntity client = ClientEntity.builder().client_id(dto.getC_report_client_id()).build();
		WhiteboardEntity whiteboard = WhiteboardEntity.builder().whiteboard_no(dto.getW_report_whiteboard_no()).build();
		return ReportEntity.builder().
				report_no(dto.getReport_no()).
				w_report(whiteboard).
				c_report(client).
				report_content(dto.getReport_content()).build();
	}

	default Report toDto(ReportEntity entity) {
		return Report.builder().
				report_no(entity.getReport_no()).
				w_report_whiteboard_no(entity.getW_report().getWhiteboard_no()).
				c_report_client_id(entity.getC_report().getClient_id()).
				report_content(entity.getReport_content()).build();
	}
}
