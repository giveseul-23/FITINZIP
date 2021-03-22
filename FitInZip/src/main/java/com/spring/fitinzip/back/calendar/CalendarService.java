package com.spring.fitinzip.back.calendar;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.spring.fitinzip.back.calendar.vo.CalendarVO;
import com.spring.fitinzip.back.cls.vo.ClsVO;

public interface CalendarService {
	List<ClsVO> selectClassList(HttpServletRequest request);
	List<CalendarVO> selectAttendList(HttpServletRequest request);
}
