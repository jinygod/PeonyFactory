<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='root' value="${pageContext.request.contextPath}/"/>
<!doctype html>
<html>
  <head>
	<meta charset="UTF-8">
	<title>주문조회</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="style.css">
  </head>
  <body>
  
  <c:import url="/WEB-INF/views/include/top_menu.jsp"/>
  <c:import url="/WEB-INF/views/include/side_menu.jsp"/>
  
	<div class="container">
	<form:form action="${root }order/modify" method="post" modelAttribute="modifyOrderBean">
		
		<div class="table_arrange">
		<div class="table_title">
		<h1>주문조회</h1>
		</div>
			<div class="input-group mb-3">
				<table>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">주문번호</span></th>
						<th><span class="input-group-text" id="basic-addon1">출하상태</span></th>
						<th><span class="input-group-text" id="basic-addon1">거래처코드</span></th>
						<th><span class="input-group-text" id="basic-addon1">품목코드</span></th>
						<th><span class="input-group-text" id="basic-addon1">모델번호</span></th>
						<th><span class="input-group-text" id="basic-addon1">주문등록일</span></th>
						<th><span class="input-group-text" id="basic-addon1">납기요청일</span></th>
						<th><span class="input-group-text" id="basic-addon1">생산예상기간</span></th>
						<th><span class="input-group-text" id="basic-addon1">수량</span></th>
						<th><span class="input-group-text" id="basic-addon1">단위</span></th>
						<th><span class="input-group-text" id="basic-addon1" style="width:70px">단가</span></th>
						<th><span class="input-group-text" id="basic-addon1" style="width:100px">금액</span></th>
						<th><span class="input-group-text" id="basic-addon1">담당자</span></th>
						<th><span class="input-group-text" id="basic-addon1" style="width:100px">등록일시</span></th>
						<th><span class="input-group-text" id="basic-addon1">주문상태</span></th>
					</tr>
					<c:forEach var="obj" items="${ApprovedOrderList }">
					<tr>
						<td><input type="text" id="order_idx" name="order_idx" class="form-control" value="${obj.order_idx }"></td>
						<td><input type="text" id="order_shipment" name="order_shipment" class="form-control" value="${obj.order_shipment }"></td>
						<td><input type="text" id="client_idx" name="client_idx" class="form-control" value="${obj.client_idx }"></td>
						<td><input type="text" id="product_modelno" name="product_modelno" class="form-control" value="${obj.product_modelno }"></td>
						<td><input type="text" id="product_modelno" name="product_modelno" class="form-control" value="${obj.product_modelno }"></td>
						<td><input type="text" id="order_regdate" name="order_regdate" class="form-control" value="${obj.order_regdate }"></td>
						<td><input type="text" id="order_deadline" name="order_deadline" class="form-control" value="${obj.order_deadline }"></td>
						<td><input type="text" id="order_exdate" name="order_exdate" class="form-control" value="${obj.order_exdate }"></td>
						<td><input type="text" id="order_cnt" name="order_cnt" class="form-control" value="${obj.order_cnt }"></td>
						<td><input type="text" id="order_unit" name="order_unit" class="form-control" value="${obj.order_unit }"></td>
						<td><input type="text" id="order_unit_price" name="order_unit_price" class="form-control" value="${obj.order_unit_price }"></td>
						<td><input type="text" id="order_amt" name="order_amt" class="form-control" value="${obj.order_amt }"></td>
						<td><input type="text" id="order_manager" name="order_manager" class="form-control" value="${obj.order_manager }"></td>
						<td><input type="text" id="order_date" name="order_date" class="form-control" value="${obj.order_date }"></td>
						<td><input type="text" id="order_status" name="order_status" class="form-control" value="${obj.order_status }"></td>
					</tr>
					</c:forEach>
				</table>
			</div>
		<div class="button-arrange">
		<input type="submit" class="btn btn-primary" value="수정"/>
		<a href = "${root}menu/submenu" class="btn btn-dark" >뒤로가기</a>
		</div>
		</div>
	</form:form>
	</div>
<%-- <c:import url="/WEB-INF/views/include/bottom_info.jsp"/> --%>
  
  </body>
  
   <!--  input 안에 : aria-label="Username" aria-describedby="basic-addon1" -->