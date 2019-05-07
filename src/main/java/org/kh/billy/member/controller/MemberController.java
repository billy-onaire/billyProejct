package org.kh.billy.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonNode;
import org.kh.billy.member.model.service.MemberService;
import org.kh.billy.member.model.vo.Member;
import org.kh.billy.socialuser.controller.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

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
   
   @RequestMapping(value="mupage.do")
   public String memberUpdatePage(Member member, HttpServletRequest request, Model model) {
	   return "member/memberDetailPage";
   }
   
   @RequestMapping(value="mupdate.do")
   public String updateMember(Member member, HttpServletRequest request, Model model) {
	   return "member/memberDetailPage";
   }
   
   @RequestMapping(value="mdelete.do")
   public String deleteMember(Member member, HttpServletRequest request, Model model) {
	   return "member/memberManagementPage";
   }
   
   @RequestMapping(value = "/oauth", produces = "application/json")
   public String kakaoLogin(@RequestParam("code") String code, Model model, HttpSession session,
          HttpServletRequest request, HttpServletResponse response) {
       System.out.println("로그인 할때 임시 코드값");
       //카카오 홈페이지에서 받은 결과 코드
       System.out.println(code);
       System.out.println("로그인 후 결과값");
       
       KakaoController kakaoLogin = new KakaoController();
       //결과값을 node에 담아줌
       JsonNode node = kakaoLogin.getAccessToken(code);
       //결과값 출력
       System.out.println(node);
       //노드 안에 있는 access_token값을 꺼내 문자열로 변환
       String token = node.get("access_token").toString();
       //세션에 담아준다.
       session.setAttribute("token", token);
       System.out.println("token : " + token);
       
       return "home";
   }

}