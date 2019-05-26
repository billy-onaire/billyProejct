package org.kh.billy.admin.model.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kh.billy.admin.model.service.AdminService;
import org.kh.billy.admin.model.vo.Admin;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {
	
	@Autowired
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private AdminService aService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPE; 
	
	@RequestMapping(value="alogin.do", method=RequestMethod.GET)
	public String adminLoginPage(Admin admin) {
		if(aService.selectCheckId() > 0) {
			System.out.println("관리자아이디가 있음");
		}else {
			admin.setAdmin_id("admin");
			admin.setAdmin_pwd(bcryptPE.encode("admin"));
			aService.insertAdmin(admin);
		}
		return "member/adminLogin";
	}
	
	@RequestMapping(value="adminLogin.do", method=RequestMethod.POST)
	public String adminLogin(Admin admin, HttpSession session, Model model) {
		Admin admin2 = aService.selectAdminId(admin.getAdmin_id());
		if(admin2 != null) {
			if(bcryptPE.matches(admin.getAdmin_pwd(), admin2.getAdmin_pwd())) {
				session.setAttribute("admin", admin2.getAdmin_id());
				return "adminHome";
			}else {
				model.addAttribute("message", "비밀번호가 틀렸습니다.");
				return "member/adminError";
			}
		}else {
			model.addAttribute("message", "아이디가 존재하지 않습니다.");
			return "member/adminError";
		}
	}
	
	@RequestMapping(value="alogout.do")
	public String adminLogout(HttpServletRequest request){
		HttpSession session = request.getSession(false);
		if(session != null) {
			session.removeAttribute("admin");
		}
		return "redirect:alogin.do";
	}
}
