package com.jcpdev.board.repository;

import java.util.List;

import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;

import com.jcpdev.board.entity.ClientEntity;
import com.jcpdev.board.model.Client;

public interface ClientRepository extends JpaRepository<ClientEntity, String> {
	
	// 아이디 찾기
//	@Query("select c.* from Client c where c.client.client_email = :client_email and c.client.client_name = :client_name and c.client.client_birth = :client_birth")
//	public List<Client> findID(@Param("client_email")String client_email, @Param("client_name")String client_name, @Param("client_birth")String client_birth);
//	
//	//비밀번호 찾기
//	@Query("select c.* from Client c where  c.client.client_id = :client_id and c.client.client_email = :client_name and c.client.client_name = :client_name")
//	public List<Client> findPassword(@Param("client_id")String client_id, @Param("client_email")String client_email, @Param("")String client_name);
}
