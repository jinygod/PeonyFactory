<!-- 

수정사항 "업데이트" 표기 

취소 링크 변경 취소 클릭시 메인페이지로 이동 
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
	<title>품목등록</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="style.css">
  </head>
<body>

<c:import url="/WEB-INF/views/include/top_menu.jsp"/>
<c:import url="/WEB-INF/views/include/side_menu.jsp"/>
		
	<form:form action="${root }input/product_pro?menu_idx=${menu_idx }" method="post" modelAttribute="productInfoBean">
		
		<div class="table_arrange">
		<div class="table_title">
		<h1>품목등록</h1>
		</div>
			<div class="input-group mb-3">
				<table>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">품목코드</span></th>
						<td><input type="text" id="product_idx" name="product_idx" class="form-control" aria-label="Username" aria-describedby="basic-addon1"></td>
					</tr>
					<tr>						
						<td colspan=2 style="text-align:right"><form:errors path='product_idx'  style='color:red'/></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">품목구분</span></th>
						<td><input type="text" id="product_div" name="product_div" class="form-control" aria-label="Username" aria-describedby="basic-addon1"></td>
					</tr>
					<tr>						
						<td colspan=2 style="text-align:right"><form:errors path='product_div'  style='color:red'/></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">모델번호</span></th>
						<td><input type="text" id="product_modelno" name="product_modelno" class="form-control" aria-label="Username" aria-describedby="basic-addon1"></td>
					</tr>
					<tr>						
						<td colspan=2 style="text-align:right"><form:errors path='product_modelno'  style='color:red'/></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">품목명</span></th>
						<td><input type="text" id="product_name" name="product_name" class="form-control" aria-label="Username" aria-describedby="basic-addon1"></td>
					</tr>
					<tr>						
						<td colspan=2 style="text-align:right"><form:errors path='product_name'  style='color:red'/></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">규격</span></th>
						<td><input type="text" id="product_size" name="product_size" class="form-control" aria-label="Username" aria-describedby="basic-addon1"></td>
					</tr>
					<tr>						
						<td colspan=2 style="text-align:right"><form:errors path='product_size'  style='color:red'/></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">단위</span></th>
						<td><input type="text" id="product_unit" name="product_unit" class="form-control" aria-label="Username" aria-describedby="basic-addon1"></td>
					</tr>
					<tr>						
						<td colspan=2 style="text-align:right"><form:errors path='product_unit'  style='color:red'/></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">품목정보</span></th>
						<td><input type="text" id="product_info" name="product_info" class="form-control" aria-label="Username" aria-describedby="basic-addon1"></td>
					</tr>
					<tr>						
						<td colspan=2 style="text-align:right"><form:errors path='product_info'  style='color:red'/></td>
					</tr>
				</table>
			</div>
		<div class="button-arrange">
		<input type="submit" class="btn btn-primary" value="등록"/>
		<a href = "${root }main" class="btn btn-dark" >취소</a><!-- 업데이트 -->
		</div>
		</div>
	</form:form>

<%-- <c:import url="/WEB-INF/views/include/bottom_info.jsp"/> --%>
</body>
</html>