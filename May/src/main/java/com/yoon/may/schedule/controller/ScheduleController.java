package com.yoon.may.schedule.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yoon.may.member.model.vo.Member;
import com.yoon.may.schedule.model.service.ScheduleService;
import com.yoon.may.schedule.model.service.ScheduleServiceImpl;
import com.yoon.may.schedule.model.vo.Schedule;

@Controller
public class ScheduleController {

	@Autowired
	private ScheduleServiceImpl scheduleService;
	
	@RequestMapping("saveSchedule.do")
	@ResponseBody
	public Map<String, Object> saveSchedule(Schedule schedule,HttpSession session) {
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
		System.out.println("scheduleList : " + scheduleList.size());
		return scheduleList;
	}
}
