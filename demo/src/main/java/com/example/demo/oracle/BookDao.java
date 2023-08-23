package com.example.demo.oracle;

import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

public class BookDao {
	private String host;
	private String user;
	private String password;
	private String database;
	private String port;	// 파일에서 읽으면 String으로 변환
	
	public BookDao() {		// 절대 경로 알아야함.
		try {
			Properties props = new Properties();
			String filename = "D:/JavaWeb/demo/src/main/java/com/example/demo/oracle/oracle.properties";
			InputStream is = new FileInputStream(filename);
			props.load(is);
			is.close();
			
			this.host = props.getProperty("host");
			this.user = props.getProperty("user");
			this.password = props.getProperty("password");
			this.database = props.getProperty("database");
			this.port = props.getProperty("port");
		} catch (Exception e) {
			e.printStackTrace();
		}
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
	
	public List<Book> getBookListByFieldAndQuery(String field, String query){
		Connection conn = myConnection();
		List<Book> list = new ArrayList<>();
		String str = field.toLowerCase();
		String sql = "select * from book where " + str + " like ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			if( str.equals("bookid") || str.equals("price"))
				pstmt.setInt(1, Integer.parseInt(query));
			if( str.equals("bookname") || str.equals("publisher"))
				pstmt.setString(1, "%" + query + "%");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				Book b = new Book(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4));
				list.add(b);
			}
			rs.close(); pstmt.close(); conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
}
