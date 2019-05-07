package org.kh.billy.socialuser.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.commons.codec.binary.Base64;
import org.kh.billy.member.controller.MemberController;
import org.kh.billy.socialuser.model.service.SocialUserService;
import org.kh.billy.socialuser.model.vo.AuthInfo;
import org.kh.billy.socialuser.model.vo.SocialUser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.social.google.connect.GoogleOAuth2Template;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class GoogleSocialController {
	@Autowired
	private SocialUserService socialService;
	
	private static final Logger logger = LoggerFactory.getLogger(GoogleSocialController.class);
	
	 @Inject
	    private AuthInfo authInfo;
	    
	    @Autowired
	    private GoogleOAuth2Template googleOAuth2Template;
	    
	    @Autowired
	    private OAuth2Parameters googleOAuth2Parameters;
	 
	    @Autowired
	    private BCryptPasswordEncoder bcryptPE;
	    
	    // 구글 체크 페이지
	    @RequestMapping(value="googleCheck.do", method= { RequestMethod.GET, RequestMethod.POST })
	    public String googleCheckPage() {
	    	return "member/googleCheck";
	    }
	    
	    // 구글 사용자 정보 넘기기
	    @RequestMapping(value="googlelogin.do")
	    public String googleCheckPage(HttpServletRequest request, ModelAndView mv,Model model,HttpSession gSession,SessionStatus status) {
	    	String accessToken = request.getParameter("access_token");
	    	String name = request.getParameter("name");
	    	String profile = request.getParameter("profile");
	    	if(accessToken != null) {
		    	   gSession.setAttribute("loginMember", accessToken);
		    	   gSession.setAttribute("name", name);
		    	   gSession.setAttribute("profile", profile);
		    	   status.setComplete();
		    }
	    	model.addAttribute("name",name);
	    	model.addAttribute("profile",profile);
	    	return "home";
	    }
	    
	    //토큰 및 사용자 정보 저장 및 불러오기
	    @RequestMapping(value = "token.do", method=RequestMethod.POST)
	    public ModelAndView doSessionAssignActionPage(SocialUser social, HttpServletRequest request, HttpServletResponse response, ModelAndView model) throws Exception {
	    	String code = request.getParameter("code");
	        System.out.println("code : " + code);
	        
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
	        System.out.println("responseMap : " + responseMap);
	        String access_token = (String)responseMap.get("access_token");
	        
	        // id_token 라는 키에 사용자가 정보가 존재한다.
	        // 받아온 결과는 JWT (Json Web Token) 형식으로 받아온다. 콤마 단위로 끊어서 첫 번째는 현 토큰에 대한 메타 정보, 두 번째는 우리가 필요한 내용이 존재한다.
	        // 세번째 부분에는 위변조를 방지하기 위한 특정 알고리즘으로 암호화되어 사이닝에 사용한다.
	        //Base 64로 인코딩 되어 있으므로 디코딩한다.
	        
	        String[] tokens = ((String)responseMap.get("id_token")).split("\\.");
	        
	        Base64 base64 = new Base64(true);
	        for(int i =0; i < tokens.length; i++) {
	        	String hi = new String(base64.decode(tokens[i]));
	        	System.out.println("tokens["+i+"] : " + tokens[i]);
	        	System.out.println("tokens["+i+"] : " + hi);
	        }
	        String body = new String(base64.decode(tokens[1]));
	        String[] bodys = body.split(",");
	        for(int i =0; i<bodys.length; i++) {
	        	System.out.println("bodys["+i+"] : " + bodys[i]);
	        }
	        
	        String name = bodys[5].split(":")[1].substring(1, bodys[5].split(":")[1].length()-1);
	        String profile = bodys[6].substring(10).substring(1, bodys[6].substring(10).length()-1);
	        String uid = bodys[3].split(":")[1].substring(1, bodys[3].split(":")[1].length() - 1);
	        System.out.println("name : " + name + ", profile : " + profile + "\nsub : " + uid);
	        social.setUser_id(bcryptPE.encode(uid));
	        social.setToken(access_token);
	        	        
	        //Jackson을 사용한 JSON을 자바 Map 형식으로 변환
	       /* ObjectMapper mapper = new ObjectMapper();
	        Map<String, String> result = mapper.readValue(body, Map.class);*/
	        Map<String, String> map = new HashMap<String, String>();
	       map.put("access_token", access_token);
	       map.put("body", body);
	       map.put("name", URLEncoder.encode(name,"utf-8"));
	       map.put("profile", profile);
	       
	       model.addObject(map);
	        model.setViewName("jsonView");
	     
	        return model;
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
	   
}
