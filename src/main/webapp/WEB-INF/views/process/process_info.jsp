<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='root' value="${pageContext.request.contextPath}/"/>
<!doctype html>
<html>
  <head>
	<meta charset="UTF-8">
	<title>품목별공정정보</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="style.css">
  </head>
  <body>
  
  <c:import url="/WEB-INF/views/include/top_menu.jsp"/>
  <c:import url="/WEB-INF/views/include/side_menu.jsp"/>
		
	<form:form action="${root }process/process_info" method="post" modelAttribute="processInfoBean">
		
		<div class="table_arrange">
		<div class="table_title">
		<h1>품목별공정정보</h1>
		</div>
			<div class="input-group mb-3">
				<table>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">품목코드</span></th>
						<th><span class="input-group-text" id="basic-addon1">공정코드</span></th>
						<th><span class="input-group-text" id="basic-addon1">공정정보</span></th>
						<th><span class="input-group-text" id="basic-addon1">공정버전</span></th>
						<th><span class="input-group-text" id="basic-addon1">공정시간</span></th>
						<th><span class="input-group-text" id="basic-addon1">소요시간단위</span></th>
						<th><span class="input-group-text" id="basic-addon1">평균손실율</span></th>
						<th><span class="input-group-text" id="basic-addon1">평균손실수량</span></th>
						<th><span class="input-group-text" id="basic-addon1">평균불량율</span></th>
						<th><span class="input-group-text" id="basic-addon1">평균불량수량</span></th>
					</tr>
					<c:forEach var="obj" items="${ProcessList }">
					<tr>
						<td><input type="text" id="product_idx" name="product_idx" class="form-control" value="${obj.product_idx }"></td>
						<td><input type="text" id="process_idx" name="process_idx" class="form-control" value="${obj.process_idx }"></td>
						<td><input type="text" id="pop_info" name="pop_info" class="form-control" value="${obj.pop_info }"></td>
						<td><input type="text" id="pop_version" name="pop_version" class="form-control" value="${obj.pop_version }"></td>
						<td><input type="text" id="pop_processtime" name="pop_processtime" class="form-control" value="${obj.pop_processtime }"></td>
						<td><input type="text" id="pop_avglossrate" name="pop_avglossrate" class="form-control" value="${obj.pop_avglossrate }"></td>
						<td><input type="text" id="pop_avglosscnt" name="pop_avglosscnt" class="form-control" value="${obj.pop_avglosscnt }"></td>
						<td><input type="text" id="pop_avgdefrate" name="pop_avgdefrate" class="form-control" value="${obj.pop_avgdefrate }"></td>
						<td><input type="text" id="pop_avgdefcnt" name="pop_avgdefcnt" class="form-control" value="${obj.pop_avgdefcnt }"></td>
					</tr>
					</c:forEach>
				</table>
			</div>
		<div class="button-arrange">
		<input type="submit" class="btn btn-primary" value="수정"/>
		<a href = "${root }menu/submenu" class="btn btn-dark" >뒤로가기</a>
		</div>
		</div>
	</form:form>

<%-- <c:import url="/WEB-INF/views/include/bottom_info.jsp"/> --%>
  
  </body>
  
   <!--  input 안에 : aria-label="Username" aria-describedby="basic-addon1" -->