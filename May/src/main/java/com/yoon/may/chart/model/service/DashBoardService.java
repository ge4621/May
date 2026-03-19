package com.yoon.may.chart.model.service;

import java.util.List;

import com.yoon.may.chart.model.vo.DashBoard;
import com.yoon.may.schedule.model.vo.Category;
import com.yoon.may.schedule.model.vo.Schedule;

public interface DashBoardService {
	
	int selectMonthSchedule(DashBoard dashBoard,String userNo);
	
	int selectFinshSc(DashBoard dashBoard,String userNo);
	
	List<DashBoard> selectCategoryCnt(DashBoard dashBoard, String userNo);
	
	int addCategory(DashBoard dashBoard,String userNo);
	
	List<Category> selectCategoryType(String userNo);
	
	List<Schedule> selectDdaySc(String userNo);
	
	List<Schedule> selectCategoryMonthSc(Schedule schedule, String userNo);
	
	List<Schedule> selectScheduleMonth(Schedule schedule, String userNo);
	
	int deleteCategory(Category category, String userNo);
	
	Category selectCategoryDetail(Category category, String userNo);
	
	int updateCategory(Category category, String userNo);

}
