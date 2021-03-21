package com.spring.fitinzip.back.member;

import com.spring.fitinzip.back.member.vo.memberVO;

public interface LoginService {

	void joinMember(memberVO vo);
	void loginMember(memberVO vo);
	
}
