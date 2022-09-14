<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='root' value="${pageContext.request.contextPath}/"/>
<!doctype html>
<html>
  <head>
	<meta charset="UTF-8">
	<title>거래처등록</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${root }style.css">
    
<script>
	function jbSubmit() {
		var client_info = document.client_info;
	  
		if(!client_info.client_idx.value || !client_info.client_name.value || !client_info.client_ceo.value
				|| !client_info.client_tel.value || !client_info.client_zipcode.value || !client_info.client_addr.value){
    		client_info.client_idx.focus();
    		client_info.client_name.focus();
    		client_info.client_ceo.focus();
    		client_info.client_tel.focus();
    		client_info.client_zipcode.focus();
    		client_info.client_addr.focus();
    		alert('입력되지 않은 정보가 있습니다. 모든 입력 칸에 정보를 입력했는지 확인해주세요.');
    		return false;
		}
	}
</script>
    
  </head>
<body>
<div class="wrapper">

<c:import url="/WEB-INF/views/include/top_menu.jsp"/>
<c:import url="/WEB-INF/views/include/side_menu.jsp"/>

	<form:form action="${root }input/client_pro?menu_idx=${menu_idx }" name="client_info" method="post" modelAttribute="clientInfoBean" onsubmit="return jbSubmit();">
		
		<div class="table_arrange">
		<div class="table_title">
		<h1>거래처등록</h1>
		</div>
			<div class="input-group mb-3">
				<table>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">거래처코드</span></th>
						<td><input type="text" id="client_idx" name="client_idx" class="form-control" aria-label="Username" aria-describedby="basic-addon1" placeholder="숫자"></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">거래처명</span></th>
						<td><input type="text" id="client_name" name="client_name" class="form-control" aria-label="Username" aria-describedby="basic-addon1" placeholder="회사명"></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">대표자명</span></th>
						<td><input type="text" id="client_ceo" name="client_ceo" class="form-control" aria-label="Username" aria-describedby="basic-addon1" placeholder="성함"></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">연락처</span></th>
						<td><input type="text" id="client_tel" name="client_tel" class="form-control" aria-label="Username" aria-describedby="basic-addon1" placeholder="ex)01012345678"></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">우편번호</span></th>
						<td><input type="text" id="client_zipcode" name="client_zipcode" class="form-control" aria-label="Username" aria-describedby="basic-addon1" placeholder="숫자"></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">주소</span></th>
						<td><input type="text" id="client_addr" name="client_addr" class="form-control" aria-label="Username" aria-describedby="basic-addon1"placeholder="전체주소"></td>
					</tr>
				</table>
			</div>
		<div class="button-arrange">
		<input type="submit" class="btn btn-primary" value="등록"/>
		<input type="button" class="btn btn-dark" value="취소" onclick="history.back();"/>
		</div>
		</div>
	</form:form>
	
	<form name="sub1" method="post" action="${root }input/client_pro?menu_idx=${menu_idx }">
</form>
</div>
<footer>
	<c:import url="/WEB-INF/views/include/bottom_info.jsp"/>
</footer>
</body>
</html>