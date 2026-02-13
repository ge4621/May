package com.yoon.may.schedule.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yoon.may.member.model.vo.Member;
import com.yoon.may.schedule.model.service.CategoryServiceImpl;
import com.yoon.may.schedule.model.vo.Category;

@Controller
public class CategoryController {
	
	@Autowired
	private CategoryServiceImpl categoryService;
	
	@RequestMapping("selectCategory.do")
	@ResponseBody
	public List<Category> selectCategory(Category category,HttpSession session){
		Member loginMember = (Member)session.getAttribute("loginMember");
		String userNo = loginMember.getUserNo();
		
		List<Category> categoryList = categoryService.selectCategory(category,userNo);
		return categoryList;
	}


}
