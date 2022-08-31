<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='root' value="${pageContext.request.contextPath}/"/>
<!doctype html>
<html>
  <head>
	<meta charset="UTF-8">
	<title>품목등록</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="style.css">
  </head>
<body>

<c:import url="/WEB-INF/views/include/top_menu.jsp"/>

		<div class="side_menu">  
			<ul>
            <li class="nav-item"><a href="${root }menu/input/client">거래처등록</a></li>
            <li class="nav-item"><a href="${root }menu/input/product">품목등록</a></li>
            <li class="nav-item"><a href="${root }menu/input/order">주문등록</a></li>
            <li class="nav-item"><a href="${root }menu/input/process">공정등록</a></li>
            </ul>
		</div>
		
	<form:form action="${root }menu/input/product_pro" method="post" modelAttribute="productInfoBean">
		
		<div class="table_arrange">
		<div class="table_title">
		<h1>품목등록</h1>
		</div>
			<div class="input-group mb-3">
				<table>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">품목코드</span></th>
						<td><input type="text" id="product_idx" name="product_idx" class="form-control" aria-label="Username" aria-describedby="basic-addon1"></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">품목구분</span></th>
						<td><input type="text" id="product_div" name="product_div" class="form-control" aria-label="Username" aria-describedby="basic-addon1"></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">모델번호</span></th>
						<td><input type="text" id="product_modelno" name="product_modelno" class="form-control" aria-label="Username" aria-describedby="basic-addon1"></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">품목명</span></th>
						<td><input type="text" id="product_name" name="product_name" class="form-control" aria-label="Username" aria-describedby="basic-addon1"></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">규격</span></th>
						<td><input type="text" id="product_size" name="product_size" class="form-control" aria-label="Username" aria-describedby="basic-addon1"></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">단위</span></th>
						<td><input type="text" id="product_unit" name="product_unit" class="form-control" aria-label="Username" aria-describedby="basic-addon1"></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">품목정보</span></th>
						<td><input type="text" id="product_info" name="product_info" class="form-control" aria-label="Username" aria-describedby="basic-addon1"></td>
					</tr>
				</table>
			</div>
		<div class="button-arrange">
		<input type="submit" class="btn btn-primary" value="등록"/>
		<a href = "${root }menu/input" class="btn btn-dark" >취소</a>
		</div>
		</div>
	</form:form>

<%-- <c:import url="/WEB-INF/views/include/bottom_info.jsp"/> --%>
</body>
</html>