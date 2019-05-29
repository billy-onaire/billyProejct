package org.kh.billy.statistics.model.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.kh.billy.statistics.model.service.StatisticsService;
import org.kh.billy.statistics.model.vo.Deal;
import org.kh.billy.statistics.model.vo.SignUp;
import org.kh.billy.statistics.model.vo.Visit;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class StatisticsController {

	private static final Logger logger = LoggerFactory.getLogger(StatisticsController.class);
	
	@Autowired
	private StatisticsService stService;
	
	@RequestMapping(value="loginVisit.do", method= {RequestMethod.POST,RequestMethod.GET})
	public void loginVisit(@RequestParam String today, HttpServletResponse response,SignUp su,Visit visit,Deal deal) throws ParseException, IOException {
		response.setContentType("application/json; charset=utf-8");
		visit = stService.selectLoginVisit(today);
		su = stService.selectSignUpCount(today);
		deal = stService.selectDealCount(today);
		JSONObject obj = new JSONObject();
		JSONArray jar = new JSONArray();
		JSONObject info;
		
		info = new JSONObject();
		info.put("date", visit.getFirstDay());
		info.put("count", visit.getFirstCount());
		info.put("scount", su.getFirstCount());
		info.put("dcount", deal.getFirstCount());
		jar.add(info);
		
		info = new JSONObject();
		info.put("date", visit.getSecondDay());
		info.put("count", visit.getSecondCount());
		info.put("scount", su.getSecondCount());
		info.put("dcount", deal.getSecondCount());
		jar.add(info);
		
		info = new JSONObject();
		info.put("date", visit.getThridDay());
		info.put("count", visit.getThridCount());
		info.put("scount", su.getThridCount());
		info.put("dcount", deal.getThridCount());
		jar.add(info);
		
		info = new JSONObject();
		info.put("date", visit.getFourthDay());
		info.put("count", visit.getFourthCount());
		info.put("scount", su.getFourthCount());
		info.put("dcount", deal.getFourthCount());
		jar.add(info);
		
		obj.put("list", jar);
		
		PrintWriter out = response.getWriter();
		out.println(obj.toJSONString());
		out.flush();
		out.close();
	}
}
