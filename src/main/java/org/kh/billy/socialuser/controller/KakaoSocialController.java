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
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class KakaoSocialController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	 @Autowired
	 private BCryptPasswordEncoder bcryptPE;
	
	
	 @RequestMapping(value = "/oauth", produces = "application/json")
	   public String kakaoLogin(@RequestParam("code") String code, Model model, HttpSession session,
	          HttpServletRequest request, HttpServletResponse response) {
	       System.out.println("로그인 할때 임시 코드값");
	       //카카오 홈페이지에서 받은 결과 코드
	       System.out.println(code);
	       System.out.println("로그인 후 결과값");
	       
	       KakaoSocialController kakaoLogin = new KakaoSocialController();
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
	 
	 public JsonNode getAccessToken(String autorize_code) {
      
	  
      final String RequestUrl = "https://kauth.kakao.com/oauth/token";

      final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
      
      //포스트 파라미터의 grant_type이라는 명칭에 authorization_code를 추가한다 아래도 동일
      postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));

      postParams.add(new BasicNameValuePair("client_id", "8820ef6337a09d8f33573af30f80442c"));

      postParams.add(new BasicNameValuePair("redirect_uri", "http://localhost:8888/oauth")); //예 : http://아이피:포트/최상위폴더/리다이렉션경로

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

      return returnNode;

  }

}
