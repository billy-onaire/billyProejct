package org.kh.billy.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.kh.billy.visit.model.vo.Visit;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("adao")
public class AdminDao {

	public ArrayList<Visit> selectLoginVisit(SqlSessionTemplate session, String today) {
		List<Visit> list = session.selectList("visitMapper.selectLoginVisit",today);
		ArrayList<Visit> vList = (ArrayList<Visit>)list;
		return vList;
	}

	public ArrayList<Integer> selectLoginCount(SqlSessionTemplate session, ArrayList<Visit> visit) {
		/*Map<String, Object> map = new HashMap<>();
		map.put("visit", visit);*/
		List<Integer> list = session.selectList("visitMapper.selectLoginCount",visit);
		ArrayList<Integer> cList = (ArrayList<Integer>)list;
		return cList;
	}
	
}
