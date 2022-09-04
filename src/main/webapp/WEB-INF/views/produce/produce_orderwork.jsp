<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='root' value="${pageContext.request.contextPath}/"/>
<!doctype html>
<html>
  <head>
	<meta charset="UTF-8">
	<title>작업지시서</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="style.css">
  </head>
  <body>
  <div class="wrapper">
  <c:import url="/WEB-INF/views/include/top_menu.jsp"/>
  <c:import url="/WEB-INF/views/include/side_menu.jsp"/>
  
	<div class="container">
	<form:form action="${root }produce/produce_orderwork_pro?menu_idx=${menu_idx }" method="post" modelAttribute="orderWorkBean">
		
		<div class="table_arrange">
		<div class="table_title">
		<h1>작업지시서</h1>
		</div>
			<div class="input-group mb-3">
				<table>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">작업지시번호</span></th>
						<th><span class="input-group-text" id="basic-addon1">작업지시명</span></th>
						<th><span class="input-group-text" id="basic-addon1">품목코드</span></th>
						<th><span class="input-group-text" id="basic-addon1">모델번호</span></th>
						<th><span class="input-group-text" id="basic-addon1">주문등록일</span></th>
						<th><span class="input-group-text" id="basic-addon1">납기요청일</span></th>
						<th><span class="input-group-text" id="basic-addon1">생산예상기간</span></th>
						<th><span class="input-group-text" id="basic-addon1">수량</span></th>
						<th><span class="input-group-text" id="basic-addon1">단위</span></th>
						<th><span class="input-group-text" id="basic-addon1" style="width:70px">단가</span></th>
						<th><span class="input-group-text" id="basic-addon1" style="width:100px">금액</span></th>
						<th><span class="input-group-text" id="basic-addon1">작업지시일</span></th>
						<th><span class="input-group-text" id="basic-addon1">작업상태</span></th>
					</tr>
					<c:forEach var="obj" items="${OrderWorkList }">
					<tr>
						<td><input type="text" id="orderwork_idx" name="orderwork_idx" class="form-control" value="${obj.orderwork_idx }" style="background-color:white" readonly></td>
								<td><select id="process_name" name="process_name" class="form-select">
										<option style=font-color:lightgray>선택</option>
										<c:forEach var="option" items="${ProcessList }">
										<option id="process_name">${option.process_name}</option>
										</c:forEach>
								</select></td>
						<td><input type="text" id="product_idx" name="product_idx" class="form-control" value="${obj.product_idx }"></td>
						<td><input type="text" id="product_modelno" name="product_modelno" class="form-control" value="${obj.product_modelno }"></td>
						<td><input type="text" id="order_regdate" name="order_regdate" class="form-control" value="${obj.order_regdate }"></td>
						<td><input type="text" id="order_deadline" name="order_deadline" class="form-control" value="${obj.order_deadline }"></td>
						<td><input type="text" id="order_exdate" name="order_exdate" class="form-control" value="${obj.order_exdate }"></td>
						<td><input type="text" id="order_cnt" name="order_cnt" class="form-control" value="${obj.order_cnt }"></td>
						<td><input type="text" id="order_unit" name="order_unit" class="form-control" value="${obj.order_unit }"></td>
						<td><input type="text" id="order_unit_price" name="order_unit_price" class="form-control" value="${obj.order_unit_price }"></td>
						<td><input type="text" id="order_amt" name="order_amt" class="form-control" value="${obj.order_amt }"></td>
						<td><input type="text" id="orderwork_date" name="orderwork_date" class="form-control" value="${obj.orderwork_date }"></td>
						<td><input type="text" id="orderwork_status" name="orderwork_status" class="form-control" value="${obj.orderwork_status }"></td>
					</tr>
					</c:forEach>
				</table>
			</div>
		<div class="button-arrange">
		<input type="submit" class="btn btn-primary" value="작업요청"/>
		<input type="button" class="btn btn-dark" value="뒤로가기" onclick="history.back();"/>
		</div>
		</div>
	</form:form>
	</div>
	</div>
	<footer>
		<c:import url="/WEB-INF/views/include/bottom_info.jsp"/>
	</footer>
  
  </body>
  
   <!--  input 안에 : aria-label="Username" aria-describedby="basic-addon1" -->