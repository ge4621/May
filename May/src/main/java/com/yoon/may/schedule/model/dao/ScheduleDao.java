package com.yoon.may.schedule.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yoon.may.schedule.model.vo.Schedule;

@Repository
public class ScheduleDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public int saveSchedule(Schedule schedule, String userNo) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("schedule",schedule);
		param.put("userNo",userNo);
		
		return sqlSession.insert("saveSehedule", param);
	}
	
	public List<Schedule> selectSchedule(Schedule schedule, String userNo){
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("startDate",schedule.getStartDate());
		param.put("userNo",userNo);
		
		return sqlSession.selectList("selectSchedule",param);
	}

}
