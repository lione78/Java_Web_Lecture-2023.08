package com.example.demo.oracle;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class BookDao {
	private String host;
	private String user;
	private String password;
	private String database;
	private int port;
	
	public BookDao() {
		this.host = "localhost";
		this.user = "hmuser";
		this.password = "hmpass";
		this.database = "xe";
		this.port = 1521;		
	}
	
	Connection myConnection() {
		Connection conn = null;
		try {
			String strconn = "jdbc:oracle:thin:@" + host + ":" + port + ":" + database;
			conn = DriverManager.getConnection(strconn, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public Book getBook(int bookId){
		Connection conn = myConnection();
		Book book = null;
		String sql = "select * from book where bookid = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bookId);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				bookId = rs.getInt(1);
				String bookName = rs.getString(2);
				String publisher = rs.getString(3);
				int price = rs.getInt(4);
				book = new Book(bookId, bookName, publisher, price);
			}
			rs.close(); pstmt.close(); conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return book;
	}
	
	public List<Book> getBookList(){
		Connection conn = myConnection();
		List<Book> list = new ArrayList<>();
		String sql = "select * from book";
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				int bookId = rs.getInt(1);
				String bookName = rs.getString(2);
				String publisher = rs.getString(3);
				int price = rs.getInt(4);
				Book book = new Book(bookId, bookName, publisher, price);
				list.add(book);
			}
			rs.close(); stmt.close(); conn.close();			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public void insertBook(Book book) {
		Connection conn = myConnection();
		String sql = "insert into book values(?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, book.getBookId());
			pstmt.setString(2, book.getBookName());
			pstmt.setString(3, book.getPublisher());
			pstmt.setInt(4, book.getPrice());
			
			pstmt.executeUpdate();
			pstmt.close(); conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updateBook(Book book) {
		Connection conn = myConnection();
		String sql = "update book set bookname = ?, publisher = ?, price = ? where bookid = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, book.getBookName());
			pstmt.setString(2, book.getPublisher());
			pstmt.setInt(3, book.getPrice());
			pstmt.setInt(4, book.getBookId());
			
			pstmt.executeUpdate();
			pstmt.close(); conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deleteBook(int bookID) {
		Connection conn = myConnection();
		try {
			String sql = "delete from book where bookid = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bookID);
			
			pstmt.executeUpdate();
			pstmt.close(); conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
