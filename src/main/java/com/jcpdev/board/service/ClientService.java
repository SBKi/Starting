package com.jcpdev.board.service;

import com.jcpdev.board.entity.ClientEntity;
import com.jcpdev.board.model.Client;

public interface ClientService {
	default ClientEntity toEntity(Client dto) {

		return ClientEntity.builder().client_id(dto.getClient_id()).client_password(dto.getClient_password())
				.client_email(dto.getClient_email()).client_name(dto.getClient_name())
				.client_address(dto.getClient_address()).client_gender(dto.getClient_gender())
				.client_birth(dto.getClient_birth()).client_birth(dto.getClient_birth())
				.client_tall(dto.getClient_tall()).client_img(dto.getClient_img())
				.client_instruction(dto.getClient_instruction()).client_info(dto.getClient_info()).build();
	}

	default Client toDto(ClientEntity entity) {
		return Client.builder().client_id(entity.getClient_id()).client_password(entity.getClient_password())
				.client_email(entity.getClient_email()).client_name(entity.getClient_name())
				.client_address(entity.getClient_address()).client_gender(entity.getClient_gender())
				.client_birth(entity.getClient_birth()).client_tall(entity.getClient_tall())
				.client_img(entity.getClient_img()).client_instruction(entity.getClient_instruction())
				.client_info(entity.getClient_info()).build();
	}

	default ClientEntity login(Client dto) {
		ClientEntity login = ClientEntity.builder().client_id(dto.getClient_id())
				.client_password(dto.getClient_password()).build();
		return login;
	}

}