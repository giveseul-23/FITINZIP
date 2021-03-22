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
	
	public List<CartVO> getCart(CartVO vo) {
		return mybatis.selectList("CartDAO.getCartList");
	}
}
