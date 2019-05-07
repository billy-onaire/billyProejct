package org.kh.billy.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.kh.billy.member.model.service.MemberService;
import org.kh.billy.member.model.vo.Member;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {
   
   private static final Logger logger = 
         LoggerFactory.getLogger(MemberController.class);
    	
   @Autowired
   private MemberService memberService;
   
   @RequestMapping(value="login.do")
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
   
   @RequestMapping(value="minsert.do", method=RequestMethod.POST)
	public String insertMember(Member member, HttpServletRequest request, Model model) {
		logger.info("member : " + member);
		
		/*//패스워드 암호화처리
		member.setUserpwd(
			bcryptPasswordEncoder.encode(member.getUserpwd()));
				*/
		if(memberService.insertMember(member) > 0)
			return "home";
		else {
			model.addAttribute("message", "회원 가입 실패!");
			return "common/error";
		}
	}
   
	@RequestMapping(value="joinPost", method=RequestMethod.POST)
	public String joinPost(@ModelAttribute("member") Member member) throws Exception {
		logger.info("currnent join member: " + member.toString());
		memberService.create(member);
		
		return "/member/joinPost";
	}
	

	@RequestMapping(value="joinConfirm", method=RequestMethod.GET)
	public String emailConfirm(@ModelAttribute("member") Member member, Model model) throws Exception {
		logger.info(member.getEmail() + ": auth confirmed");
		member.setAuthstatus(1);	// authstatus를 1로,, 권한 업데이트
		memberService.updateAuthstatus(member);
		
		model.addAttribute("auth_check", 1);
		
		return "/user/joinPost";
	}
   
  
   


}