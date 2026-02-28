package com.yoon.may.chart.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yoon.may.chart.model.vo.DashBoard;
import com.yoon.may.schedule.model.vo.Category;
import com.yoon.may.schedule.model.vo.Schedule;

@Repository
public class DashBoardDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public int selectMonthSchedule(DashBoard dashBoard, String userNo) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("dashBoard", dashBoard);
		param.put("userNo", userNo);
		System.out.println(dashBoard);
		return sqlSession.selectOne("selectMonthSchedule",param);
	}
	
	public List<DashBoard> selectCategoryCnt(DashBoard dashBoard, String userNo){
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("dashBoard", dashBoard);
		param.put("userNo", userNo);
		return sqlSession.selectList("selectCategoryCnt", param);
	}

	public int addCategory(DashBoard dashBoard, String userNo) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("dashBoard", dashBoard);
		param.put("userNo", userNo);
		return sqlSession.insert("addCategory", param);
	}
	
	public List<Category> selectCategoryType(String userNo){
		return sqlSession.selectList("selectCategoryType",userNo);
	}
	
	public List<Schedule> selectDdaySc(String userNo){
		return sqlSession.selectList("selectDdaySc",userNo);
	}
	
	public List<Schedule> selectCategoryMonthSc(Schedule schedule,String userNo){
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("schedule", schedule);
		param.put("userNo", userNo);
		return sqlSession.selectList("selectCategoryMonthSc",param);
	}
	
	public List<Schedule> selectScheduleMonth(Schedule schedule,String userNo){
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("schedule", schedule);
		param.put("userNo", userNo);
		return sqlSession.selectList("selectScheduleMonth",param);
	}
}
