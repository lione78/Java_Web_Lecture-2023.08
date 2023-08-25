package com.example.demo.blog;

import java.util.List;

// BlogDaoOracle(@Mapper)에서 Signature만 가져옴. 
public interface BlogService {

	Blog getBlog(int bid);
	
	List<Blog> getBlogList(String field, String query);
	
	void insertBlog(Blog blog);
	
	void updateBlog(Blog blog);
	
	void deleteBlog(int bid);
	
	void increaseViewCount(int bid);
}
