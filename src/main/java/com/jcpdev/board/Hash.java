package com.jcpdev.board;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import lombok.Data;

@Data
public class Hash {
	
	public String hashtest(String password) throws NoSuchAlgorithmException {
		
		MessageDigest md = MessageDigest.getInstance("SHA-256");
		StringBuilder builder = new StringBuilder();
		for (byte b : md.digest(password.getBytes())) {
			builder.append(String.format("%02x", b));
		}
		
		return builder.toString();
	}

	
	

}
