package org.kh.billy.visit.action;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.kh.billy.visit.model.dao.VisitDao;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

public class VisitController implements HttpSessionListener{
	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		HttpSession session = se.getSession();
		System.out.println("session 생성 : " + session.getId());
        WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(session.getServletContext());
        //등록되어있는 빈을 사용할수 있도록 설정해준다
        VisitDao visitDao = (VisitDao)wac.getBean("visitDao");
        SqlSessionTemplate vSession = (SqlSessionTemplate)wac.getBean(SqlSessionTemplate.class);
        if(visitDao.insertVisit(vSession) > 0) {
        	System.out.println("방문자 수 증가");
        }else {
        	System.out.println("방문자 수 실패!");
        }
	}
	
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		HttpSession session = se.getSession();
		System.out.println("session 만료 : " + session.getId());
	}
	
}
