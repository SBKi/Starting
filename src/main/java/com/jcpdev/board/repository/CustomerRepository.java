package com.jcpdev.board.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jcpdev.board.entity.CustomerEntity;

public interface CustomerRepository extends JpaRepository<CustomerEntity,Integer> {

}
