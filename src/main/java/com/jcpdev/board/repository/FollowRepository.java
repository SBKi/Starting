package com.jcpdev.board.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
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
	//언팔로잉 내가 상대방을
	@Transactional
	@Modifying
	@Query("delete from FollowEntity f where f.follow.client_id  = :myId and f.following_id = :other_id ")
	String unFollowing(@Param("myId") String myid, @Param("other_id") String other_id);
	
	@Query("select f.follow_no from FollowEntity f where f.follow.client_id  = :myId and f.following_id = :other_id ")
	Integer un_Following(@Param("myId") String myid, @Param("other_id") String other_id);
	//언팔로우 상대방이 나를
	@Transactional
	@Modifying
	@Query("delete from FollowEntity f where f.follow.client_id  = :other_id and f.following_id = :myId ")
	String unFollow(@Param("other_id") String other_id, @Param("myId") String myid);
	
	@Query("select f.follow_no from FollowEntity f where f.follow.client_id  = :other_id and f.following_id = :myId ")
	Integer un_Follow(@Param("other_id") String other_id, @Param("myId") String myid);
	
	/*
	 * @Query("select f from FollowEntity f where f.follow.client_id = :myId and f.follwing_id = :other_id "
	 * ) String follow_check(@Param("myId") String myId, @Param("other_id") String
	 * other_id);
	 */
}