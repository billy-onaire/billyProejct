package org.kh.billy.socialuser.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kh.billy.member.controller.MemberController;
import org.kh.billy.socialuser.model.service.SocialUserService;
import org.kh.billy.socialuser.model.vo.SocialUser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.MissingAuthorizationException;
import org.springframework.social.connect.Connection;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.User;
import org.springframework.social.facebook.api.UserOperations;
import org.springframework.social.facebook.api.impl.FacebookTemplate;
import org.springframework.social.facebook.connect.FacebookConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

@Controller
public class FacebookSocialController {
	// 페이스북 oAuth 관련
    @Autowired
    private FacebookConnectionFactory connectionFactory;
    @Autowired
    private OAuth2Parameters oAuth2Parameters;
    @Autowired
	private SocialUserService socialService;
   
    private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
    
    
    // join  뷰로 매핑
    @RequestMapping(value = "flogin.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String join(HttpServletResponse response, Model model, HttpSession session) {
        
        OAuth2Operations oauthOperations = connectionFactory.getOAuthOperations();
        String facebook_url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, oAuth2Parameters);
    
        model.addAttribute("facebook_url", facebook_url);
        System.out.println("facebook url" + facebook_url);
 
        return "member/login";
    }
    
    @RequestMapping(value = "facebookLogin.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String facebookSignInCallback(@RequestParam String code, HttpSession fSession,
    		SessionStatus status, SocialUser social, Model model) throws Exception {
    	
    	if(fSession.getAttribute("loginMember") != null) {
   		   fSession.invalidate();
   		   System.out.println("사용자세션 날라감");
 		 }
    
    	String fid = "";
    	String email="";
    	
        try {
             String redirectUri = oAuth2Parameters.getRedirectUri();
            System.out.println("Redirect URI : " + redirectUri);
            System.out.println("Code : " + code);
 
            OAuth2Operations oauthOperations = connectionFactory.getOAuthOperations();
            AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, redirectUri, null);
            String accessToken = accessGrant.getAccessToken();
            System.out.println("AccessToken: " + accessToken);
            Long expireTime = accessGrant.getExpireTime();
        
            
            if (expireTime != null && expireTime < System.currentTimeMillis()) {
                accessToken = accessGrant.getRefreshToken();
                logger.info("accessToken is expired. refresh token = {}", accessToken);
            };
            
        
            Connection<Facebook> connection = connectionFactory.createConnection(accessGrant);
            Facebook facebook = connection == null ? new FacebookTemplate(accessToken) : connection.getApi();
            UserOperations userOperations = facebook.userOperations();
            
            try
 
            {            
                User userProfile = facebook.fetchObject("me", User.class);
                fid = userProfile.getId();
                email = userProfile.getEmail();
                String name = userProfile.getName();
                             
                System.out.println("Facebook 아이디: " + fid);
                System.out.println("Facebook email: " + email);
                System.out.println("Facebook name: " + name);
                
                if(fid != null) {
  	              fSession.setAttribute("facebookLogin", fid);
  	              fSession.setAttribute("name", name);
  	              fSession.setAttribute("email", email);
  	              status.setComplete();
  	        }
  	        	model.addAttribute("fid", fid);
                
            } catch (MissingAuthorizationException e) {
                e.printStackTrace();
            }
   
        } catch (Exception e) {
 
            e.printStackTrace();
        }
         
        if (socialService.selectCheckId(fid) > 0) {
			return "home";
        } else {
			System.out.println("페이스북 로그인 성공! 소셜 회원가입 페이지로!");
			return "social/socialInfo";
	}
    }

}
