package com.spring.fitinzip.view.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.fitinzip.back.member.service.LoginService;
import com.spring.fitinzip.back.member.vo.MemberVO;

@Controller
public class LoginController {
	
	@Autowired
	private LoginService loginService; 
	 
	// 로그인화면
	@RequestMapping("/loginMain")
	public String loginMain() {
		System.out.println("loginMain 실행중");
		
		return "login";
	}
	
	// 가입선택화면
	@RequestMapping("/joinMain")
	public String joinMain() {
		System.out.println("joinMain 실행중");
		
		return "join";
	}
	
	// 가입정보 받기
	@RequestMapping(value="/join")
	public void joinMemeberInfo(MemberVO vo) {
		System.out.println(">>> 가입 - join()");
		System.out.println("vo : " + vo);
		
		
		
		
		//loginService.joinMember(vo);
	}
	
	
	
}
