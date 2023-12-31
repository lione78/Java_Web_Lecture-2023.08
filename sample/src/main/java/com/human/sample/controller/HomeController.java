package com.human.sample.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {
	
	@GetMapping("/home")	// routing 정보, local:8090/sample/home
	public String home(Model model) {
		model.addAttribute("menu", "home");
		return "home";		// webapp/WEB-INF/view/home.jsp 를 렌더링해서 보여줄 것
	}

	@GetMapping("/index")
	@ResponseBody		// html body에 mapping하여 전달함
	public String index() {
		return "<h1>Welcome to SpringBoot World!!</h1>";
	}
}
