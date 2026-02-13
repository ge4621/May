package com.yoon.may.schedule.model.service;

import java.util.List;

import com.yoon.may.schedule.model.vo.Category;

public interface CategoryService {
	
	List<Category> selectCategory(Category category, String userNo);

}
