package com.jcpdev.board.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
@Table(name = "Client")
public class ClientEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private String client_id;
	@Column(name = "client_password",nullable = false)
	private String client_password;
	@Column(name = "client_email",nullable = false)
	private String client_email;
	@Column(name = "client_name",nullable = false)
	private String client_name;
	@Column(name = "client_address", nullable = false)
	private String client_address;
	@Column(name = "client_gender",nullable = false)
	private String client_gender;
	@Column(name = "client_birth",nullable = false)
	private String client_birth;
	@Column(name = "client_tall",nullable = false)
	private Integer client_tall;
	@Column(name = "client_img",nullable = true)
	private String client_img;
	@Column(name = "client_instruction",nullable = false)
	private String client_instruction;
	@Column(name = "client_info",nullable = false)
	private String client_info;
	@Column(name = "client_status",nullable = true)
	private Integer client_status;
}