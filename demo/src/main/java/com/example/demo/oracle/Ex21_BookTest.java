package com.example.demo.oracle;

import java.util.ArrayList;
import java.util.List;

public class Ex21_BookTest {

	public static void main(String[] args) {
		BookDao bDao = new BookDao();
				
		// bDao.getBook(int bookId)
//		Book book1 = bDao.getBook(2);
//		System.out.println(book1);
		
		
		// bDao.insertBook(Book book)
//		Book book3 = new Book(14, "이것이 자바다", "한빛미디어", 35000);
//		bDao.insertBook(book3);
//		
		// bDao.updateBook(Book book)
//		Book book4 = new Book(14, "이것이 자바다", "한빛미디어", 35000);
//		bDao.updateBook(book4);
		
		// bDao.deleteBook(int bookId)
//		bDao.deleteBook(14);
		
		// BookName 축구인 리스트
		List<Book> list = bDao.getBookListByFieldAndQuery("booKname", "스포");
		
		// bDao.getBookList()
//		List<Book> list = bDao.getBookList();
//		for(Book book2 : list) {
//			System.out.println(book2);
//		}
		list.forEach(x -> System.out.println(x));
		
	}
}
