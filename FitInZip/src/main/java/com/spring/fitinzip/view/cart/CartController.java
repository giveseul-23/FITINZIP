package com.spring.fitinzip.view.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.fitinzip.back.cart.CartService;
import com.spring.fitinzip.back.cart.vo.CartVO;

@Controller
public class CartController {

	@Autowired
	private CartService cartService;
	
	@RequestMapping("/cart")
	public String getCartList(Model model, CartVO vo) {
		
		List<CartVO> cartList = cartService.getCart(vo);
		
		model.addAttribute("cartList", cartList);
		
		return "cart/cart";
	}
}
