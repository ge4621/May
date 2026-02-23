package com.yoon.may.chart.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class DashBoard {
	
	private String userNo;
	private Date startDate;
	private Date endDate;
	private String currentMonth;
	
}
