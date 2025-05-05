package com.yoon.may.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yoon.may.member.model.service.MemberServiceImpl;
import com.yoon.may.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	private MemberServiceImpl memberService;
	
	@RequestMapping("login.member")
	public Model loginMember(Member member,Model model) {
		Member loginMember = memberService.loginMember(member);
		System.out.println("로그인 확인 : " + loginMember);
		model.addAttribute(loginMember);
		return model;
	}
	
}
