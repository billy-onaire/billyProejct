package org.kh.billy.socialuser.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.json.simple.JSONObject;
import org.kh.billy.member.model.vo.Member;
import org.kh.billy.socialuser.model.service.SocialUserService;
import org.kh.billy.socialuser.model.vo.NaverLoginBO;
import org.kh.billy.socialuser.model.vo.SocialUser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.facebook.connect.FacebookConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import com.github.scribejava.core.model.OAuth2AccessToken;

@Controller
public class NaverSocialController {

	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO){
		this.naverLoginBO = naverLoginBO;
	}
	
	// 페이스북 oAuth 관련
    @Autowired
    private FacebookConnectionFactory connectionFactory;
    @Autowired
    private OAuth2Parameters oAuth2Parameters;
    @Autowired
	private SocialUserService socialService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(NaverSocialController.class);
	@RequestMapping(value="login.do", method= { RequestMethod.GET, RequestMethod.POST })
	public String facebookNaverLogin(HttpServletResponse response, Model model, HttpSession session) {
		// 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		
		OAuth2Operations oauthOperations = connectionFactory.getOAuthOperations();
        String facebook_url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, oAuth2Parameters);
		
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);
		System.out.println("facebook url" + facebook_url);
		//네이버 
		model.addAttribute("url", naverAuthUrl);
		//페이스북
		model.addAttribute("facebook_url", facebook_url);
		
		//생성한 인증 URL을 View로 전달 
		return "member/login";
	}
	
	// 네이버 체크 페이지
    @RequestMapping(value="naverCheck.do", method= { RequestMethod.GET, RequestMethod.POST })
    public String naverCheckPage(Model model, @RequestParam String code, @RequestParam String state
    		, HttpSession session) throws IOException{
    	
    	OAuth2AccessToken oauthToken;
    	oauthToken = naverLoginBO.getAccessToken(session, code, state);
    	//로그인 사용자 정보를 읽어옴
    	apiResult = naverLoginBO.getUserProfile(oauthToken);
    	model.addAttribute("result", apiResult);
    	model.addAttribute("naverLogin", oauthToken.getAccessToken());
    	
    	return "social/naverCheck";
    }
    
    //네이버 로그인 유무체크
    @RequestMapping(value="naverLogin.do", method=RequestMethod.POST)
    public String naverCheckId(Model model, @RequestParam String user_name, @RequestParam String nickname, @RequestParam String email,
    		@RequestParam String profile, @RequestParam String uid, HttpSession nSession, SessionStatus status, Member member) {
    	
    	member.setSocial_type("naver");
    	member.setSocial_code(uid);
    	member.setUser_name(user_name);
    	member.setSname(nickname);
    	member.setProfile(profile);
    	
    	String userId = socialService.selectCheckId(uid);  
 	   	member.setUser_id(userId);
 	   	nSession.setAttribute("loginMember", member);
 	   	status.setComplete();
    	
    	if(userId != null) {
    		return "home";
    	}else {
    		System.out.println("네이버로그인 성공!");
    		return "social/socialInfo";
    	}
    }
    
   
}
