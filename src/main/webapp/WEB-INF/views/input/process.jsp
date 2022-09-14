<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='root' value="${pageContext.request.contextPath}/"/>
<!doctype html>
<html>
  <head>
	<meta charset="UTF-8">
	<title>공정등록</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="style.css">
  </head>
  
<script>
	function jbSubmit() {
		var process_input = document.process_input;
	  
		if(!process_input.process_idx.value || !process_input.process_seq.value || !process_input.process_name.value
				|| !process_input.process_info.value || !process_input.process_time.value || !process_input.process_timeunit.value){
    		process_input.process_idx.focus();
    		process_input.process_seq.focus();
    		process_input.process_name.focus();
    		process_input.process_info.focus();
    		process_input.process_time.focus();
    		process_input.process_timeunit.focus();
    		alert('입력되지 않은 정보가 있습니다. 모든 입력 칸에 정보를 입력했는지 확인해주세요.');
    		return false;
		}
	}
</script>

<body>
<div class="wrapper">
<c:import url="/WEB-INF/views/include/top_menu.jsp"/>
<c:import url="/WEB-INF/views/include/side_menu.jsp"/>
		
	<form:form action="${root }input/process_pro?menu_idx=${menu_idx }" name="process_input" method="post" modelAttribute="processInfoBean" onsubmit="return jbSubmit();">
		
		<div class="table_arrange">
		<div class="table_title">
		<h1>공정등록</h1>
		</div>
			<div class="input-group mb-3">
				<table>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">공정코드</span></th>
						<td><input type="text" id="process_idx" name="process_idx" class="form-control" aria-label="Username" aria-describedby="basic-addon1" placeholder="숫자"></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">공정순번</span></th>
						<td><input type="text" id="process_seq" name="process_seq" class="form-control" aria-label="Username" aria-describedby="basic-addon1" placeholder="숫자"></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">공정명</span></th>
						<td><input type="text" id="process_name" name="process_name" class="form-control" aria-label="Username" aria-describedby="basic-addon1"></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">공정내용</span></th>
						<td><input type="text" id="process_info" name="process_info" class="form-control" aria-label="Username" aria-describedby="basic-addon1" placeholder="상세 기입"></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">작업소요시간</span></th>
						<td><input type="text" id="process_time" name="process_time" class="form-control" aria-label="Username" aria-describedby="basic-addon1" placeholder="숫자"></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">소요시간단위</span></th>
						<td><input type="text" id="process_timeunit" name="process_timeunit" class="form-control" aria-label="Username" aria-describedby="basic-addon1" placeholder="ex) hour, minute"></td>
					</tr>
				</table>
			</div>
		<div class="button-arrange">
		<input type="submit" class="btn btn-primary" value="등록"/>
		<input type="button" class="btn btn-dark" value="취소" onclick="history.back();"/>
		</div>
		</div>
	</form:form>
	
</div>
</body>

<footer>
	<c:import url="/WEB-INF/views/include/bottom_info.jsp"/>
</footer>
</html>