package org.kh.billy.admin.model.service;

import java.util.ArrayList;

import org.kh.billy.visit.model.vo.Visit;

public interface AdminService {

	ArrayList<Visit> selectLoginVisit(String today);

	ArrayList<Integer> selectLoginCount(ArrayList<Visit> vList);
	
}
