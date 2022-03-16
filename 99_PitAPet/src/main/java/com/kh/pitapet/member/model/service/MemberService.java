package com.kh.pitapet.member.model.service;

import java.util.Map;

import com.kh.pitapet.member.model.vo.Member;

public interface MemberService {

	Member findMemberById(String id);
	
	Member login(String id, String password);

	int save(Member member);

	Boolean isDuplicateID(String userId);
	
	int delete(int no);

	Member findId(String name, String email);

	void findPw(String id, String email);

	String findEmail(String id, String email);


}