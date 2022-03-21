package com.kh.pitapet.member.model.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kh.pitapet.member.model.vo.Member;

@Mapper
public interface MemberMapper {

	Member findMemberById(@Param("id") String id);

	int insertMember(Member member);

	int updateMember(Member member);

	int deleteMember(int no);

	Member findId(@Param("name") String name, @Param("email") String email);

	void updatePw(@Param("id") String id, @Param("password") String password);

	String findEmail(@Param("id") String id, @Param("email") String email);

	Member findMemberByEmail(@Param("email") String email);

	Member checkPw(String password);

	String pwCheck(@Param("id") String userId);

	String findPet(String userId);

	void updatePet(@Param("id") String userId, @Param("pet") String newPet);

}