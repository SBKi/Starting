package com.jcpdev.board.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jcpdev.board.entity.ReportEntity;
import com.jcpdev.board.model.Report;
public interface ReportRepository extends JpaRepository<ReportEntity, Integer> {

}
