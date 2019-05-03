package org.kh.billy.socialuser.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

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
import org.springframework.stereotype.Controller;

@Controller
public class KakaoController {

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
