package org.kh.billy.message.model.dao;

import java.util.List;

import org.kh.billy.message.model.vo.Message;
import org.kh.billy.product.model.vo.ProductForList;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

@Repository("messageDao")
//annotation할 때 이름을 지어줄 수 있다, 괄호 안에 넣어주면 됌
public class MessageDao {
	
	public List<Message> selectMessageList(SqlSessionTemplate mybatisSession) {
		return mybatisSession.selectList("messageMapper.selectMessageList");
	}

}
