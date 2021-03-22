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
	
	<c:forEach var="cartList" items="${cartList }">
	
	<table>
		<tr>
		<td>${cartList.proImg }</td>
		</tr>
	</table>
	</c:forEach>
</body>
</html>