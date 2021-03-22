package com.spring.fitinzip.back.calendar;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.fitinzip.back.calendar.dao.CalendarDAO;
import com.spring.fitinzip.back.calendar.vo.CalendarVO;
import com.spring.fitinzip.back.cls.vo.ClsVO;

@Service
public class CalendarServiceImpl implements CalendarService {
	@Autowired
	private CalendarDAO calendarDAO;
	
	@Override
	public List<ClsVO> selectClassList(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CalendarVO> selectAttendList(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String mem_id = (String)session.getAttribute("ID");
		System.out.println("id : " + mem_id);
		List<CalendarVO> list = calendarDAO.selectAttendList(mem_id);
		
		return list;
	}
	
}
