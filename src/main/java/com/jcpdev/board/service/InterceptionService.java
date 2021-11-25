package com.jcpdev.board.service;

import com.jcpdev.board.entity.ClientEntity;
import com.jcpdev.board.entity.InterceptionEntity;
import com.jcpdev.board.model.Interception;

public interface InterceptionService {
	default InterceptionEntity toEntity(Interception dto) {
		ClientEntity client = ClientEntity.builder().client_id(dto.getInterception_client_id()).build();
		return InterceptionEntity.builder()
				.interception_no(dto.getInterception_no())
				.interception(client)
				.interception_id(dto.getInterception_id()).build();
	}

	default Interception toDto(InterceptionEntity entity) {
		return Interception.builder()
				.interception_no(entity.getInterception_no())
				.interception_client_id(entity.getInterception().getClient_id())
				.interception_id(entity.getInterception_id()).build();
	}
}
