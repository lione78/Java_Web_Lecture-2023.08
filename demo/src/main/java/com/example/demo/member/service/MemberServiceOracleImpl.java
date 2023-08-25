package com.example.demo.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.member.dao.MemberDaoOracle;
import com.example.demo.member.entity.Member;

@Service
public class MemberServiceOracleImpl implements MemberService{
	@Autowired private MemberDaoOracle memberDao;
	
	@Override
	public Member getMember(int sid) {
		Member member = memberDao.getMember(sid);
		return member;
	}

	@Override
	public List<Member> getMemberList(String field, String query) {
		query = "%" + query + "%";
		List<Member> list = memberDao.getMemberList(field, query);
		return list;
	}

	@Override
	public void insertMember(Member member) {
		memberDao.insertMember(member);
	}

	@Override
	public void updateMember(Member member) {
		memberDao.updateMember(member);
	}

	@Override
	public void deleteMember(int sid) {
		memberDao.deleteMember(sid);
	}

}
