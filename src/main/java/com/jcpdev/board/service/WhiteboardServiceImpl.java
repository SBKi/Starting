package com.jcpdev.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jcpdev.board.repository.WhiteboardRepository;


@Service
public class WhiteboardServiceImpl implements WhiteboardService {

	@Autowired
	WhiteboardRepository repository;
	
	@Transactional
	public void updateCount(Integer whiteboard_no) {
		repository.updateCount(whiteboard_no);
	}
	
	@Transactional
	public void updateLike(Integer whiteboard_no) {
		repository.updateLike(whiteboard_no);
	}
	
	

}