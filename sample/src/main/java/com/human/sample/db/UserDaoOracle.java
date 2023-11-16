package com.human.sample.db;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.human.sample.entity.User;

@Mapper
public interface UserDaoOracle {
	
	// \" escape 문자로 oracle에서는 uid 쓰고 있어 "uid"로
	// MyBatis에서만 사용 가능 / JPA 요즘
	@Select("select * from users where \"uid\"=#{uid}")
	public User getUser(String uid);	// user object 만들어서 넘겨줌

	// #{uid} --> user.getUid() 호출
	@Insert("insert into users values (#{uid}, #{pwd}, #{uname}, #{email}, default, default)")
	public void insertUser(User user);
}
