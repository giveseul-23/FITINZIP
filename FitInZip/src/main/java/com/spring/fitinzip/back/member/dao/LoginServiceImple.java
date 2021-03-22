package com.spring.fitinzip.back.member.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.fitinzip.back.member.service.LoginService;
import com.spring.fitinzip.back.member.vo.MemberVO;

@Service
public class LoginServiceImple implements LoginService{
	
	/* @Autowired */
	private MemberDAO memberDAO;
	
	@Override
	public void joinMember(MemberVO vo) {
		/*memberDAO.joinMember(vo);*/
	}

	
}
