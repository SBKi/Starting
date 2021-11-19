package com.jcpdev.board.service;

import com.jcpdev.board.entity.ClientEntity;
import com.jcpdev.board.entity.FollowEntity;
import com.jcpdev.board.model.Follow;

public interface FollowService {
	default FollowEntity toEntity(Follow dto) {

		ClientEntity client = ClientEntity.builder().client_id(dto.getFollow_client_id()).build();
		return FollowEntity.builder().
				follow_no(dto.getFollow_no()).
				follow(client).
				following_id(dto.getFollowing_id()).build();
	}

	default Follow toDto(FollowEntity entity) {
		return Follow.builder().
				follow_no(entity.getFollow_no()).
				follow_client_id(entity.getFollow().getClient_id()).
				following_id(entity.getFollowing_id()).build();
	}
}
