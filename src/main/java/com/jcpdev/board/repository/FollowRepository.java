package com.jcpdev.board.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.jcpdev.board.entity.FollowEntity;
public interface FollowRepository extends JpaRepository<FollowEntity, Integer> {

   @Query("select f from FollowEntity f where f.follow.client_id = :follow_client_id")
   List<FollowEntity> findByMyFollow(@Param("follow_client_id") String follow_client_id);
   
   @Query("select f from FollowEntity f where f.following_id = :following_id")
   List<FollowEntity> findByYourFollow(@Param("following_id") String following_id);
   
   @Query("select count(f) from FollowEntity f where f.follow.client_id = :client_id")
   String findFollowerCount(@Param("client_id") String client_id);
   
   @Query("select count(f) from FollowEntity f where f.following_id = :client_id")
   String findFollowingCount(@Param("client_id") String client_id);
}