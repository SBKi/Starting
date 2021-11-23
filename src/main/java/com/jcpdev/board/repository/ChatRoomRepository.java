package com.jcpdev.board.repository;


import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.jcpdev.board.entity.ChatEntity;

public interface ChatRoomRepository extends JpaRepository<ChatEntity, Integer>{
	
	@Query("select c from ChatEntity c where SUBSTRING_INDEX(c.roomid, '@', 1) = :id or SUBSTRING_INDEX(c.roomid, '@', -1) = :id  GROUP BY c.roomid")
	List<ChatEntity>findcustom(@Param("id")String id);

	@Query("select c from ChatEntity c where c.roomid = :id or c.roomid = :id2")
	List<ChatEntity>findchatlist(@Param("id")String id, @Param("id2")String id2);
	
}