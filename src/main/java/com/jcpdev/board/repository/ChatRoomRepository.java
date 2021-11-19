package com.jcpdev.board.repository;


import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.jcpdev.board.entity.ChatEntity;

public interface ChatRoomRepository extends JpaRepository<ChatEntity, Integer>{
	
	@Query("select c from ChatEntity c where c.roomid = :myid or c.roomid = :id")
	List<ChatEntity>findcustom(@Param("myid") String myid, @Param("id")String id);

}