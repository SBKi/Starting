package com.jcpdev.board.repository;

import java.util.List;

import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;

import com.jcpdev.board.entity.ClientEntity;
import com.jcpdev.board.model.Client;

public interface ClientRepository extends JpaRepository<ClientEntity, String> {
	
}
