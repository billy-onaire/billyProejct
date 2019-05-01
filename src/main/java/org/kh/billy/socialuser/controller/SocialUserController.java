package org.kh.billy.socialuser.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import org.kh.billy.socialuser.model.vo.AuthInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.google.connect.GoogleOAuth2Template;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Parameters;
/*import org.springframework.social.google.connect.GoogleOAuth2Template;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Parameters;*/
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;

import com.google.inject.Inject;


@Controller
public class SocialUserController {

	@Autowired
	private SocialUserService socialService;

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	
	  @Inject private AuthInfo authInfo;
	  
	  @Autowired private GoogleOAuth2Template googleOAuth2Template;
	  
	  @Autowired private OAuth2Parameters googleOAuth2Parameters;
	  
	  // 회원 가입 페이지
	  
	  @RequestMapping(value = "login.do", method = { RequestMethod.GET,
	  RequestMethod.POST }) public String join(HttpServletResponse response, Model
	  model) {
	  
	  //URL을 생성한다. String url =
	  googleOAuth2Template.buildAuthenticateUrl(GrantType.AUTHORIZATION_CODE,
	  googleOAuth2Parameters); System.out.println("/googleLogin, url : " + url);
	  model.addAttribute("google_url", url);
	  
	  return "member/login"; }
	 

	
	  @RequestMapping(value = "/billy/index.jsp", method = { RequestMethod.GET,
	  RequestMethod.POST }) public String
	  doSessionAssignActionPage(HttpServletRequest request) throws Exception {
	  String code = request.getParameter("code"); System.out.println(code);
	  
	  //RestTemplate을 사용하여 Access Token 및 profile을 요청한다. RestTemplate restTemplate
	  = new RestTemplate(); MultiValueMap<String, String> parameters = new
	  LinkedMultiValueMap<>(); parameters.add("code", code);
	  parameters.add("client_id", authInfo.getClientId());
	  parameters.add("client_secret", authInfo.getClientSecret());
	  parameters.add("redirect_uri", googleOAuth2Parameters.getRedirectUri());
	  parameters.add("grant_type", "authorization_code");
	  
	  HttpHeaders headers = new HttpHeaders();
	  headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
	  HttpEntity<MultiValueMap<String, String>> requestEntity = new
	  HttpEntity<MultiValueMap<String, String>>(parameters, headers);
	  ResponseEntity<Map> responseEntity =
	  restTemplate.exchange("https://www.googleapis.com/oauth2/v4/token",
	  HttpMethod.POST, requestEntity, Map.class); Map<String, Object> responseMap =
	  responseEntity.getBody();
	  
	  // id_token 라는 키에 사용자가 정보가 존재한다. // 받아온 결과는 JWT (Json Web Token) 형식으로 받아온다.
	  콤마 단위로 끊어서 첫 번째는 현 토큰에 대한 메타 정보, 두 번째는 우리가 필요한 내용이 존재한다. // 세번째 부분에는 위변조를
	  방지하기 위한 특정 알고리즘으로 암호화되어 사이닝에 사용한다. //Base 64로 인코딩 되어 있으므로 디코딩한다.
	  
	  String[] tokens = ((String)responseMap.get("id_token")).split("\\."); Base64
	  base64 = new Base64(true); String body = new
	  String(base64.decode(tokens[1]));
	  
	  System.out.println(tokens.length); System.out.println(new
	  String(Base64.decodeBase64(tokens[0]), "utf-8")); System.out.println(new
	  String(Base64.decodeBase64(tokens[1]), "utf-8"));
	  
	  //Jackson을 사용한 JSON을 자바 Map 형식으로 변환 ObjectMapper mapper = new ObjectMapper();
	  Map<String, String> result = mapper.readValue(body, Map.class);
	  System.out.println(result.get(""));
	  
	  return "home";
	  
	  }
	 
	

	/* 카카오 로그인 restspi */
	public JsonNode getAccessToken(String autorize_code) {

		final String RequestUrl = "https://kauth.kakao.com/oauth/token";

		final List<NameValuePair> postParams = new ArrayList<NameValuePair>();

		postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));

		postParams.add(new BasicNameValuePair("client_id", "46bbcfbc7eb226c945c88a9cee6f6f2f"));

		postParams.add(new BasicNameValuePair("redirect_uri", "http://localhost/billy/oauth"));

		postParams.add(new BasicNameValuePair("code", autorize_code));

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
