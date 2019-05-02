package org.kh.billy.socialuser.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.Base64;
import org.json.simple.JSONObject;
import org.kh.billy.member.controller.MemberController;
import org.kh.billy.socialuser.model.service.SocialUserService;
import org.kh.billy.socialuser.model.vo.AuthInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.social.google.connect.GoogleOAuth2Template;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class GoogleSocialController {
	@Autowired
	private SocialUserService socialService;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	 @Inject
	    private AuthInfo authInfo;
	    
	    @Autowired
	    private GoogleOAuth2Template googleOAuth2Template;
	    
	    @Autowired
	    private OAuth2Parameters googleOAuth2Parameters;
	 
	    // 회원 가입 페이지
	    @RequestMapping(value = "login.do", method = { RequestMethod.GET, RequestMethod.POST })
	    public String join(HttpServletResponse response, Model model) {
	 
	        //URL을 생성한다.
	        String url = googleOAuth2Template.buildAuthenticateUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
	        System.out.println("/googleLogin, url : " + url);
	        model.addAttribute("google_url", url);
	        
	        return "member/login";
	    }
	    
	    @RequestMapping(value = "token.do", method=RequestMethod.POST)
	    public ModelAndView doSessionAssignActionPage(HttpServletRequest request, HttpServletResponse response,ModelAndView model) throws Exception {
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
	        String id_token = (String)responseMap.get("id_token");
	        System.out.println("access_token : " + access_token);
	        System.out.println("id_token : " + id_token);
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
	        
	        String name = bodys[5].split(":")[1].substring(1, bodys[5].split(":")[1].length()-1);
	        String profile = bodys[6].substring(10).substring(1, bodys[6].substring(10).length()-1);
	        System.out.println("name : " + name + ", profile : " + profile);
	     
	        System.out.println(tokens.length);
	        System.out.println(new String(Base64.decodeBase64(tokens[0]), "utf-8"));
	        System.out.println(new String(Base64.decodeBase64(tokens[1]), "utf-8"));
	        
	        //Jackson을 사용한 JSON을 자바 Map 형식으로 변환
	        ObjectMapper mapper = new ObjectMapper();
	        Map<String, String> result = mapper.readValue(body, Map.class);
	        Map<String, String> map = new HashMap<String, String>();
	       map.put("access_token", access_token);
	       map.put("body", body);
	       map.put("name", name);
	       map.put("profile", profile);
	       
	        result.put("access_token", access_token);
	        model.addObject(map);
	        model.setViewName("jsonView");
	     
	        System.out.println(model);
	        return model;
	    }
	   
}