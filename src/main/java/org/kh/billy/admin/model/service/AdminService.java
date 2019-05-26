package org.kh.billy.admin.model.service;

import org.kh.billy.admin.model.vo.Admin;

public interface AdminService {

	void insertAdmin(Admin admin);

	Admin selectAdminId(String adminId);

	int selectCheckId();
}
