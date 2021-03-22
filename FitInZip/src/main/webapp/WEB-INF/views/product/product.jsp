<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FITINZIP | 용품</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="../resources/css/product.css"/>
<script>
	
</script>
</head>
<body>
	<nav><h1>여기는 navbar 자리입니다</h1></nav>

<div class="product-list">  
	<h1>홈트용품</h1>
	<hr>
	<div class="col-md-4">
	<c:forEach var="productList" items="${productList }">
		<div class="product-img">
			<button class="product-img-btn"><img src="${productList.proImg }"></button>
		</div>
		<h2 class="product-name">${productList.proName }</h2>
		<p class="product-price">${productList.proPrice }원</p>
		
		<c:if test="${productList.proPrice ne '2400' }">
        <p class="card-text">${productList.proInfo }</p>
        </c:if>
        <c:if test="${productList.proPrice eq '2400' }">
        <p class="card-text">다양한 중량선택 가능<br>튼튼한 쇠파이프 내장<br>강력한 웨이트 트레이닝 가능</p>
        </c:if>
		
		<form class="product-form">
		<c:if test="${productList.proName eq '덤벨 1kg~10kg'}">
			<select class="dumbbell-option" id="dumbbell">
				<option value="none">-[필수]옵션을 선택하세요-</option>
				<option value="1kg">1kg</option>
				<option value="2kg(+2,400원)">2kg(+2,400원)</option>
				<option value="3kg(+4,800원)">3kg(+4,800원)</option>
				<option value="4kg(+7,200원)">4kg(+7,200원)</option>
				<option value="5kg(+9,600원)">5kg(+9,600원)</option>
				<option value="6kg(+12,000원)">6kg(+12,000원)</option>
				<option value="7kg(+14,400원)">7kg(+14,400원)</option>
				<option value="8kg(+16,800원)">8kg(+16,800원)</option>
				<option value="9kg(+19,200원)">9kg(+19,200원)</option>
				<option value="10kg(+21,600원)">10kg(+21,600원)</option>
			</select>
			<div class="addcart-btn">
  			<button type="submit">장바구니</button>
  		 	</div>
		</c:if>
		
		<c:if test="${productList.proName eq '워크아웃 밴드'}">
			<select class="rubberband-option" id="rubberband">
				<option value="none">-[필수]옵션을 선택하세요-</option>
				<option value="레드 - 1.3cm MAX:20KG">레드 - 1.3cm MAX:20KG</option>
				<option value="블랙 - 2.1cm MAX:39KG">블랙 - 2.1cm MAX:39KG</option>
				<option value="퍼플 - 3.2cm MAX:45KG">퍼플 - 3.2cm MAX:45KG</option>
				<option value="그린 - 4.5cm MAX:75KG">그린 - 4.5cm MAX:75KG</option>
				<option value="블루 - 6.4cm MAX:100KG">블루 - 6.4cm MAX:100KG</option>
			</select>
			<div class="addcart-btn">
  			<button type="submit">장바구니</button>
  		 	</div>
		</c:if>
		
		<c:if test="${productList.proName ne '덤벨 1kg~10kg' && productList.proName ne '워크아웃 밴드' }">
		
			<div class="addcart-btn">
  			<button type="submit">장바구니</button>
  		 	</div>
		</c:if>
		 
  		 </form>
	</c:forEach>
	</div>
 
  
</div>    

</body>
</html>


















