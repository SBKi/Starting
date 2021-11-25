package com.jcpdev.board.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.jcpdev.board.entity.InterceptionEntity;

public interface InterceptionRepository extends JpaRepository<InterceptionEntity, Integer> {

	@Query("select i from InterceptionEntity i where i.interception.client_id = :interception_client_id")
	List<InterceptionEntity> findByMyInterception(@Param("interception_client_id") String interception_client_id);

}
