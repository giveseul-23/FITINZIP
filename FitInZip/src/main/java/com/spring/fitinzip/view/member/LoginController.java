package com.spring.fitinzip.view.member;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
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
		
		return "loginMain";
	}
	
	// 가입선택화면
	@RequestMapping("/joinMain")
	public String joinMain() {
		System.out.println("joinMain 실행중");
		
		return "joinMain";
	}
	
	// 가입정보 받기
	@RequestMapping(value="/kakaoLogin")
	@ResponseBody
	public String kakaoLoginInfo(String id) throws JsonProcessingException {
		// 일단 카카오로 받은 정보 DB에 있는지 없는지 확인해야함
		System.out.println(">>> - KakaoLoginInfo()");
		System.out.println("id : " + id);
		ObjectMapper mapper = new ObjectMapper();
		
		
		String isFirst = loginService.kakaoIsFirst(id);
		
		return mapper.writeValueAsString(isFirst);
	}
	
	// 카카오 가입자 기본정보 가지고 추가정보 기입창 ㄱㄱ ㅅㅂ
	@RequestMapping("/kakaoAdd")
	public String kakaoAddInfo(MemberVO vo, HttpServletRequest request) {
		System.out.println(">>> - kakaoAddInfo()");
		System.out.println("vo : " + vo);
		
		request.getSession().setAttribute("vo", vo);
		
		return "kakaoAdd";
	}
	
	@RequestMapping(value="/kakaoJoin", method=RequestMethod.POST)
	public void kakaoJoin(@RequestBody MemberVO vo) throws Exception {
		System.out.println(">>> - 카카오 추가정보 가지고 insert하러 가자 제발~.~");
		System.out.println("추가정보 입력 후 vo : " + vo);
		
		loginService.kakaoJoin(vo);
		
	}
	
	
}
