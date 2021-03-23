package com.spring.fitinzip.back.member.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.spring.fitinzip.back.member.vo.MemberVO;

public interface LoginService {

	String kakaoIsFirst(String id) throws JsonProcessingException;
	void joinMember(MemberVO vo);
	void kakaoJoin(MemberVO vo);
}
