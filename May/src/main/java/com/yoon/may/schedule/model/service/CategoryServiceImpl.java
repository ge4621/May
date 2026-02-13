package com.yoon.may.schedule.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yoon.may.schedule.model.dao.CategoryDao;
import com.yoon.may.schedule.model.vo.Category;

@Service
public class CategoryServiceImpl implements CategoryService{
	
	@Autowired
	CategoryDao categoryDao;
	
	@Override
	public List<Category> selectCategory(Category category, String userNo) {
		return categoryDao.selectCategory(category,userNo);
	}


}
