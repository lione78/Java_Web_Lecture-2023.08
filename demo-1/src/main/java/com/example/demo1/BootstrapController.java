package com.example.demo1;

import java.io.File;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
@RequestMapping("/bs")
public class BootstrapController {
	@Value("${spring.servlet.multipart.location}")
	private String uploadDir;
	
	@GetMapping("/register")
	public String registerForm() {
		return "bs/register";
	}
	
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
		
		MultipartFile filePart = req.getFile("profile");
		if (filePart.getContentType().contains("image")) {
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

}
