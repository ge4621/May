package com.yoon.may.schedule.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yoon.may.schedule.model.dao.ScheduleDao;
import com.yoon.may.schedule.model.vo.Schedule;

@Service
public class ScheduleServiceImpl implements ScheduleService{

	@Autowired
	ScheduleDao scheduleDao;
	
	@Override
	public int saveSchedule(Schedule schedule,String userNo) {
		return scheduleDao.saveSchedule(schedule,userNo);
	}

	@Override
	public List<Schedule> selectSchedule(Schedule schedule, String userNo) {
		return scheduleDao.selectSchedule(schedule,userNo);
	}

	@Override
	public Schedule detailSchedule(Schedule schedule, String userNo) {
		return scheduleDao.detailSchedule(schedule,userNo);
	}

	@Override
	public int updateSchedule(Schedule schedule, String userNo) {
		return scheduleDao.updateSchedule(schedule,userNo);
	}

	@Override
	public int deleteSchedule(Schedule schedule, String userNo) {
		return scheduleDao.deleteSchedule(schedule,userNo);
	}
}
