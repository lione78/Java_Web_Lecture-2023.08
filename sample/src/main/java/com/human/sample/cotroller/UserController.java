package com.human.sample.cotroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.human.sample.entity.User;

@Controller
@RequestMapping("/user")		// /sample/user로 routing
public class UserController {

	@GetMapping("/register")
	public String register() {
		return "user/register";
	}
	
	@PostMapping("/register")
	public String registerProc(String uid, String pwd, String pwd2, String uname, String email) {
		User user = new User(uid, pwd, uname, email);
		System.out.println(user);
		return "redirect:/home";
	}
}
