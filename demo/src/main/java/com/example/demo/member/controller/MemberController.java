package com.example.demo.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.member.entity.Member;
import com.example.demo.member.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired private MemberService memberService;

	@GetMapping("/list")
	public String list(@RequestParam(name="f", defaultValue="userid") String field, 
			@RequestParam(name="q", defaultValue="") String query, Model model) {
		List<Member> list = memberService.getMemberList(field, query);
		model.addAttribute("memberList", list);
		model.addAttribute("menu", "register");
		model.addAttribute("field", field);
		model.addAttribute("query", query);
		return "member/list";
	}
	
	@GetMapping("/register")
	public String registerForm(Model model) {
		model.addAttribute("menu", "register");
		return "member/register";
	}
	
	@PostMapping("/register")
	public String registerProc(Member member) {
		memberService.insertMember(member);
		return "redirect:/member/login";
	}
	
	@GetMapping("/detail/{sid}")
	public String detail(@PathVariable int sid, Model model) {
		Member member = memberService.getMember(sid);
		model.addAttribute("member", member);
		model.addAttribute("menu", "register");
		return "member/detail";
	}
	
	@GetMapping("/update/{sid}")
	public String updateForm(@PathVariable int sid, Model model) {
		Member member = memberService.getMember(sid);
		model.addAttribute("member", member);
		model.addAttribute("menu", "register");
		return "member/update";
	}
		
	@PostMapping("/update")
	public String updateProc(Member member) {
		memberService.updateMember(member);
		return "redirect:/member/detail/" + member.getSid();
	}
	
	@GetMapping("/deleteConfirm/{sid}")
	public String deleteConfirm(@PathVariable int sid) {
		memberService.deleteMember(sid);
		return "redirect:/member/list";
	}
	
	@GetMapping("/login")
	public String login() {
		return "member/login";
	}
}
