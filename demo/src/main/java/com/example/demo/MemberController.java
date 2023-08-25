package com.example.demo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

//@Controller
//@RequestMapping("/member")
public class MemberController {
	
	@GetMapping("/memberSample")
	public String memberSample(Model model) {
		AddressSample addr1 = new AddressSample(12311, "안산", "한국");
		AddressSample addr2 = new AddressSample(23211, "일산", "한국");
		AddressSample addr3 = new AddressSample(12352, "LA", "미국");
		
		CarSample car1 = new CarSample(123, "카니발", "검은색", "대형", "금호");
		CarSample car2 = new CarSample(124, "소나타", "흰색", "중형", "한국");
		CarSample car3 = new CarSample(125, "아반떼", "빨강", "준중형", "컨티넨털");
		
		MemberSample member1 = new MemberSample(01, "영수", addr1, car1);
		MemberSample member2 = new MemberSample(02, "철수", addr2, car2);
		MemberSample member3 = new MemberSample(03, "영희", addr3, car3);
		
		List<MemberSample> list = new ArrayList<>();
		list.add(member1);
		list.add(member2);
		list.add(member3);
		
		model.addAttribute("member", list);
		
		return "jsp/membersample";
	}
	

}
