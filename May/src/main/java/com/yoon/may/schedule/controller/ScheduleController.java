package com.yoon.may.schedule.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yoon.may.member.model.vo.Member;
import com.yoon.may.schedule.model.service.ScheduleService;
import com.yoon.may.schedule.model.service.ScheduleServiceImpl;
import com.yoon.may.schedule.model.vo.Category;
import com.yoon.may.schedule.model.vo.Schedule;

@Controller
public class ScheduleController {

	@Autowired
	private ScheduleServiceImpl scheduleService;
	
	@RequestMapping("saveSchedule.do")
	@ResponseBody
	public Map<String, Object> saveSchedule(Schedule schedule,HttpSession session , Category category) {
		Map<String, Object> result = new HashMap<String, Object>();
		
		Member loginMember = (Member)session.getAttribute("loginMember");
		String userNo = loginMember.getUserNo();
		
		int saveResult = scheduleService.saveSchedule(schedule,userNo);
		
		if(saveResult > 0) {
			result.put("success", true);
		}else {
			result.put("success", false);
		}
		return result;
	}
	
	@RequestMapping("selectSchedule.do")
	@ResponseBody
	public List<Schedule> selectSchedule(Schedule schedule,HttpSession session) {
		Member loginMember = (Member)session.getAttribute("loginMember");
		String userNo = loginMember.getUserNo();
		
		List<Schedule> scheduleList = scheduleService.selectSchedule(schedule,userNo);
		return scheduleList;
	}
	
	@RequestMapping("DetailSchedule.do")
	@ResponseBody
	public Map<String, Object> detailSchedule(Schedule schedule, HttpSession session){
		Member loginMember = (Member)session.getAttribute("loginMember");
		String userNo = loginMember.getUserNo();
		
		Schedule scheduleDetail = scheduleService.detailSchedule(schedule,userNo);
		Map<String, Object> result = new HashMap<String, Object>();
	    result.put("scheduleNo", scheduleDetail.getScheduleNo());
	    result.put("title", scheduleDetail.getTitle());
	    result.put("content", scheduleDetail.getContent());
	    result.put("categoryNo", scheduleDetail.getCategoryNo());

	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    result.put("startDate", sdf.format(scheduleDetail.getStartDate()));
	    result.put("endDate", sdf.format(scheduleDetail.getEndDate()));

	    return result;
	}
	
	@RequestMapping("updateSchedule.do")
	@ResponseBody
	public Map<String, Object> updateSchedule(Schedule schedule, HttpSession session) {
		Map<String, Object> result = new HashMap<String, Object>();
		
		Member loginMember = (Member)session.getAttribute("loginMember");
		String userNo = loginMember.getUserNo();
		
		int updateSchedule = scheduleService.updateSchedule(schedule,userNo);
		
		if(updateSchedule > 0) {
			result.put("success", true);
		}else {
			result.put("success", false);
		}
		return result;
	}
	
	@RequestMapping("deleteSchedule.do")
	@ResponseBody
	public Map<String, Object> deleteSchedule(Schedule schedule, HttpSession session) {
		Map<String, Object> result = new HashMap<String, Object>();
		Member loginMember = (Member)session.getAttribute("loginMember");
		String userNo = loginMember.getUserNo();
		
		int deleteSchedule = scheduleService.deleteSchedule(schedule,userNo);
		
		if(deleteSchedule > 0) {
			result.put("success", true);
		}else {
			result.put("success", false);
		}
		return result;
	}
	
	@GetMapping("/dashBoard")
	public String dashBoard() {
		return "dashBoard";
	}
	
	@RequestMapping("loadMonthSchedule.do")
	@ResponseBody
	public List<Map<String,Object>> loadMonthSchedule(Schedule schedule, HttpSession session) {
		Member loginMember = (Member)session.getAttribute("loginMember");
		String userNo = loginMember.getUserNo();
		
		List<Schedule> scheduleCnt = scheduleService.loadMonthSchedule(schedule,userNo);

		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		for(Schedule s : scheduleCnt) {
			Map<String, Object> scheduleMap = new HashMap<String, Object>();
			
			scheduleMap.put("scheduleNo", s.getScheduleNo());
	        scheduleMap.put("title", s.getTitle());
	        scheduleMap.put("content", s.getContent());
	        scheduleMap.put("categoryNo", s.getCategoryNo());

	        scheduleMap.put("startDate", sdf.format(s.getStartDate()));

	        if(s.getEndDate() != null){
	            scheduleMap.put("endDate", sdf.format(s.getEndDate()));
	        }else{
	            scheduleMap.put("endDate", null);
	        }

	        result.add(scheduleMap);
			
		}
		return result;
	}
	
	
}
