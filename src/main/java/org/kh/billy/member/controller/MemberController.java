package org.kh.billy.member.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.spi.LoggerFactory;
import org.codehaus.jackson.JsonNode;
import org.kh.billy.member.model.service.MemberService;
import org.kh.billy.member.model.vo.Member;
import org.kh.billy.socialuser.controller.KakaoController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

@Controller
public class MemberController {
   
   /*private static final Logger logger = 
         LoggerFactory.getLogger(MemberController.class);*/
      
   private KakaoController kakaoLogin  = new KakaoController();
   
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
   
   @RequestMapping(value = "/oauth", produces = "application/json", method = {RequestMethod.GET, RequestMethod.POST})
    public String kakaoLogin(@RequestParam("code") String code, Model model, HttpSession session,
           HttpServletRequest request, HttpServletResponse response) {
        System.out.println("로그인 할때 임시 코드값");
        //카카오 홈페이지에서 받은 결과 코드
        System.out.println(code);
        System.out.println("로그인 후 결과값");
        
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
}