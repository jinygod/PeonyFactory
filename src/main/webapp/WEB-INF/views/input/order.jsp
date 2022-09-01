<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='root' value="${pageContext.request.contextPath}/"/>
<!doctype html>
<html>
  <head>
	<meta charset="UTF-8">
	<title>주문등록</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="style.css">
  </head>
<body>
<c:import url="/WEB-INF/views/include/top_menu.jsp"/>
<c:import url="/WEB-INF/views/include/side_menu.jsp"/>
		
	<form:form action="${root }input/order_pro?menu_idx=${menu_idx }" method="post" modelAttribute="orderInfoBean">
		
		<div class="table_arrange">
		<div class="table_title">
		<h1 class = "order_title">주문등록</h1>
		</div>
			<div class="input-group mb-3">
				<table>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">주문번호</span></th>
						<td><input type="text" id="order_idx" name="order_idx" class="form-control"></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">주문상태</span></th>
						<td><input type="text" id="order_status" name="order_status" class="form-control" value="미승인" style="background-color:lightgray; color:gray" readonly></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">출하상태</span></th>
						<td><input type="text" id="order_shipment" name="order_shipment" class="form-control"></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">거래처코드</span></th>
						<td><input type="text" id="client_idx" name="client_idx" class="form-control"></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">품목코드</span></th>
						<td><input type="text" id="product_idx" name="product_idx" class="form-control"></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">모델번호</span></th>
						<td><input type="text" id="product_modelno" name="product_modelno" class="form-control"></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">주문등록일</span></th>
						<td><input type="text" id="order_regdate" name="order_regdate" class="form-control"></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">납기요청일</span></th>
						<td><input type="text" id="order_deadline" name="order_deadline" class="form-control"></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">생산예상기간</span></th>
						<td><input type="text" id="order_exdate" name="order_exdate" class="form-control"></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">수량</span></th>
						<td><input type="text" id="order_cnt" name="order_cnt" class="form-control"></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">단위</span></th>
						<td><input type="text" id="order_unit" name="order_unit" class="form-control"></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">단가</span></th>
						<td><input type="text" id="order_unit_price" name="order_unit_price" class="form-control"></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">금액</span></th>
						<td><input type="text" id="order_amt" name="order_amt" class="form-control"></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">담당자</span></th>
						<td><input type="text" id="order_manager" name="order_manager" class="form-control"></td>
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