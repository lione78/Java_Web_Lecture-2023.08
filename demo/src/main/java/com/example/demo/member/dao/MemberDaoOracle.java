package com.example.demo.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.member.entity.Member;

@Mapper
public interface MemberDaoOracle {

	@Select("select * from member1 where sid = #{sid}")
	Member getMember(int sid);
	
	@Select("select * from member1 where ${field} like #{query} and isDeleted=0"
			+ " order by modTime desc")
	List<Member> getMemberList(String field, String query);
	
	@Insert("insert into member1(userid, pwd, uname, email, gender, content) "
			+ "values (#{userid}, #{pwd}, #{uname}, #{email}, #{gender}, #{content, jdbcType=VARCHAR})") 
	void insertMember(Member member);
	
	@Update("update member1 set userid=#{userid}, pwd=#{pwd}, uname=#{uname}, email=#{email}, "
			+ "gender=#{gender}, content=#{content, jdbcType=VARCHAR}, modTime = current_timestamp where sid=#{sid}")
	void updateMember(Member member);
	
	@Update("update member1 set isDeleted=1 where sid=#{sid}")
	void deleteMember(int sid);
}
