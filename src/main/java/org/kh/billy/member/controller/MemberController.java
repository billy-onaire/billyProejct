package org.kh.billy.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kh.billy.member.model.service.MemberService;
import org.kh.billy.member.model.vo.Member;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
   
   private static final Logger logger = 
         LoggerFactory.getLogger(MemberController.class);
       
   @Autowired
   private MemberService memberService;

   @Autowired
   private BCryptPasswordEncoder bcryptPE;
   
   @RequestMapping("mfind.do")
   public String findPage() {
      return "member/findPage";
   }
   
   @RequestMapping("enroll.do")
   public String enrollPage() {
      return "member/enrollPage";
   }
   
   //로그아웃
   @RequestMapping(value="logout.do")
   public String logoutMethod(HttpServletRequest request) {
      HttpSession session = request.getSession(false);
      if(session != null) {
         session.invalidate();
      }
      return "home";
   }
   
   //로그인 아이디 체크
   @RequestMapping(value="loginCheck.do", method=RequestMethod.POST)
   public String selectCheckId(Model model,HttpServletRequest request, HttpSession session, SessionStatus status, Member member) {
	   System.out.println("구글세션 : " + session.getAttribute("googleLogin"));
	   if(session.getAttribute("googleLogin") != null) {
		   session.invalidate();
		   System.out.println("구글세션 날라감");
	   }
	   Member user = memberService.selectCheckId(member.getUser_id());

	   if(user != null) {
		   if(bcryptPE.matches(member.getUser_pwd(), user.getUser_pwd())) {
		   session.setAttribute("loginMember", user);
		   status.isComplete();
		   System.out.println(user.getUser_id() + "님 로그인 성공!!");
		   
		   return "home";
		   
		   }else {
			   model.addAttribute("message", "로그인 실패");
			   return "member/memberError";
		   }
	   }else {
		   model.addAttribute("message", "이메일 인증을 하셔야 로그인이 가능합니다.");
		   return "member/memberError";
	   }
	   
   }
   
   //아이디 중복검사 체크
   @RequestMapping(value="idCheck.do", method=RequestMethod.POST)
	public ModelAndView IdCheck(@RequestParam("userId") String userId, ModelAndView mv) throws Exception {
	   int result = 0;
	   System.out.println("ajax체크 보내기 : " + userId);
             
       Member idCheck = memberService.selectIdCheck(userId);
       Map<String, Integer> map = new HashMap<>();
       
       
       if(idCheck != null) {
    	   result = 1;
    	   map.put("cnt", result);
    	   mv.addObject(map);
    	   mv.setViewName("jsonView");
       }
       	   mv.addObject(map);
	       mv.setViewName("jsonView");
    	   map.put("cnt", result);   
    	   
    	   
       System.out.println("ajax체크 받기" + map);     
       return mv;
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
   public String RegisterPost(Member member, Model model, HttpServletRequest request, HttpSession session) throws Exception {
	 //패스워드 암호화처리
	  member.setUser_pwd(bcryptPE.encode(member.getUser_pwd()));
       
      int result = memberService.create(member);
      /*"redirect:/"*/
      
      if(result > 0)
			return "home";
		else {
			model.addAttribute("message", "회원 가입 실패!");
			return "common/error";
		}
   }
   
   @RequestMapping(value="joinConfirm.do", method=RequestMethod.GET)
   public String emailConfirm(@ModelAttribute("Member") Member member, Model model) throws Exception {
      logger.info(member.getEmail() + ": auth confirmed");
      
      member.setVerify("y");   // authstatus를 1로,, 권한 업데이트
      memberService.updateVerify(member);
      
      model.addAttribute("verify", "y");
      
      return "member/login";
   }
}