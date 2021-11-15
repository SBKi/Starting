package com.jcpdev.board.service;

import com.jcpdev.board.entity.ReportEntity;
import com.jcpdev.board.model.Report;

public interface ReportService {
	default ReportEntity toEntity(Report dto) {

		return ReportEntity.builder().
				report_no(dto.getReport_no()).
				reportboard_no(dto.getReportboard_no()).
				report_id(dto.getReport_id()).
				report_content(dto.getReport_content()).build();
	}

	default Report toDto(ReportEntity entity) {
		return Report.builder().
				report_no(entity.getReport_no()).
				reportboard_no(entity.getReportboard_no()).
				report_id(entity.getReport_id()).
				report_content(entity.getReport_content()).build();
	}
}
