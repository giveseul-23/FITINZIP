package com.spring.fitinzip.view.cart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public String getCartList(Model model, CartVO vo, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		session.setAttribute("mem_id", "jinah"); //DB에 jinah라는 아이디에 해당하는 장바구니 있음
		
		String mem_id = (String)session.getAttribute("mem_id");
		
		List<CartVO> cartList = cartService.getCart(mem_id);
		
		model.addAttribute("cartList", cartList);
		
		return "cart/cart";
	}
}
