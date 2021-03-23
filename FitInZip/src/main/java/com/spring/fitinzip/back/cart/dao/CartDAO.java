package com.spring.fitinzip.back.cart.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.fitinzip.back.cart.vo.CartVO;

@Repository("cartDAO")
public class CartDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void addCart(CartVO vo) {
		
	}
	
	public List<CartVO> getCart(String mem_id) {
		return mybatis.selectList("CartDAO.getCartList", mem_id);
	}
}
