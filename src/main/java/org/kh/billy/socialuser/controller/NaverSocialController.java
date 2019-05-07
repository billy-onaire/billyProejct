package org.kh.billy.socialuser.controller;

import org.kh.billy.socialuser.model.service.SocialUserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class NaverSocialController {

	@Autowired
	private SocialUserService socialService;
	
	private static final Logger logger = LoggerFactory.getLogger(NaverSocialController.class);
	
	// 네이버 체크 페이지
    @RequestMapping(value="naverCheck.do", method= { RequestMethod.GET, RequestMethod.POST })
    public String naverCheckPage() {
    	return "member/naverCheck";
    }
    
    @RequestMapping(value="nLogin.do")
    public String selectNaverCheck() {
    	return "home";
    }
}
