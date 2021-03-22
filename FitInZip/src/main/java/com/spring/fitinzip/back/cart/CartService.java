package com.spring.fitinzip.back.cart;

import java.util.List;

import com.spring.fitinzip.back.cart.vo.CartVO;

public interface CartService {

	List<CartVO> getCart(CartVO vo);
}
