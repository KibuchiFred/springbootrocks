package com.spring.boot.rocks;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class ZHelper_PasswordEncoder {

	public static void main(String[] args) {
		String password = "admin@admin";
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		System.out.println("Encoded password is " + passwordEncoder.encode(password));
	}

}