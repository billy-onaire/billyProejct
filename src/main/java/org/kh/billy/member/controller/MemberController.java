package org.kh.billy.member.controller;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.kh.billy.member.model.service.MemberService;
import org.kh.billy.member.model.vo.BasePage;
import org.kh.billy.member.model.vo.Member;
import org.kh.billy.member.model.vo.Paging;
import org.kh.billy.sms.model.vo.Sms;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import net.nurigo.java_sdk.api.Message;

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
   
   @RequestMapping("mPageMain.do")
   public String mPageMain() {
	   return "common/myPageMain";
   }
   
   //아이디 찾기
   @RequestMapping(value = "findId.do" , method = RequestMethod.POST)
   public @ResponseBody void findingId(@ModelAttribute Member member, HttpServletResponse response)throws Exception {
	response.setContentType("text/html; charset=utf-8");
   	List <Member> idList = new ArrayList<>();
   	idList = memberService.searchId(member);
   		// 전송용 객체 생성
 		JSONObject sendObj = new JSONObject();
 		// 배열 객체 생성
 		JSONArray jarr = new JSONArray();
 		
 		// list 를 jarr 에 복사
 		for(Member foundId : idList) {
 			JSONObject juser = new JSONObject();

 			juser.put("user_id", foundId.getUser_id());
 			// jarr 에 juser 저장
 			jarr.add(juser);
 		}
 		sendObj.put("list", jarr);
 		
 		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(sendObj.toJSONString());
		out.flush();
		out.close();
   }
   
   
   
   @RequestMapping("changePwdPage.do")
   public String changePwdPage(Model model, @RequestParam String userId) {
	   model.addAttribute("userId", userId);
      return "member/changePwdPage";
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
         session.removeAttribute("loginMember");
      }
      return "home";
   }
   
   //로그인 아이디 체크
   @RequestMapping(value="loginCheck.do", method=RequestMethod.POST)
   public String selectCheckId(Model model,HttpServletRequest request, HttpSession session, SessionStatus status, Member member) {
	   if(memberService.selectDeleteUser(member.getUser_id()) != null){
		   model.addAttribute("message", "탈퇴된 회원입니다.");
		   return "member/memberError";
	   }
	   
	   Member user = memberService.selectCheckId(member.getUser_id());
	   
	   if(user != null) {
		   if(bcryptPE.matches(member.getUser_pwd(), user.getUser_pwd())) {
			   user.setSocial_type("user");
			   session.setAttribute("loginMember", user);
			   status.setComplete();
			   System.out.println(user.getUser_id() + "님 로그인 성공!!");
			   
			   return "home";
		   }else {
			   model.addAttribute("message", "로그인 실패");
			   return "member/memberError";
		   }
	   }else{
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
      return "member/updatePage";
   }
   
   @RequestMapping(value="mupdate.do", method=RequestMethod.POST)
	public String updateMember(Member member, Model model) {
	   	member.setUser_pwd(bcryptPE.encode(member.getUser_pwd()));
  
		int result = memberService.updateMember(member);
		if(result > 0) {
			return "home";
		}else {
			model.addAttribute("message", "회원정보 수정 실패!");
			return "member/login";
		}
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
   
   //비밀번호 찾기시 휴대폰인증번호 보내기
   @RequestMapping(value="sendSms.do", method=RequestMethod.POST)
   public ModelAndView sendSMS(ModelAndView mv, Sms sms, Member member, HttpServletResponse response) throws Exception { // 휴대폰 문자보내기
	   String api_key = "NCSKN2UDLUWTX5XZ";
	   String api_secret = "8RYWTQRUBQINOZ1L9QOS4B2HMLJJOIJI";
	   Message coolsms = new Message(api_key, api_secret); // 메시지보내기 객체 생성
	   String key = RandomStringUtils.randomNumeric(4); // 인증키 생성
	   System.out.println("인증키 : " + key);
	   HashMap<String, String> map = new HashMap<String, String>();
	   
	   if(member.getUser_id() != null) {
		   sms.setUser_id(member.getUser_id());
		   sms.setAuthno(key);
		   
		   memberService.deleteAutoNo(member.getUser_id());
		   
		   if(memberService.insertSms(sms) > 0) {
			   map.put("to", member.getUser_mobile());
			   map.put("from", "01025306563");
			   map.put("text", "Billy에서 보내는 인증번호는 ["+key+"] 입니다.");
			   map.put("type", "SMS");
			   
			   JSONObject result = (JSONObject)coolsms.send(map); // 보내기&전송결과받기
				if ((Long)result.get("success_count") > 0) {
					// 메시지 보내기 성공 및 전송결과 출력
					System.out.println("성공");
					System.out.println(result.get("group_id")); // 그룹아이디
					System.out.println(result.get("success_count")); // 성공 메세지 수
					System.out.println(result.get("error_count")); // 여러개 보낼시 오류난 메시지 수
					map.put("message", URLEncoder.encode("인증번호 발송 성공하였습니다.","UTF-8"));
					map.put("authno", key);
					map.put("userId", member.getUser_id());
				} else {
					// 메시지 보내기 실패
					System.out.println("실패");
					System.out.println(result.get("code")); // REST API 에러코드
					System.out.println(result.get("message")); // 에러메시지
				}
		   }else {
			   map.put("message", URLEncoder.encode("인증번호 발송 실패하였습니다.","UTF-8"));
		   }
	   }else {
		   map.put("message", URLEncoder.encode("유저정보가 틀렸습니다.", "UTF-8"));
	   }
	   
	   mv.addObject(map);
	   mv.setViewName("jsonView");
	   
	   return mv;
   }
   
   @RequestMapping(value="checkAuthNo.do", method=RequestMethod.POST)
   public ModelAndView checkAuthNo(ModelAndView mv, @RequestParam String userId, @RequestParam String authno) throws Exception{

	   String authNo = memberService.selectCheckANo(userId);
	   Map<String, String> map = new HashMap<String, String>();
	   
	   if(authno.equals(authNo)) {
		   map.put("message", URLEncoder.encode("인증 성공","UTF-8"));
		   map.put("userId", userId);
	   }else {
		   map.put("message", URLEncoder.encode("인증번호가 틀렸습니다.","UTF-8"));
	   }
	   
	  mv.addObject(map);
	  mv.setViewName("jsonView");
	   
	   return mv;
   }
   
   //휴대폰인증 후 비밀번호변경 
   @RequestMapping(value="changePwd.do", method=RequestMethod.POST)
   public ModelAndView updateMemberPwd(Member member,ModelAndView mv) throws Exception{
	   Map<String, String> map = new HashMap<String, String>();
	   
	   member.setUser_pwd(bcryptPE.encode(member.getUser_pwd()));

	   if(memberService.updateMemberPwd(member) > 0) {
		   map.put("message", URLEncoder.encode("비밀번호 변경성공", "UTF-8"));
	   }else {
		   map.put("message", URLEncoder.encode("비밀번호 변경실패", "UTF-8"));
	   }
	   mv.addObject(map);
	   mv.setViewName("jsonView");
	   
	   return mv;
   }
   
   //회원관리 페이지 이동
   @RequestMapping(value="memberManagementPage.do")
   public String memberBoardList(Model model, BasePage bPage) {
	   Paging paging = new Paging();
	   paging.setBpage(bPage);
	   paging.setTotalCount(memberService.selectTotalCount());	//DB에 저장된 회원 총 인원수체크
	   ArrayList<Member> mList = memberService.selectMemberList(bPage);	//DB에 저장된 회원 총 리스트 (이메일 인증한 회원만)

	   if(mList != null) {
		   model.addAttribute("mList",mList);
		   model.addAttribute("paging", paging);
		   return "member/memberManagementPage";
	   }else {
		   model.addAttribute("message", "조회할 게시글이 없습니다.");
		   return "member/memberError";
	   }
   }
   
   //회원관리 아이디,이름,탈퇴회원으로 검색 리스트 
   @RequestMapping(value="mSearchList.do")
   public String memberSearchList(@RequestParam(value="selection", required=false, defaultValue="") String selection,@RequestParam(value="search", required=false, defaultValue="") String search,
		   HttpServletRequest request,Model model, BasePage bPage) {
	   String select = "";
	   
	   if(selection.equals("userId")) {
		   select = "user_id";
	   }else if(selection.equals("userName")) {
		   select = "user_name";
	   }else if(selection.equals("deleteUser")) {
		   select = "delete_yn";
	   }
	   
	   Paging paging = new Paging();
	   paging.setBpage(bPage);
	   ArrayList<Member> mList = new ArrayList<>();
	   if(select != "") {
		   paging.setTotalCount(memberService.selectSearchTotalCount(search, select));	//DB에 저장된 회원 총 인원수체크
		   mList = memberService.selectSearchMemberList(bPage, search, select);	//DB에 저장된 회원 총 리스트 (이메일 인증한 회원만)
	   }else {
		   paging.setTotalCount(memberService.selectTotalCount());	
		   mList = memberService.selectMemberList(bPage);	
	   }
	   
	   if(mList != null) {
		   model.addAttribute("mList",mList);
		   model.addAttribute("paging", paging);
		   model.addAttribute("selection", selection);
		   model.addAttribute("search", search);
		   return "member/memberManagementPage";
	   }else {
		   model.addAttribute("message", "조회할 게시글이 없습니다.");
		   return "member/memberError";
	   }
   }
   
   //신고횟수 3회시 탈퇴시키는 메소드
   @RequestMapping(value="deleteMember.do")
   public ModelAndView deleteMember(ModelAndView mv, @RequestParam String userId) throws UnsupportedEncodingException {
	   Map<String, String> map = new HashMap<>();
	   if(memberService.deleteMember(userId) > 0) {
		   map.put("message", URLEncoder.encode("회원 탈퇴되었습니다.", "UTF-8"));
	   }else {
		   map.put("message", URLEncoder.encode("회원 탈퇴실패","UTF-8"));
	   }
	   mv.addObject(map);
	   mv.setViewName("jsonView");
	   return mv;
   }
   
   //회원복구 시키는 메소드
   @RequestMapping(value="backMember.do")
   public ModelAndView backMember(ModelAndView mv, @RequestParam String userId) throws UnsupportedEncodingException {
	   Map<String, String> map = new HashMap<>();
	   if(memberService.updateBackMember(userId) > 0) {
		   map.put("message", URLEncoder.encode("회원 복구되었습니다.", "UTF-8"));
	   }else {
		   map.put("message", URLEncoder.encode("회원 복구실패","UTF-8"));
	   }
	   mv.addObject(map);
	   mv.setViewName("jsonView");
	   return mv;
   }
}