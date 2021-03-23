<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>
	<nav style="background-color:yellow;"><h2>여기는 nav</h2></nav>
	
	<article class="cart-list">
		<h2 class="cart-title">장바구니</h2>
		<div class="cart-amount">
			<span>~개 상품</span>
		</div>
		<div class="item-container">
			<div class="item-list" id="cart">
				<div class="product-delete-all">
					<a class="btn-product-delete-all" href=#>전체삭제</a>
				</div>
				<div class="product-opt-cart">
					<input type="hidden" name="proName">
					<input type="hidden" name="mem_id">
					<input type="hidden" name="amount">
				</div>
				<div class="product-detail">
					<div class="item-info">
						<span class="img-wrap">
						<img src=".." alt="상품이미지">
						</span>
						<div class="info-wrap">
					
						</div>
					</div>
					<div class="option-wrap">
						<button href=# class="btn-option-change">수량 변경</button>
					</div>
					<div class="total-price">가격 몇 원</div>
					<div class="delete-btn">
						<a class="btn-delete" href=#><img src="../resources/delete-icon.png"></a>
					</div>
				</div>
			</div>
		</div>
		
	</article>
</body>
</html>