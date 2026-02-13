package com.yoon.may.schedule.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yoon.may.schedule.model.vo.Category;

@Repository
public class CategoryDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public List<Category> selectCategory(Category schedule, String userNo){
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("userNo",userNo);
		return sqlSession.selectList("selectCategory",param);
	}

}
