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
	  var 
    alert( 'dd' );
  }
</script>
    
  </head>
<body>
<c:import url="/WEB-INF/views/include/top_menu.jsp"/>
<c:import url="/WEB-INF/views/include/side_menu.jsp"/>

	<form:form action="${root }input/client_pro?menu_idx=${menu_idx }" method="post" modelAttribute="clientInfoBean" onsubmit="jbSubmit();">
		
		<div class="table_arrange">
		<div class="table_title">
		<h1>거래처등록</h1>
		</div>
			<div class="input-group mb-3">
				<table>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">거래처코드</span></th>
						<td><input type="text" id="client_idx" name="client_idx" class="form-control" aria-label="Username" aria-describedby="basic-addon1"></td>
					</tr>
					<tr>						
						<td colspan=2 style="text-align:right"><form:errors path='client_idx'  style='color:red'/></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">거래처명</span></th>
						<td><input type="text" id="client_name" name="client_name" class="form-control" aria-label="Username" aria-describedby="basic-addon1"></td>
					</tr>
					<tr>						
						<td colspan=2 style="text-align:right"><form:errors path='client_name'  style='color:red'/></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">대표자명</span></th>
						<td><input type="text" id="client_ceo" name="client_ceo" class="form-control" aria-label="Username" aria-describedby="basic-addon1"></td>
					</tr>
					<tr>						
						<td colspan=2 style="text-align:right"><form:errors path='client_ceo'  style='color:red'/></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">연락처</span></th>
						<td><input type="text" id="client_tel" name="client_tel" class="form-control" aria-label="Username" aria-describedby="basic-addon1"></td>
					</tr>
					<tr>						
						<td colspan=2 style="text-align:right"><form:errors path='client_tel'  style='color:red'/></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">우편번호</span></th>
						<td><input type="text" id="client_zipcode" name="client_zipcode" class="form-control" aria-label="Username" aria-describedby="basic-addon1"></td>
					</tr>
					<tr>						
						<td colspan=2 style="text-align:right"><form:errors path='client_zipcode'  style='color:red'/></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">주소</span></th>
						<td><input type="text" id="client_addr" name="client_addr" class="form-control" aria-label="Username" aria-describedby="basic-addon1"></td>
					</tr>
					<tr>						
						<td colspan=2 style="text-align:right"><form:errors path='client_addr'  style='color:red'/></td>
					</tr>
				</table>
			</div>
		<div class="button-arrange">
		<input type="submit" class="btn btn-primary" value="등록"/>
		<a href = "${root }menu/input" class="btn btn-dark" >취소</a>
		</div>
		</div>
	</form:form>
	
	<form name="sub1" method="post" action="${root }input/client_pro?menu_idx=${menu_idx }">
<input id="butt" type="text" name="textt" >
<input type="button" value="보내기" onclick="erchk()">
</form>


<%-- <c:import url="/WEB-INF/views/include/bottom_info.jsp"/> --%>
</body>
</html>