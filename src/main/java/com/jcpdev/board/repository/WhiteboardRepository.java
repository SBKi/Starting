package com.jcpdev.board.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jcpdev.board.entity.WhiteboardEntity;
import com.jcpdev.board.model.Whiteboard;

public interface WhiteboardRepository extends JpaRepository<WhiteboardEntity, Integer>{


}
