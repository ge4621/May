package com.yoon.may.chart.model.service;

import java.util.List;

import com.yoon.may.chart.model.vo.DashBoard;

public interface DashBoardService {
	
	int selectMonthSchedule(DashBoard dashBoard,String userNo);
	
	List<DashBoard> selectCategoryCnt(DashBoard dashBoard, String userNo);

}
