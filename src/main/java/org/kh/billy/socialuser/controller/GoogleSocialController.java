package org.kh.billy.socialuser.controller;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.RandomUtils;
import org.kh.billy.member.model.service.MemberService;
import org.kh.billy.member.model.vo.Member;
import org.kh.billy.socialuser.model.service.SocialUserService;
import org.kh.billy.socialuser.model.vo.AuthInfo;
import org.kh.billy.socialuser.model.vo.SocialUser;
import org.kh.billy.statistics.model.service.StatisticsService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class GoogleSocialController {
		private static final Logger logger = LoggerFactory.getLogger(GoogleSocialController.class);
	   
		@Autowired
	   private SocialUserService socialService;
	   
	   @Autowired
	   private MemberService memberSerive;
	   
	   @Autowired
	   private StatisticsService stService;
   
       @Inject
       private AuthInfo authInfo;
             
       @Autowired
       private OAuth2Parameters googleOAuth2Parameters;
    
       @Autowired
       private BCryptPasswordEncoder bcryptPE;
       
       //소셜로그인시 회원가입 안하면 넘어가게 하는 페이지
       @RequestMapping(value="socialEnroll.do")
       public String socialEnrollPage() {
    	   return "social/socialInfo";
       }
       
       //토큰 및 사용자 정보 저장 및 불러오기
       @RequestMapping(value = "token.do", method=RequestMethod.POST)
       public ModelAndView doSessionAssignActionPage(SocialUser social, HttpServletRequest request, HttpServletResponse response, ModelAndView model) throws Exception {
          String code = request.getParameter("code");
           
           //RestTemplate을 사용하여 Access Token 및 profile을 요청한다.
           RestTemplate restTemplate = new RestTemplate();
           MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
           parameters.add("code", code);
           parameters.add("client_id", authInfo.getClientId());
           parameters.add("client_secret", authInfo.getClientSecret());
           parameters.add("redirect_uri", googleOAuth2Parameters.getRedirectUri());
           parameters.add("grant_type", "authorization_code");
           
           HttpHeaders headers = new HttpHeaders();
           headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
           HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<MultiValueMap<String, String>>(parameters, headers);
           ResponseEntity<Map> responseEntity = restTemplate.exchange("https://www.googleapis.com/oauth2/v4/token", HttpMethod.POST, requestEntity, Map.class);
           Map<String, Object> responseMap = responseEntity.getBody();
           String access_token = (String)responseMap.get("access_token");
           
           // id_token 라는 키에 사용자가 정보가 존재한다.
           // 받아온 결과는 JWT (Json Web Token) 형식으로 받아온다. 콤마 단위로 끊어서 첫 번째는 현 토큰에 대한 메타 정보, 두 번째는 우리가 필요한 내용이 존재한다.
           // 세번째 부분에는 위변조를 방지하기 위한 특정 알고리즘으로 암호화되어 사이닝에 사용한다.
           //Base 64로 인코딩 되어 있으므로 디코딩한다.
           
           String[] tokens = ((String)responseMap.get("id_token")).split("\\.");
           
           Base64 base64 = new Base64(true);
           String body = new String(base64.decode(tokens[1]));
           String[] bodys = body.split(",");
           
           String name = bodys[5].split(":")[1].substring(1, bodys[5].split(":")[1].length()-1);
           String profile = bodys[6].substring(10).substring(1, bodys[6].substring(10).length()-1);
           String uid = bodys[3].split(":")[1].substring(1, bodys[3].split(":")[1].length() - 1);
           String userId = RandomStringUtils.randomAlphabetic(5) + RandomStringUtils.randomNumeric(10);
           
        	 //Jackson을 사용한 JSON을 자바 Map 형식으로 변환
               Map<String, String> map = new HashMap<String, String>();
               map.put("access_token", access_token);
               map.put("body", body);
               map.put("name", URLEncoder.encode(name,"utf-8"));
               map.put("profile", profile);
               map.put("uid", uid);
               
               model.addObject(map);
               model.setViewName("jsonView");
                              
           return model;
       }
       
       // 구글 체크 페이지
       @RequestMapping(value="googleCheck.do", method= { RequestMethod.GET, RequestMethod.POST })
       public String googleCheckPage() {
    	   return "social/googleCheck";
       }
       
       // 구글 사용자 정보 넘기기
       @RequestMapping(value="googleLogin.do")
       public String googleCheckPage(HttpServletRequest request, HttpSession gSession,SessionStatus status
    		   ,@RequestParam(name="uid") String uid, Member member,Model model) {
    	   
    	   String name = request.getParameter("name"); //소셜 닉네임및 이름
    	   String profile = request.getParameter("profile"); //소셜 프로필사진
    	   
    	   member.setSname(name);
    	   member.setSocial_type("google");
    	   member.setSocial_code(uid);
    	   member.setProfile(profile);
    	   
    	   String userId = socialService.selectCheckId(uid);
    	   Member user = socialService.selectDeleteSocial(userId);

    	   member.setUser_id(userId);
    	   gSession.setAttribute("loginMember", member);
    	   status.setComplete();
    	   
    	   if (userId != null) {
    		   
    		   if(user.getVerify().equals("y") && user.getDelete_yn().equals("Y")) {
				   model.addAttribute("message", "신고 횟수 3회 이상으로 강제 탈퇴된 회원입니다.");
			   	   return "member/memberError";	
		   	   }
    		   
    		   member = socialService.selectUserInfo(userId);
    		   member.setSname(name);
    		   member.setProfile(profile);
    		   member.setSocial_type("google");
        	   member.setSocial_code(uid);
    		   gSession.setAttribute("loginMember", member);
    		   status.setComplete();
    		   return "home";
    	   } else {
    		   System.out.println("구글로그인 성공!!");
    		   return "social/socialInfo";
    	   }
       }

       
       //소셜로그인 후 입력정보 받고 등록하기
       @RequestMapping(value="sinsert.do", method=RequestMethod.POST)
       public String insertSocialUser(HttpServletRequest request, HttpSession session, SocialUser social, Member member, Model model) {
    	   String userpwd = RandomStringUtils.randomNumeric(15);

    	   //패스워드 암호화처리

    	   member.setUser_pwd(bcryptPE.encode(userpwd));
    	   member.setAuthkey(social.getSocial_code());
    	   member.setSocial_code(social.getSocial_code());
    	   if(memberSerive.insertSmember(member) > 0) {
    		   System.out.println("회원정보등록성공!");
    		   if(socialService.insertSocial(social) > 0) {
    			   System.out.println("소셜회원정보등록성공!");
    			   
    			   session.setAttribute("loginMember", member);
    			   stService.insertSignUp();
    			   
    			   return "redirect:main.do";
    		   }else {
    			   model.addAttribute("message", "소셜회원등록실패!");
    			   return "social/socialError";
    		   }
    	   }else {
    		  model.addAttribute("message", "회원등록실패!");
    		  return "social/socialError";
    	   }
    	   
       }
       
       //소셜회원가입 유무 체크메소드
       @RequestMapping(value="socialCheck.do", method=RequestMethod.POST)
       public ModelAndView socialCheckInfo(ModelAndView mv, HttpServletRequest request, @RequestParam String sid) {
    	   Map<String, String> map = new HashMap<String, String>();

    	   if(socialService.selectSocialCheck(sid) >  0) {
    		   map.put("ok", "ok");
    	   }else {
    		   map.put("fail", "fail");
    	   }
    	   mv.addObject(map);
    	   mv.setViewName("jsonView");
    	   
    	   return mv;
       }
      
}