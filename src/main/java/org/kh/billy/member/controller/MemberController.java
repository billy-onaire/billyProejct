package org.kh.billy.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonNode;
import org.kh.billy.member.model.service.MemberService;
import org.kh.billy.member.model.vo.Member;
import org.kh.billy.socialuser.controller.KakaoSocialController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class MemberController {
   
   private static final Logger logger = 
         LoggerFactory.getLogger(MemberController.class);
       
   @Autowired
   private MemberService memberService;
   
   @Autowired
   private BCryptPasswordEncoder bcryptPE;
   
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
   
   //로그인 아이디 체크
   @RequestMapping(value="loginCheck.do", method=RequestMethod.POST)
   public String selectCheckId(Model model, HttpSession session, SessionStatus status, Member member/*@RequestParam(name="user_pwd") String userPwd, @RequestParam(name="user_id") String userId*/) {
	   System.out.println("전송온 암호 : " + member.getUser_pwd());
	   Member user = memberService.selectCheckId(member.getUser_id());
	   System.out.println("디비갔다온 값 : " + user);
	   if(user != null) {
		   System.out.println("비교결과 : " + bcryptPE.matches(member.getUser_pwd(), user.getUser_pwd()));
		   if(bcryptPE.matches(member.getUser_pwd(), user.getUser_pwd())) {
			   System.out.println("첫번째?");
		   session.setAttribute("loginMember", user.getUser_id());
		   status.isComplete();
		   
		   return "home";
		   }else {
			   System.out.println("두번째?");
			   model.addAttribute("message", "로그인 실패!");
			   return "member/memberError";
		   }
	   }else {
		   System.out.println("세번째?");
		   model.addAttribute("message", "로그인 실패!");
		   return "member/memberError";
	   }
	   
   }
   
   @RequestMapping(value="minsert.do", method=RequestMethod.POST)

	public String insertMember(Member member, HttpServletRequest request, Model model) {
		logger.info("member : " + member);
		
		//패스워드 암호화처리
		member.setUser_pwd(bcryptPE.encode(member.getUser_pwd()));
				
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
   
   @RequestMapping(value = "joinPost.do", method = RequestMethod.POST)
   public String RegisterPost(Member member, Model model, RedirectAttributes rttr, HttpServletRequest request, HttpSession session) throws Exception {
      logger.info("회원가입...");
      logger.info(member.toString());
      memberService.create(member);
      rttr.addFlashAttribute("authmsg" , "가입시 기재한 이메일로 인증해주세요");
      return "redirect:/";
   }
   
   @RequestMapping(value="joinConfirm.do", method=RequestMethod.GET)
   public String emailConfirm(@ModelAttribute("Member") Member member, Model model) throws Exception {
      logger.info(member.getEmail() + ": auth confirmed");
      member.setVerify("y");   // authstatus를 1로,, 권한 업데이트
      memberService.updateVerify(member);
      
      model.addAttribute("verify", "y");
      
      return "joinPost.do";
   }
}