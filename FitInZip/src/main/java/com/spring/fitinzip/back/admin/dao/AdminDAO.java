package com.spring.fitinzip.back.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.fitinzip.back.admin.vo.MapVO;

@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insert(MapVO vo) {
		mybatis.insert("AdminDAO.insert", vo);
	}
	
	public void update(MapVO vo) {
		
	}
	
	public List<MapVO> selectMap(MapVO vo) {
		return mybatis.selectList("AdminDAO.select", vo);
	}
	
	public void delete(MapVO vo) {
		
	}
	
}
