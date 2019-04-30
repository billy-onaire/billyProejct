package org.kh.billy.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	@RequestMapping("login.do")
	public String loginPage() {
		return "member/login";
	}
	
	@RequestMapping("mfind.do")
	public String findPage() {
		return "member/findPage";
	}
	
	@RequestMapping("enroll.do")
	public String enrollPage() {
		return "member/enrollPage";
	}
		
	
}
