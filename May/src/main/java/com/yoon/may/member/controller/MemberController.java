package com.yoon.may.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yoon.may.member.model.service.MemberServiceImpl;
import com.yoon.may.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	private MemberServiceImpl memberService;
	 //로그인 페이지
	 @GetMapping("/main")
     public String home() {
        return "main";
     }
	//로그인
	@RequestMapping("login.member")
	public String loginMember(Member member,Model model,HttpSession session) {
		Member loginMember = memberService.loginMember(member);
		System.out.println("로그인 확인 : " + loginMember);

		if(loginMember != null) {
			session.setAttribute("loginMember", loginMember);
			return "redirect:/main";
		}
		
		model.addAttribute("msg","아이디 또는 비밀번호가 일치하지 않습니다.");
		return "redirect:/";
	}
	//로그아웃
	@RequestMapping("logout.member")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
}
