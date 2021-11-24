package com.jcpdev.board.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.jcpdev.board.entity.ClientEntity;

public interface ClientRepository extends JpaRepository<ClientEntity, String> {
	
	@Query("select c from ClientEntity c where c.client_email = :client_email and c.client_name = :client_name and c.client_birth = :client_birth")
	Optional<ClientEntity> findId(@Param("client_email") String client_email, @Param("client_name") String client_name, @Param("client_birth") String client_birth);
	
	@Query("select c from ClientEntity c where c.client_id = :client_id and c.client_email = :client_email and c.client_birth = :client_birth")
	Optional<ClientEntity> findPassword(@Param("client_id") String client_id, @Param("client_email") String client_email, @Param("client_birth") String client_birth);
	
	@Query("select c from ClientEntity c where c.client_id = :client_id")
	Optional<ClientEntity> mypage(@Param("client_id")String client_id);
	
	@Query("select c from ClientEntity c ORDER BY client_id DESC")
    List<ClientEntity> findByIdAll();
	
}
