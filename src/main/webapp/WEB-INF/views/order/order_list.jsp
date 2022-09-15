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
  <div class="wrapper">
  
  <c:import url="/WEB-INF/views/include/top_menu.jsp"/>
  <c:import url="/WEB-INF/views/include/side_menu.jsp"/>
  
  
		<div class="table_arrange_list">
	<form:form action="${root }order/modify" method="post" modelAttribute="modifyOrderBean">
		
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
						<th><span class="input-group-text" id="basic-addon1">단가</span></th>
						<th><span class="input-group-text" id="basic-addon1">금액</span></th>
						<th><span class="input-group-text" id="basic-addon1">담당자</span></th>
						<th><span class="input-group-text" id="basic-addon1">등록일시</span></th>
						<th><span class="input-group-text" id="basic-addon1">주문상태</span></th>
					</tr>
					<c:forEach var="obj" items="${OrderList }">
					<tr>
						<td><input type="text" id="order_idx" name="order_idx" class="form-control" value="${obj.order_idx }" readonly style=background:white></td>
						<td><input type="text" id="order_shipment" name="order_shipment" class="form-control" value="${obj.order_shipment }" readonly style=background:white></td>
						<td><input type="text" id="client_idx" name="client_idx" class="form-control" value="${obj.client_idx }" readonly style=background:white></td>
						<td><input type="text" id="product_idx" name="product_idx" class="form-control" value="${obj.product_idx }" readonly style=background:white></td>
						<td><input type="text" id="product_modelno" name="product_modelno" class="form-control" value="${obj.product_modelno }" readonly style=background:white></td>
						<td><input type="text" id="order_regdate" name="order_regdate" class="form-control" value="${obj.order_regdate }" readonly style=background:white></td>
						<td><input type="text" id="order_deadline" name="order_deadline" class="form-control" value="${obj.order_deadline }" readonly style=background:white></td>
						<td><input type="text" id="order_exdate" name="order_exdate" class="form-control" value="${obj.order_exdate }" readonly style=background:white></td>
						<td><input type="text" id="order_cnt" name="order_cnt" class="form-control" value="${obj.order_cnt }" readonly style=background:white></td>
						<td><input type="text" id="order_unit" name="order_unit" class="form-control" value="${obj.order_unit }" readonly style=background:white></td>
						<td><input type="text" id="order_unit_price" name="order_unit_price" class="form-control" value="${obj.order_unit_price }" readonly style="background:white; width:70px"></td>
						<td><input type="text" id="order_amt" name="order_amt" class="form-control" value="${obj.order_amt }" readonly style="background:white; width:100px"></td>
						<td><input type="text" id="order_manager" name="order_manager" class="form-control" value="${obj.order_manager }" readonly style=background:white></td>
						<td><input type="text" id="order_date" name="order_date" class="form-control" value="${obj.order_date }" readonly style="background:white; width:100px"></td>
						<td><input type="text" id="order_status" name="order_status" class="form-control" value="${obj.order_status }" readonly style=background:white></td>
					</tr>
					</c:forEach>
				</table>
			</div>
			<div class="d-none d-md-block">
				<ul class="pagination justify-content-center">
					<c:choose>
					<c:when test="${pageBean.prevPage <= 0 }">
					<li class="page-item disabled">
						<a href="#" class="page-link">이전</a>
					</li>
					</c:when>
					<c:otherwise>
					<li class="page-item">
						<a href="${root }order/order_list?menu_idx=${menu_idx }&page=${pageBean.prevPage}" class="page-link">이전</a>
					</li>
					</c:otherwise>
					</c:choose>
					
					
					<c:forEach var='idx' begin="${pageBean.min }" end='${pageBean.max }'>
					<c:choose>
					<c:when test="${idx == pageBean.currentPage }">
					<li class="page-item active">
						<a href="${root }order/order_list?menu_idx=${menu_idx }&page=${idx}" class="page-link">${idx }</a>
					</li>
					</c:when>
					<c:otherwise>
					<li class="page-item">
						<a href="${root }order/order_list?menu_idx=${menu_idx }&page=${idx}" class="page-link">${idx }</a>
					</li>
					</c:otherwise>
					</c:choose>
					
					</c:forEach>
					
					<c:choose>
					<c:when test="${pageBean.max >= pageBean.pageCnt }">
					<li class="page-item disabled">
						<a href="#" class="page-link">다음</a>
					</li>
					</c:when>
					<c:otherwise>
					<li class="page-item">
						<a href="${root }order/order_list?menu_idx=${menu_idx }&page=${pageBean.nextPage}" class="page-link">다음</a>
					</li>
					</c:otherwise>
					</c:choose>
					
				</ul>
			</div>
		<div class="button-arrange">
		<input type="button" class="btn btn-dark" value="뒤로가기" onclick="history.back();"/>
		</div>
	</form:form>
		</div>
	</div>

<footer>
	<c:import url="/WEB-INF/views/include/bottom_info.jsp"/>
</footer>
  
</body>
</html>