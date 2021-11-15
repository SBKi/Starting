package com.jcpdev.board.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jcpdev.board.entity.ClientEntity;

public interface ClientRepository extends JpaRepository<ClientEntity, Integer> {

}
