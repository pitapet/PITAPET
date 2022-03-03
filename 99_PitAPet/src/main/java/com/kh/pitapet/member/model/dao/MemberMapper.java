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

}