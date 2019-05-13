package org.kh.billy.socialuser.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.ObjectMapper;
import org.kh.billy.member.controller.MemberController;
import org.kh.billy.socialuser.model.service.SocialUserService;
import org.kh.billy.socialuser.model.vo.SocialUser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

@Controller
public class KakaoSocialController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	 @Autowired
	 private BCryptPasswordEncoder bcryptPE;
	 
	 @Autowired
	 private SocialUserService socialService;
	   
	 
	
	 @RequestMapping(value = "kakaoLogin.do", produces = "application/json")
	   public String kakaoLogin(@RequestParam("code") String code, Model model, HttpSession kSession,
	          HttpServletRequest request, HttpServletResponse response, SessionStatus status, SocialUser social) {
	       
		 if(kSession.getAttribute("loginMember") != null) {
  		   kSession.invalidate();
  		   System.out.println("사용자세션 날라감");
		 }
		 
		 System.out.println("카카오 로그인 할때 임시 코드값: " + code);
	       
	       JsonNode userInfo = getKakaoUserInfo(code);	       
	       System.out.println("카카오 유저 정보: " + userInfo);
	          
	        String name = null;
	        String email = null;
	        String thumbnailImage = null;
	 		String profile = null;
	        
	        // 유저정보 카카오에서 가져오기 Get properties
	        String kid = userInfo.path("id").asText();
	        JsonNode properties = userInfo.path("properties");
	        JsonNode kakao_account = userInfo.path("kakao_account");
	 
	        name = properties.path("nickname").asText();
	        profile = properties.path("profile_image").asText();
	        email = kakao_account.path("email").asText();
	 
	        System.out.println("카카오 계정 고유번호: " + kid);
	        System.out.println("카카오 name: " + name);
			System.out.println("profile : " + profile);
        	
	        
	        if(kid != null) {
	              kSession.setAttribute("kakaoLogin", kid);
	              kSession.setAttribute("name", name);
	              kSession.setAttribute("email", email);
	              kSession.setAttribute("thumbnailImage ", thumbnailImage );
	              kSession.setAttribute("profile", profile);
	              status.setComplete();
	        }
	        	model.addAttribute("kid", kid);
	        
	        if (socialService.selectCheckId(kid) > 0) {
	    			return "home";
	    	} else {
	    			System.out.println("카카오 로그인 성공! 소셜 회원가입 페이지로!");
	    			return "social/socialInfo";
	    	}
	        	
	   }
	 
	 
	 
	 public String getAccessToken(String autorize_code) {
      
      final String RequestUrl = "https://kauth.kakao.com/oauth/token";

      final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
      
      //포스트 파라미터의 grant_type이라는 명칭에 authorization_code를 추가한다 아래도 동일
      postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));

      postParams.add(new BasicNameValuePair("client_id", "8820ef6337a09d8f33573af30f80442c"));

      postParams.add(new BasicNameValuePair("redirect_uri", "http://localhost:8888/billy/kakaoLogin.do")); //예 : http://아이피:포트/최상위폴더/리다이렉션경로

      postParams.add(new BasicNameValuePair("code", autorize_code));
      //기타 설명은 생략 자세히 알고 싶으면 구글링하세요.
      final HttpClient client = HttpClientBuilder.create().build();

      final HttpPost post = new HttpPost(RequestUrl);

      JsonNode returnNode = null;

      try {

          post.setEntity(new UrlEncodedFormEntity(postParams));

          final HttpResponse response = client.execute(post);

          ObjectMapper mapper = new ObjectMapper();

          returnNode = mapper.readTree(response.getEntity().getContent());

      } catch (UnsupportedEncodingException e) {

          e.printStackTrace();

      } catch (ClientProtocolException e) {

          e.printStackTrace();

      } catch (IOException e) {

          e.printStackTrace();

      } finally {

      }

      return returnNode.get("access_token").toString();

  }
	 
	 public JsonNode getKakaoUserInfo(String autorize_code) {

	      final String RequestUrl = "https://kapi.kakao.com/v1/user/me";
	      //String CLIENT_ID = K_CLIENT_ID; // REST API KEY
	      //String REDIRECT_URI = K_REDIRECT_URI; // 리다이렉트 URI
	      //String code = autorize_code; // 로그인 과정중 얻은 토큰 값
	      final HttpClient client = HttpClientBuilder.create().build();
	      final HttpPost post = new HttpPost(RequestUrl);
	      String accessToken = getAccessToken(autorize_code);
	      // add header
	      post.addHeader("Authorization", "Bearer " + accessToken);

	      JsonNode returnNode = null;

	      try {

	        final HttpResponse response = client.execute(post);
	        final int responseCode = response.getStatusLine().getStatusCode();
	        System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
	        System.out.println("Response Code : " + responseCode);

	        // JSON 형태 반환값 처리
	        ObjectMapper mapper = new ObjectMapper();
	        returnNode = mapper.readTree(response.getEntity().getContent());
	      } catch (UnsupportedEncodingException e) {

	        e.printStackTrace();
	      } catch (ClientProtocolException e) {

	        e.printStackTrace();
	      } catch (IOException e) {

	        e.printStackTrace();
	      } finally {

	        // clear resources
	      }
	      return returnNode;
	    }
	 
	 


}
