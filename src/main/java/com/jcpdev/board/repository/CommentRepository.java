package com.jcpdev.board.repository;

import java.util.List;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.jcpdev.board.entity.CommentEntity;

public interface CommentRepository extends JpaRepository<CommentEntity, Integer>{
	
//	@NamedQuery(
//            name="findAllCustomersWithName",
//            query="SELECT c FROM Customer c WHERE c.name LIKE :custName"
//    )
	
	//entity로 CRUD 함.
	@Query("select c from CommentEntity c where c.comment.whiteboard_no = :commentboard_no")
	List<CommentEntity> findByCommentboard_no(@Param("commentboard_no") Integer commentboard_no);
	
	
}