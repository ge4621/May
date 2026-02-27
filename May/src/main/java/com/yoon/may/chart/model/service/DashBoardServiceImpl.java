package com.yoon.may.chart.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yoon.may.chart.model.dao.DashBoardDao;
import com.yoon.may.chart.model.vo.DashBoard;
import com.yoon.may.schedule.model.vo.Category;
import com.yoon.may.schedule.model.vo.Schedule;

@Service
public class DashBoardServiceImpl implements DashBoardService{
	
	@Autowired
	DashBoardDao dashBoardDao;

	@Override
	public int selectMonthSchedule(DashBoard dashBoard, String userNo) {
		return dashBoardDao.selectMonthSchedule(dashBoard,userNo);
	}

	@Override
	public List<DashBoard> selectCategoryCnt(DashBoard dashBoard, String userNo) {
		return dashBoardDao.selectCategoryCnt(dashBoard,userNo);
	}

	@Override
	public int addCategory(DashBoard dashBoard, String userNo) {
		return dashBoardDao.addCategory(dashBoard,userNo);
	}

	@Override
	public List<Category> selectCategoryType(String userNo) {
		return dashBoardDao.selectCategoryType(userNo);
	}

	@Override
	public List<Schedule> selectDdaySc(String userNo) {
		return dashBoardDao.selectDdaySc(userNo);
	}

	@Override
	public List<Schedule> selectCategoryMonthSc(Schedule schedule, String userNo) {
		return dashBoardDao.selectCategoryMonthSc(schedule,userNo);
	}
	
}
