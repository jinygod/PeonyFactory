<!--
수정사항 업데이트 표기
1. 취소 제거
2. 삭제 추가
3. 삭제 기능 구현 필요
4. 수정기능 잠금 readonly

 체크박스 추가, 수정 클릭시 체크박스 체크된 것만 readonly 풀리고 수정가능하게
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='root' value="${pageContext.request.contextPath}/"/>
<!doctype html>
<html>
  <head>
	<meta charset="UTF-8">
	<title>품목조회</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="style.css">
  </head>
  <body>
 <div class="wrapper">
  <c:import url="/WEB-INF/views/include/top_menu.jsp"/>
  <c:import url="/WEB-INF/views/include/side_menu.jsp"/>
		
	<form:form action="${root }product/modify" method="post" modelAttribute="modifyProductBean">
		
		<div class="table_arrange">
		<div class="table_title">
		<h1>품목조회</h1>
		</div>
			<div class="input-group mb-3">
				<table>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">품목코드</span></th>
						<th><span class="input-group-text" id="basic-addon1">품목구분</span></th>
						<th><span class="input-group-text" id="basic-addon1">모델번호</span></th>
						<th><span class="input-group-text" id="basic-addon1">품목명</span></th>
						<th><span class="input-group-text" id="basic-addon1">규격</span></th>
						<th><span class="input-group-text" id="basic-addon1">단위</span></th>
						<th><span class="input-group-text" id="basic-addon1" style="width:300px">품목정보</span></th>
					</tr>
					<c:forEach var="obj" items="${ProductList }">
					<tr><!--  업데이트 _readonly 추가  -->
						<td><input type="text" id="product_idx" name="product_idx" class="form-control" value="${obj.product_idx }" readonly style=background:white></td>
						<td><input type="text" id="product_div" name="product_div" class="form-control" value="${obj.product_div }" readonly style=background:white></td>
						<td><input type="text" id="product_modelno" name="product_modelno" class="form-control" value="${obj.product_modelno }" readonly style=background:white></td>
						<td><input type="text" id="product_name" name="product_name" class="form-control" value="${obj.product_name }" readonly style=background:white></td>
						<td><input type="text" id="product_size" name="product_size" class="form-control" value="${obj.product_size }" readonly style=background:white></td>
						<td><input type="text" id="product_unit" name="product_unit" class="form-control" value="${obj.product_unit }" readonly style=background:white></td>
						<td><input type="text" id="product_info" name="product_info" class="form-control" value="${obj.product_info }" readonly style=background:white></td>
					</tr>
					</c:forEach>
				</table>
			</div>
		<div class="button-arrange">
		<input type="submit" class="btn btn-primary" value="수정"/>
		<a href = "${root }main" class="btn btn-danger" >삭제</a><!-- 업데이트 _ 취소 - 삭제로 변경 삭제 기능 구현 필요-->
		<input type="button" class="btn btn-dark" value="뒤로가기" onclick="history.back();"/>
		</div>
		</div>
	</form:form>
</div>

<footer>
	<c:import url="/WEB-INF/views/include/bottom_info.jsp"/>
</footer>
  
  </body>
  
   <!--  input 안에 : aria-label="Username" aria-describedby="basic-addon1" -->