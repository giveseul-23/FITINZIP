package com.spring.fitinzip.back.calendar.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.fitinzip.back.calendar.vo.CalendarVO;

@Repository("calendarDAO")
public class CalendarDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public CalendarDAO() {
		System.out.println("CalendarDAO 생성자 호출");
	}
	
	public List<CalendarVO> selectAttendList(String mem_id) {
		List<CalendarVO> list = mybatis.selectList("calendar.selectAttend", mem_id);
		for (CalendarVO calendarVO : list) {
			System.out.println("list : " + calendarVO);
		}
		
		return list;
	}
	
}
