package com.jcpdev.board.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.jcpdev.board.entity.WhiteboardEntity;

public interface WhiteboardRepository extends JpaRepository<WhiteboardEntity, Integer>{
	
	@Query("select wb from WhiteboardEntity wb where wb.whiteboard.client_id = :client_id ORDER BY whiteboard_no DESC")
	List<WhiteboardEntity> findByWhiteboard_Client(@Param("client_id") String client_id);

}
