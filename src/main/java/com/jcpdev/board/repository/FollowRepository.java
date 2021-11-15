package com.jcpdev.board.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jcpdev.board.entity.FollowEntity;
import com.jcpdev.board.model.Follow;
public interface FollowRepository extends JpaRepository<FollowEntity, Integer> {

}
