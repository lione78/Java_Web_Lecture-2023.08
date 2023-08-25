package com.example.demo.member.service;

import java.util.List;

import com.example.demo.member.entity.Member;

public interface MemberService {

	Member getMember(int sid);
	
	List<Member> getMemberList(String field, String query);
	
	void insertMember(Member member);
	
	void updateMember(Member member);
	
	void deleteMember(int sid);
}
