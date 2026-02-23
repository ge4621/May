package com.yoon.may.chart.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yoon.may.chart.model.service.DashBoardServiceImpl;
import com.yoon.may.chart.model.vo.DashBoard;
import com.yoon.may.member.model.vo.Member;

@Controller
public class DashBoardController {
	
	@Autowired
	private DashBoardServiceImpl dashBoardService;
	
	@RequestMapping("selectMonthSc.do")
	@ResponseBody
	public int selectMonthSchedule(DashBoard dashBoard, HttpSession session) {
		Member loginMember = (Member)session.getAttribute("loginMember");
		String userNo = loginMember.getUserNo();
		int MonthCnt = dashBoardService.selectMonthSchedule(dashBoard,userNo);
		return MonthCnt;
	}
	
	@RequestMapping("selectCategorySc.do")
	@ResponseBody
	public List<DashBoard> selectCategory(DashBoard dashBoard, HttpSession session){
		Member loginMember = (Member)session.getAttribute("loginMember");
		String userNo = loginMember.getUserNo();
		System.out.println(dashBoard);
		List<DashBoard> selectCategoryCnt = dashBoardService.selectCategoryCnt(dashBoard,userNo);
		return selectCategoryCnt;
	}

}
