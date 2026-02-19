package com.yoon.may.chart.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yoon.may.chart.model.dao.DashBoardDao;
import com.yoon.may.chart.model.vo.DashBoard;

@Service
public class DashBoardServiceImpl implements DashBoardService{
	
	@Autowired
	DashBoardDao dashBoardDao;

	@Override
	public int selectMonthSchedule(DashBoard dashBoard, String userNo) {
		return dashBoardDao.selectMonthSchedule(dashBoard,userNo);
	}

	@Override
	public List<DashBoard> selectDategoryCnt(DashBoard dashBoard, String userNo) {
		return dashBoardDao.selectDategoryCnt(dashBoard,userNo);
	}
	
}
