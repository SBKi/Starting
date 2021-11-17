package com.jcpdev.board.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jcpdev.board.entity.WhiteboardEntity;

public interface WhiteboardRepository extends JpaRepository<WhiteboardEntity, Integer>{

}
