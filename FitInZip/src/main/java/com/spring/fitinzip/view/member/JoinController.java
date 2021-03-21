package com.spring.fitinzip.view.member;

import org.springframework.beans.factory.annotation.Autowired;

import com.spring.fitinzip.back.member.LoginService;

public class JoinController {

	@Autowired
	private LoginService loginService;
	
	@RequestMapping("/mypage/")
	public String updateMember(MemberVO vo) {
		System.out.println("updateMember 실행중");
		mypageService.updateMember(vo);
		return "mypage/mypage";
	}
}
