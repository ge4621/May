package com.yoon.may.schedule.model.service;


import java.util.List;

import com.yoon.may.schedule.model.vo.Schedule;

public interface ScheduleService {
	
	int saveSchedule(Schedule schedule,String userNo);
	
	List<Schedule> selectSchedule(Schedule schedule, String userNo);
	
	Schedule detailSchedule(Schedule schedule, String userNo);
	
	int updateSchedule(Schedule schedule,String userNo);
	
	int deleteSchedule(Schedule schedule,String userNo);

}
