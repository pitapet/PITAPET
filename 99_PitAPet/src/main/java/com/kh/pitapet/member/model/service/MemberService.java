package com.kh.pitapet.member.model.service;

import com.kh.pitapet.member.model.vo.Member;

public interface MemberService {

	Member findMemberById(String id);
	
	Member login(String id, String password);

	int save(Member member);

	Boolean isDuplicateID(String userId);

	int delete(int no);

}