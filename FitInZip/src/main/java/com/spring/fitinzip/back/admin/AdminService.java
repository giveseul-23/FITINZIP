package com.spring.fitinzip.back.admin;

import java.util.List;

import com.spring.fitinzip.back.admin.vo.MapVO;
import com.spring.fitinzip.back.member.vo.MemberVO;

public interface AdminService {
	void insertMap(MapVO vo);
	void updateMap(MapVO vo);
	List<MapVO> getMapList(MapVO vo);
}
