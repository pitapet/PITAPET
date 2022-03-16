package com.kh.pitapet.member.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private int no;
	
	private String id;
	
	private String password;
	
	private String role;
	
	private String name;
	
	private String nickname;
	
	private String phone;
	
	private String email;
	
	private String address;
	
	private String pet;
	
	private String status;
	
	private Date enrollDate;
	
	private Date modifyDate;

	public Member(String id, String password, String name, String email) {
		this.id = id;
		this.password = password;
		this.name = name;
		this.email = email;
	}
}