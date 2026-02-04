package com.yoon.may.schedule.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yoon.may.schedule.model.service.ScheduleService;
import com.yoon.may.schedule.model.service.ScheduleServiceImpl;
import com.yoon.may.schedule.model.vo.Schedule;

@Controller
public class ScheduleController {

	@Autowired
	private ScheduleServiceImpl scheduleService;
	
	@RequestMapping("saveSchedule.do")
	@ResponseBody
	public Map<String, Object> saveSchedule(Schedule schedule) {
		Map<String, Object> result = new HashMap<String, Object>(); 
		int saveResult = scheduleService.saveSchedule(schedule);
		
		if(saveResult > 0) {
			result.put("success", true);
		}else {
			result.put("success", false);
		}
		return result;
	}
}
