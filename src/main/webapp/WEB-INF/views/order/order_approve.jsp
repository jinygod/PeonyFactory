<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='root' value="${pageContext.request.contextPath}/"/>
<!doctype html>
<html>
  <head>
	<meta charset="UTF-8">
	<title>주문승인</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${root}style.css">
    <script>
    function button() {
    location.href='${root }order/order_approve?order_idx=${obj.order_idx}&menu_idx=${menu_idx }'
    }
    </script>
  </head>
  <body>
  
  <c:import url="/WEB-INF/views/include/top_menu.jsp"/>
  <c:import url="/WEB-INF/views/include/side_menu.jsp"/>
  	
  	<div class="container">
	<form:form action="${root }order/order_approve?menu_idx=${menu_idx }" method="post" modelAttribute="approveOrderBean">
		
		<div class="table_arrange">
		<div class="table_title">
		<h1>주문승인</h1>
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
						<th><span class="input-group-text" id="basic-addon1">승인</span></th>
						<th><span class="input-group-text" id="basic-addon1">거절</span></th>
						
					</tr>
					<c:forEach var="obj" items="${UnapprovedOrderList }">
					<tr>
						<td><input type="text" id="${obj.order_idx }" name="order_idx" class="form-control" value="${obj.order_idx }" style="background-color:white" readonly></td>
						<td><input type="text" id="order_shipment" name="order_shipment" class="form-control" value="${obj.order_shipment }" style="background-color:white" readonly></td>
						<td><input type="text" id="client_idx" name="client_idx" class="form-control" value="${obj.client_idx }" style="background-color:white" readonly></td>
						<td><input type="text" id="product_modelno" name="product_modelno" class="form-control" value="${obj.product_modelno }" style="background-color:white" readonly></td>
						<td><input type="text" id="product_modelno" name="product_modelno" class="form-control" value="${obj.product_modelno }" style="background-color:white" readonly></td>
						<td><input type="text" id="order_regdate" name="order_regdate" class="form-control" value="${obj.order_regdate }" style="background-color:white" readonly></td>
						<td><input type="text" id="order_deadline" name="order_deadline" class="form-control" value="${obj.order_deadline }" style="background-color:white" readonly></td>
						<td><input type="text" id="order_exdate" name="order_exdate" class="form-control" value="${obj.order_exdate }" style="background-color:white" readonly></td>
						<td><input type="text" id="order_cnt" name="order_cnt" class="form-control" value="${obj.order_cnt }" style="background-color:white" readonly></td>
						<td><input type="text" id="order_unit" name="order_unit" class="form-control" value="${obj.order_unit }" style="background-color:white" readonly></td>
						<td><input type="text" id="order_unit_price" name="order_unit_price" class="form-control" value="${obj.order_unit_price }" style="background-color:white" readonly></td>
						<td><input type="text" id="order_amt" name="order_amt" class="form-control" value="${obj.order_amt }" style="background-color:white" readonly></td>
						<td><input type="text" id="order_manager" name="order_manager" class="form-control" value="${obj.order_manager }" style="background-color:white" readonly></td>
						<td><input type="text" id="order_date" name="order_date" class="form-control" value="${obj.order_date }" style="background-color:white" readonly></td>
						<td><input type="text" id="order_status" name="order_status" class="form-control" value="${obj.order_status }" style="background-color:white" readonly></td>
<%-- 						<td><a href="${root }order/order_approve?order_idx=${obj.order_idx}&menu_idx=${menu_idx }"><input type="button" name="order_approve" value="승인" class="btn btn-primary"/></a></td> --%>
<%-- 						<td><a href="${root }order/order_approve?order_idx=${obj.order_idx}&menu_idx=${menu_idx }" class="btn btn-danger">거절</a></td> --%>
						<td><input type="submit" id="${obj.order_idx }" name="order_approve" class="btn btn-primary" value="승인"></td>
						<td><input type="submit" id="order_idx" name="order_approve" class="btn btn-danger" value="거절"></td>
<!-- 							<td><input type="button" name="order_approve" value="승인" class="btn btn-primary" onClick='button()'> </td> -->
<!-- 							<td><input type="button" name="order_approve" value="거절" class="btn btn-primary" onClick="location.href=''"> </td> -->

					</tr>
					</c:forEach>
				</table>
			</div>
		<div class="button-arrange">
		<input type="submit" name="order_approve" class="btn btn-primary" value="전체승인"/>
		<input type="submit" name="order_approve" class="btn btn-danger" value="전체거절"/>
		<a href = "${root }menu/input" class="btn btn-dark" >취소</a>
		</div>
		</div>
	</form:form>
	</div>

<%-- <c:import url="/WEB-INF/views/include/bottom_info.jsp"/> --%>
  
  </body>
  
   <!--  input 안에 : aria-label="Username" aria-describedby="basic-addon1" -->