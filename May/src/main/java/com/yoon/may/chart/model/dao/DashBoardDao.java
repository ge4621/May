package com.yoon.may.chart.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yoon.may.chart.model.vo.DashBoard;

@Repository
public class DashBoardDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public int selectMonthSchedule(DashBoard dashBoard, String userNo) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("dashBoard", dashBoard);
		param.put("userNo", userNo);
		return sqlSession.selectOne("selectMonthSchedule",param);
	}
	
	public List<DashBoard> selectDategoryCnt(DashBoard dashBoard, String userNo){
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("dashBoard", dashBoard);
		param.put("userNo", userNo);
		return sqlSession.selectOne("selectDategoryCnt", param);
	}

}
