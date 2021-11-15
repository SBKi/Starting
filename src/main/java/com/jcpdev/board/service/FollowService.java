package com.jcpdev.board.service;

import com.jcpdev.board.entity.FollowEntity;
import com.jcpdev.board.model.Follow;

public interface FollowService {
	default FollowEntity toEntity(Follow dto) {

		return FollowEntity.builder().
				follow_no(dto.getFollow_no()).
				follow_id(dto.getFollow_id()).
				following_id(dto.getFollowing_id()).build();
	}

	default Follow toDto(FollowEntity entity) {
		return Follow.builder().
				follow_no(entity.getFollow_no()).
				follow_id(entity.getFollow_id()).
				following_id(entity.getFollowing_id()).build();
	}
}
