package com.example.demo.member.entity;

import java.time.LocalDateTime;

public class Member {
	private int sid;
	private String userid;
	private String pwd;
	private String uname;
	private String email;
	private int gender;
	private String content;
	private LocalDateTime modTime;
	private int isDeleted;
	
	public Member() { }

	public Member(int sid, String userid, String pwd, String uname, String email, int gender, String content,
			LocalDateTime modTime, int isDeleted) {
		this.sid = sid;
		this.userid = userid;
		this.pwd = pwd;
		this.uname = uname;
		this.email = email;
		this.gender = gender;
		this.content = content;
		this.modTime = modTime;
		this.isDeleted = isDeleted;
	}

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public LocalDateTime getModTime() {
		return modTime;
	}

	public void setModTime(LocalDateTime modTime) {
		this.modTime = modTime;
	}

	public int getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(int isDeleted) {
		this.isDeleted = isDeleted;
	}

	@Override
	public String toString() {
		return "Member [sid=" + sid + ", userid=" + userid + ", pwd=" + pwd + ", uname=" + uname + ", email=" + email
				+ ", gender=" + gender + ", content=" + content + ", modTime=" + modTime + ", isDeleted=" + isDeleted
				+ "]";
	}
}
