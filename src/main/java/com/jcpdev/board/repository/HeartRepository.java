package com.jcpdev.board.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.jcpdev.board.entity.HeartEntity;

public interface HeartRepository extends JpaRepository<HeartEntity, Integer> {

	@Query("select h from HeartEntity h where h.w_heart.whiteboard_no = :no")
	List<HeartEntity> findByBoardNo(@Param("no") Integer whiteboard_no);
	
	@Query("select h from HeartEntity h where h.c_heart.client_id = :id")
	List<HeartEntity> findByIdtoIdx(@Param("id") String id);
	
}
