package com.example.demo;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


//@Controller
//@RequestMapping("/bs")
public class BootstrapController {
	@Value("${spring.servlet.multipart.location}")
	private String uploadDir;		// c:temp를 upload directory로 지정

	@GetMapping("/login")
	public String login() {
		return "bs/login";
	}
	
	@PostMapping("/login1")
	@ResponseBody
	public String login1(HttpServletRequest req) {
		String email = req.getParameter("email");
		String pwd = req.getParameter("pwd");
		String remember = req.getParameter("remember");		// check면 on, unchecked면 null
		
		return "<h2>email : " + email + ", pwd : " + pwd + ", remember : " + remember + "</h2>";
	}
	
	@PostMapping("/login2")
	@ResponseBody
	public String login2(String email, String pwd, String remember) {		
		return "<h2>email : " + email + ", pwd : " + pwd + ", remember : " + remember + "</h2>";
	}
	
	@GetMapping("/register")
	public String registerForm() {
		return "bs/register";
	}
	
	// 입력값 확인
	@PostMapping("/register")
	@ResponseBody
	public String registerProc(MultipartHttpServletRequest req) {
		String uid = req.getParameter("uid");
		String pwd = req.getParameter("pwd");
		String pwd2 = req.getParameter("pwd2");
		String uname = req.getParameter("uname");
		String email = req.getParameter("email");
		String gender = req.getParameter("gender");
		String html = String.format("<h2>%s, %s, %s, %s, %s, %s</h2>", uid, pwd, pwd2, uname, email, gender);
		
		// 파일 읽기
		MultipartFile filePart = req.getFile("profile");
		if (filePart.getContentType().contains("image")) {		// 사진을 보냈음
			String filename = filePart.getOriginalFilename();
			String profilePath = uploadDir + filename;
			html += "<h2>" + filename + "</h2>";
			try {
				filePart.transferTo(new File(profilePath));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return html;
	}
	
	// Routing Example, 같은 경로면 뜨다가 죽음.
	// 1) uid 존재 여부
	// 2) password 확인
	// 3) login 화면으로 이동
	@PostMapping("/register2")
	public String register2Proc(MultipartHttpServletRequest req) {
		String uid = req.getParameter("uid");
		String pwd = req.getParameter("pwd");
		String pwd2 = req.getParameter("pwd2");
		String uname = req.getParameter("uname");
		String email = req.getParameter("email");
		String gender = req.getParameter("gender");		
		MultipartFile filePart = req.getFile("profile");
		if (filePart.getContentType().contains("image")) {		// 사진을 보냈음
			String filename = filePart.getOriginalFilename();
			String profilePath = uploadDir + filename;
			try {
				filePart.transferTo(new File(profilePath));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if (!checkUid(uid)) {
			// alert message 내보내고,
			System.out.println("uid: " + uid + "이/가 이미 존재합니다.");
			// 회원 가입 화면으로 되돌려 보내야 함.
			return "redirect:/bs/register";
			
		} else {
			if (pwd != null && pwd.equals(pwd2)) {
				// 올바른 회원 가입
				System.out.println(uname + "님 환영합니다.");
				// 로그인 화면으로 보내 줌.
				return "redirect:/bs/login";
			} else {
				// 패스워드 에러에 대한 경고 메시지
				System.out.println("패스워드를 올바르게 입력하세요.");
				// 회원 가입 화면으로 되돌려 보내야 함.
				return "redirect:/bs/register";
			}
		}
	}
	
	//
	@PostMapping("/register3")
	// Model : springframework
	public String register3Proc(MultipartHttpServletRequest req, Model model) {
		String uid = req.getParameter("uid");
		String pwd = req.getParameter("pwd");
		String pwd2 = req.getParameter("pwd2");
		String uname = req.getParameter("uname");
		String email = req.getParameter("email");
		String gender = req.getParameter("gender");		
		MultipartFile filePart = req.getFile("profile");
		if (filePart.getContentType().contains("image")) {
			String filename = filePart.getOriginalFilename();
			String profilePath = uploadDir + filename;
			try {
				filePart.transferTo(new File(profilePath));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if (!checkUid(uid)) {
			model.addAttribute("msg", "uid: " + uid + "이/가 이미 존재합니다.");
			model.addAttribute("url", "/demo/bs/register");
			return "bs/alertMsg";
			
		} else {
			if (pwd != null && pwd.equals(pwd2)) {
				model.addAttribute("msg", uname + "님 환영합니다.");
				model.addAttribute("url", "/demo/bs/login");
				return "bs/alertMsg";
			} else {
				model.addAttribute("msg", "패스워드를 올바르게 입력하세요.");
				model.addAttribute("url", "/demo/bs/register");
				return "bs/alertMsg";
			}
		}
	}
	
	// uid가 DB에 존재하면 false, 없으면 true
	boolean checkUid(String uid) {
		if (Math.random() < 0.9)
			return true;
		return false;
	}
	
}
