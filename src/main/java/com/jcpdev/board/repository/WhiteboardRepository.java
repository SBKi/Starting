package com.jcpdev.board.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.jcpdev.board.entity.WhiteboardEntity;

public interface WhiteboardRepository extends JpaRepository<WhiteboardEntity, Integer> {

//	@Query("select wb from WhiteboardEntity wb where wb.whiteboard.client_id = :client_id ORDER BY whiteboard_no DESC")
//	List<WhiteboardEntity> findByWhiteboard_Client(@Param("client_id") String client_id);

	@Query("select wb from WhiteboardEntity wb ORDER BY whiteboard_no DESC")
	List<WhiteboardEntity> findByWhiteboard_Client();

	@Transactional
	@Modifying
	@Query("update WhiteboardEntity wb set wb.whiteboard_count = wb.whiteboard_count +1 where wb.whiteboard_no = :whiteboard_no")
	void updateCount(@Param("whiteboard_no") Integer whiteboard_no);

	@Transactional
	@Modifying
	@Query("update WhiteboardEntity wb set wb.whiteboard_like = (select count(*) from HeartEntity h where h.w_heart.whiteboard_no = :whiteboard_no) where wb.whiteboard_no = :whiteboard_no")
	void updateLike(@Param("whiteboard_no") Integer whiteboard_no);

	@Query("select wb from WhiteboardEntity wb where wb.whiteboard.client_id = :client_id ORDER BY whiteboard_no DESC")
	List<WhiteboardEntity> findByWhiteboard_Client1(@Param("client_id") String client_id);

	@Query("select count(wb) from WhiteboardEntity wb where wb.whiteboard.client_id = :client_id")
	String findBoardCount(@Param("client_id") String client_id);

	@Query("select w from WhiteboardEntity w where w.whiteboard.client_id not in((select i.interception.client_id from InterceptionEntity i where i.interception_id = :client_id)) ORDER BY w.whiteboard_no DESC")
	List<WhiteboardEntity> findByWhiteboard(@Param("client_id") String client_id);
}
