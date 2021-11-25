package com.jcpdev.board.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Builder
@ToString
@Table(name = "Interception")
public class InterceptionEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer interception_no;
	
	
	@Column(nullable = false)
	private String interception_id;
	
	@ManyToOne(targetEntity = ClientEntity.class)
	private ClientEntity interception;
	
}
