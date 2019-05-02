package org.kh.billy.member.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpSession;

import org.apache.log4j.spi.LoggerFactory;
import org.codehaus.jackson.JsonNode;
import org.kh.billy.member.model.service.MemberService;
import org.kh.billy.member.model.vo.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

@Controller
public class MemberController {
	
/*	private static final Logger logger = 
			LoggerFactory.getLogger(MemberController.class);
		*/
	/*private SocialUserController kakao_restapi = new SocialUserController();*/
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="login.do")
	public String loginPage() {
		return "member/login";
	}
	
	@RequestMapping("mfind.do")
	public String findPage() {
		return "member/findPage";
	}
	
	@RequestMapping("enroll.do")
	public String enrollPage() {
		return "member/enrollPage";
	}
	
   
    @RequestMapping(value = "/billy", produces = "application/json", method = { RequestMethod.GET, RequestMethod.POST })
    public String kakaoLogin(@RequestParam("code") String code, Model model, HttpSession session) {
    	
    	//카카오 홈페엦에서 받은 임시 결과 코드
    	System.out.println("로그인 할 때 임시 코드값 : " + code);
        //결과값을 노드에 담아줌
    	//JsonNode node = kakao_restapi.getAccessToken(code);
        //결과값 출력
    	//System.out.println(node);
    	//노드 안에 있는 access_token값을 꺼내 문자열로 변환
    	//String token = node.get("access_token").toString();
    	//세션에 담아준다.
    	//session.setAttribute("token", token);
    	
        return "member/login";
    }

}
