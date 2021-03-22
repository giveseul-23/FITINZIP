package com.spring.fitinzip.back.cart.dao;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.fitinzip.back.cart.CartService;
import com.spring.fitinzip.back.cart.vo.CartVO;

@Service("cartService")
public class CartServiceImpl implements CartService {

	@Override
	public List<CartVO> getCart(CartVO vo) {
		return null;
	}

}
