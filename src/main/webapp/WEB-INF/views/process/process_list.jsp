<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='root' value="${pageContext.request.contextPath}/"/>
<!doctype html>
<html>
  <head>
	<meta charset="UTF-8">
	<title>공정조회</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="style.css">
  </head>
  <body>
  
  <c:import url="/WEB-INF/views/include/top_menu.jsp"/>
  <c:import url="/WEB-INF/views/include/side_menu.jsp"/>
		
	<form:form action="${root }process/modify" method="post" modelAttribute="modifyProcessBean">
		
		<div class="table_arrange">
		<div class="table_title">
		<h1>공정조회</h1>
		</div>
			<div class="input-group mb-3">
				<table>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">공정코드</span></th>
						<th><span class="input-group-text" id="basic-addon1">공정순번</span></th>
						<th><span class="input-group-text" id="basic-addon1">공정명</span></th>
						<th><span class="input-group-text" id="basic-addon1">공정내용</span></th>
						<th><span class="input-group-text" id="basic-addon1">작업소요시간</span></th>
						<th><span class="input-group-text" id="basic-addon1">소요시간단위</span></th>
					</tr>
					<c:forEach var="obj" items="${ProcessList }">
					<tr>
						<td><input type="text" id="process_idx" name="process_idx" class="form-control" value="${obj.process_idx }"></td>
						<td><input type="text" id="process_seq" name="process_seq" class="form-control" value="${obj.process_seq }"></td>
						<td><input type="text" id="process_name" name="process_name" class="form-control" value="${obj.process_name }"></td>
						<td><input type="text" id="process_info" name="process_info" class="form-control" value="${obj.process_info }"></td>
						<td><input type="text" id="process_time" name="process_time" class="form-control" value="${obj.process_time }"></td>
						<td><input type="text" id="process_timeunit" name="process_timeunit" class="form-control" value="${obj.process_timeunit }"></td>
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