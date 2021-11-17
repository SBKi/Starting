package com.jcpdev.board.repository;

import java.util.List;

import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.jpa.repository.JpaRepository;

import com.jcpdev.board.entity.ClientEntity;
import com.jcpdev.board.model.Client;

public interface ClientRepository extends JpaRepository<ClientEntity, String> {
	
	// 아이디 찾기
	@Query("select c.* from Client c where client_email like ?1 and client_name like ?2 and client_birth like ?3")
	public List<Client> findID(String client_email, String client_name, String client_birth);
	
	//비밀번호 찾기
	@Query("select c.* from Client c where client_id like ?1 and client_email like ?2 and client_name like ?3")
	public List<Client> findPassword(String client_id, String client_email, String client_name);
}
