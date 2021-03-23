package com.spring.fitinzip.view.admin;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.spring.fitinzip.back.calendar.CalendarService;
import com.spring.fitinzip.back.calendar.dao.CalendarDAO;
import com.spring.fitinzip.back.calendar.vo.CalendarVO;

@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private CalendarService calendarService;
	private String mem_id;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		HttpSession session = request.getSession();
		session.setAttribute("ID", "hong");
		mem_id = (String)session.getAttribute("ID");
		
		return "home";
	}
	
	@RequestMapping(value="calendar")
	public String goCalendar(HttpServletRequest request, Model model) {
		
		return "calendar/myCalendar";
	}
	
	@RequestMapping(value = "getAttendance")
	@ResponseBody
	public List<CalendarVO> getAttendance() {
		List<CalendarVO> list = calendarService.selectAttendList(mem_id);
		
		return list;
	}
	
	
	@RequestMapping(value = "setAttendance")
	@ResponseBody
	public Map<String, String> name() {
		CalendarVO vo = calendarService.chkAttendance(mem_id);
		Map<String, String> map = new HashMap<String, String>();
		
		if(vo != null) {
			map.put("result", "overlap");
			return map;
		}
		
		int result = calendarService.insertAttendance(mem_id);
		if(result == 1) {
			map.put("result", "chk");
		}
		return map;
	}
	
}
