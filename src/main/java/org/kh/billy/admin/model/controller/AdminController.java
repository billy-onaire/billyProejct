package org.kh.billy.admin.model.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.kh.billy.admin.model.service.AdminService;
import org.kh.billy.visit.model.vo.Visit;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	
	@Autowired
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private AdminService aService;
	
	@RequestMapping(value="loginVisit.do", method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView loginVisit(ModelAndView mv,Model model, @RequestParam String today) throws ParseException {
		System.out.println("넘어온 날짜 : " + today);
		ArrayList<Visit> vList = aService.selectLoginVisit(today);
		ArrayList<Integer> cList = aService.selectLoginCount(vList);
		for(Integer i : cList) {
			System.out.println("cList : " + i);
		}
		return mv;
	}
	
	
}
