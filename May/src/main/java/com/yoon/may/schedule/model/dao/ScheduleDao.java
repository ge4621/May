package com.yoon.may.schedule.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yoon.may.schedule.model.vo.Schedule;

@Repository
public class ScheduleDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public int saveSchedule(Schedule schedule) {
		return sqlSession.insert("saveSehedule", schedule);
	}

}
