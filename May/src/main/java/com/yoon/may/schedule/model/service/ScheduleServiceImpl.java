package com.yoon.may.schedule.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.yoon.may.schedule.model.dao.ScheduleDao;
import com.yoon.may.schedule.model.vo.Schedule;

public class ScheduleServiceImpl implements ScheduleService{

	@Autowired
	ScheduleDao scheduleDao;
	
	@Override
	public int saveSchedule(Schedule schedule) {
		return scheduleDao.saveSchedule(schedule);
	}
}
