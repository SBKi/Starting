package com.jcpdev.board.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jcpdev.board.entity.CommentEntity;

public interface CommentRepository extends JpaRepository<CommentEntity, Integer>{

}