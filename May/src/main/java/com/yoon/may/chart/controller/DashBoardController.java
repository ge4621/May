package com.yoon.may.chart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yoon.may.chart.model.service.DashBoardServiceImpl;
import com.yoon.may.chart.model.vo.DashBoard;
import com.yoon.may.member.model.vo.Member;
import com.yoon.may.schedule.model.vo.Category;
import com.yoon.may.schedule.model.vo.Schedule;

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
	
	@RequestMapping("selectFinshSc.do")
	@ResponseBody
	public int selectFinshSc(DashBoard dashBoard, HttpSession session) {
		Member loginMember = (Member)session.getAttribute("loginMember");
		String userNo = loginMember.getUserNo();
		
		int selectFinshSc = dashBoardService.selectFinshSc(dashBoard,userNo);
		return selectFinshSc;
	}
	
	@RequestMapping("selectFinshRate.do")
	@ResponseBody
	public int selectFinshRate(DashBoard dashBoard, HttpSession session) {
		Member loginMember = (Member)session.getAttribute("loginMember");
		String userNo = loginMember.getUserNo();
		
		int monthAllSchedule = dashBoardService.selectMonthSchedule(dashBoard,userNo);
		int finshSchedule = dashBoardService.selectFinshSc(dashBoard,userNo);
		
		int rate = 0;
		if(monthAllSchedule > 0) {
			rate = (int)((double)finshSchedule / monthAllSchedule * 100);
		}else {
			rate = 0;
		}
		return rate;
	}
	
	@RequestMapping("selectCategorySc.do")
	@ResponseBody
	public List<DashBoard> selectCategory(DashBoard dashBoard, HttpSession session){
		Member loginMember = (Member)session.getAttribute("loginMember");
		String userNo = loginMember.getUserNo();
		
		List<DashBoard> selectCategoryCnt = dashBoardService.selectCategoryCnt(dashBoard,userNo);
		return selectCategoryCnt;
	}
	
	@RequestMapping("selectCategoryType.do")
	@ResponseBody
	public List<Category> selectCategoryType(HttpSession session){
		Member loginMember = (Member)session.getAttribute("loginMember");
		String userNo = loginMember.getUserNo();
		
		List<Category> selectCategoryType = dashBoardService.selectCategoryType(userNo);
		return selectCategoryType;
	}
	
	@RequestMapping("addCategory.do")
	@ResponseBody
	public Map<String, Object> addCategory(DashBoard dashBoard, HttpSession session){
		Map<String, Object> result = new HashMap<String, Object>();
		
		Member loginMember = (Member)session.getAttribute("loginMember");
		String userNo = loginMember.getUserNo();
		
		int addCategory = dashBoardService.addCategory(dashBoard,userNo);
		
		if(addCategory > 0) {
			result.put("success", true);
		}else {
			result.put("success", false);
		}
		return result;
	}
	
	@RequestMapping("selectDdaySc.do")
	@ResponseBody
	public List<Schedule> selectDdaySc(HttpSession session){
		Member loginMember = (Member)session.getAttribute("loginMember");
		String userNo = loginMember.getUserNo();
		
		List<Schedule> selectDdaySc = dashBoardService.selectDdaySc(userNo);
		return selectDdaySc;
	}
	
	@RequestMapping("selectCategoryMonthSc.do")
	@ResponseBody
	public List<Schedule> selectCategoryMonthSc(HttpSession session, Schedule schedule){
		Member loginMember = (Member)session.getAttribute("loginMember");
		String userNo = loginMember.getUserNo();
		
		List<Schedule> selectCategoryMonthSc = dashBoardService.selectCategoryMonthSc(schedule,userNo);
		return selectCategoryMonthSc;
	}
	
	@RequestMapping("selectScheduleMonth.do")
	@ResponseBody
	public List<Schedule> selectScheduleMonth(HttpSession session, Schedule schedule){
		Member loginMember = (Member)session.getAttribute("loginMember");
		String userNo = loginMember.getUserNo();
		
		List<Schedule> selectScheduleMonth = dashBoardService.selectScheduleMonth(schedule,userNo);
		return selectScheduleMonth;
	}
	
	@RequestMapping("deleteCategory.do")
	@ResponseBody
	public Map<String, Object> deleteCategory(HttpSession session,Category category) {
		Map<String, Object> result = new HashMap<String, Object>();
		
		Member loginMember = (Member)session.getAttribute("loginMember");
		String userNo = loginMember.getUserNo();
		
		int deleteCategory = dashBoardService.deleteCategory(category,userNo);
		
		if(deleteCategory > 0) {
			result.put("success", true);
		}else {
			result.put("success", false);
		}
		return result;
	}
	
	@RequestMapping("selectCategoryDetail.do")
	@ResponseBody
	public Map<String, Object> selectCategoryDetail(HttpSession session, Category category){
		Member loginMember = (Member)session.getAttribute("loginMember");
		String userNo = loginMember.getUserNo();
		
		Category categoryDetail = dashBoardService.selectCategoryDetail(category,userNo);
		Map<String, Object> result = new HashMap<String, Object>();
	    result.put("categoryNo", categoryDetail.getCategoryNo());
	    result.put("categoryName", categoryDetail.getCategoryName());
	    
	    return result;
	}

	@RequestMapping("updateCategory.do")
	@ResponseBody
	public Map<String, Object> updateCategory(HttpSession session, Category category){
		Map<String, Object> result = new HashMap<String, Object>();
		
		Member loginMember = (Member)session.getAttribute("loginMember");
		String userNo = loginMember.getUserNo();
		
		int updateCategory = dashBoardService.updateCategory(category,userNo);
		
		if(updateCategory > 0) {
			result.put("success", true);
		}else {
			result.put("success", false);
		}
		return result;
	}
}
