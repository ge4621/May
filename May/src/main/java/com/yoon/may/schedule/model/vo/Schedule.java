package com.yoon.may.schedule.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Schedule {

		private String scheduleNo;
		private String userNo;
		private String title;
		private String content;
		private Date startDate;
		private String categoryNo;
		
		private String countDay;
}
