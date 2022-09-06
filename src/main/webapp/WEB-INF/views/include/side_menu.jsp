<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='root' value="${pageContext.request.contextPath}/"/>

<!doctype html>
<html>
<meta charset="UTF-8">
  <head>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${root }style.css">
  </head>
<style>
 	@media(max-width:1300px){ 
 	.side_menu{ 
 		background: white;
		height: 100vh;
		width: 300px;
		margin: 0px;
 	} 
 }  
</style>
<body>
	<!-- 	menu_idx를 파라미터 값으로 받아와서 if문 사용, menu_idx == 1 -> 품목관리(menu_title)에 해당하는 -->
	<!-- 	subMenu_title(품목등록, 품목조회)이 side_menu에 li로 출력 -->
	<div class="side_menu">
		<c:if test="${menu_idx == 1 }">
			<ul>
				<li class="nav-item"><a href="${root }input/product?menu_idx=${menu_idx}">품목등록</a></li>
				<li class="nav-item"><a href="${root }product/product_list?menu_idx=${menu_idx}">품목조회</a></li>
			</ul>
		</c:if>
		<c:if test="${menu_idx == 2 }">
			<ul>
				<li class="nav-item"><a href="${root }order/client_list?menu_idx=${menu_idx}">거래처조회</a></li>
				<li class="nav-item"><a href="${root }input/order?menu_idx=${menu_idx}">주문등록</a></li>
				<li class="nav-item"><a href="${root }order/order_approve?menu_idx=${menu_idx}">주문승인</a></li>
				<li class="nav-item"><a href="${root }order/order_list?menu_idx=${menu_idx}">주문조회</a></li>
			</ul>
		</c:if>
		<c:if test="${menu_idx == 3 }">
			<ul>
				<li class="nav-item"><a href="${root }produce/produce_orderwork?menu_idx=${menu_idx}">작업지시서</a></li>
				<li class="nav-item"><a href="${root }produce/produce_status?menu_idx=${menu_idx}">생산현황조회</a></li>
			</ul>
		</c:if>
		<c:if test="${menu_idx == 4 }">
			<ul>
				<li class="nav-item"><a href="${root }input/process?menu_idx=${menu_idx}">공정등록</a></li>
				<li class="nav-item"><a href="${root }process/process_list?menu_idx=${menu_idx}">공정조회</a></li>
				<li class="nav-item"><a href="${root }process/process_info?menu_idx=${menu_idx}">품목별공정정보</a></li>
			</ul>
		</c:if>
		<c:if test="${menu_idx == 5 }">
			<ul>
				<li class="nav-item"><a href="${root }result/result_total_produce?menu_idx=${menu_idx}">생산실적조회</a></li>
				<li class="nav-item"><a href="${root }result/result_process_error?menu_idx=${menu_idx}">공정별불량률조회</a></li>
				<li class="nav-item"><a href="${root }result/result_product_total?menu_idx=${menu_idx}">품목별생산량조회</a></li>
				<li class="nav-item"><a href="${root }result/report?menu_idx=${menu_idx}">실적보고서</a></li>
			</ul>
		</c:if>
		<c:if test="${menu_idx == 6 }">
			<ul>
				<li class="nav-item"><a href="${root }input/client?menu_idx=${menu_idx}">거래처등록</a></li>
				<li class="nav-item"><a href="${root }input/product?menu_idx=${menu_idx}">품목등록</a></li>
				<li class="nav-item"><a href="${root }input/order?menu_idx=${menu_idx}">주문등록</a></li>
				<li class="nav-item"><a href="${root }input/process?menu_idx=${menu_idx}">공정등록</a></li>
			</ul>
		</c:if>
	</div>
</body>