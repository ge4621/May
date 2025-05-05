package com.yoon.may.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
@AllArgsConstructor
public class Member {

	private int userNo;
	private String userId;
	private String userPwd;
}
