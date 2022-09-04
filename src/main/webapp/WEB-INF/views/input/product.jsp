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
<script>
	function jbSubmit() {
		var product_info = document.product_info;
	  
		if(!product_info.product_idx.value || !product_info.product_div.value || !product_info.product_modelno.value
				|| !product_info.product_name.value || !product_info.product_info.value){
    		product_info.product_idx.focus();
    		product_info.product_div.focus();
    		product_info.product_modelno.focus();
    		product_info.product_name.focus();
    		product_info.product_info.focus();
    		alert('입력되지 않은 정보가 있습니다. 모든 입력 칸에 정보를 입력했는지 확인해주세요.');
    		return false;
		}
		if(product_info.product_size.value == "선택"){
    		product_info.product_size.focus();
    		alert('규격란을 선택하지 않았습니다. SMALL, MEDEIUM, LARGE 중 반드시 선택해주세요.');
    		return false;
		}
	}
</script>
<body>
<div class="wrapper">
<c:import url="/WEB-INF/views/include/top_menu.jsp"/>
<c:import url="/WEB-INF/views/include/side_menu.jsp"/>
		
	<form:form action="${root }input/product_pro?menu_idx=${menu_idx }" name="product_info" method="post" modelAttribute="productInfoBean" onsubmit="return jbSubmit();">
		
		<div class="table_arrange">
		<div class="table_title">
		<h1>품목등록</h1>
		</div>
			<div class="input-group mb-3">
				<table>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">품목코드</span></th>
						<td><input type="text" id="product_idx" name="product_idx" class="form-control" aria-label="Username" aria-describedby="basic-addon1" placeholder="숫자 4자리 ex)1000"></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">품목구분</span></th>
						<td><input type="text" id="product_div" name="product_div" class="form-control" aria-label="Username" aria-describedby="basic-addon1" placeholder="ex)상의, 하의, etc..."></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">모델번호</span></th>
						<td><input type="text" id="product_modelno" name="product_modelno" class="form-control" aria-label="Username" aria-describedby="basic-addon1" placeholder="숫자 4자리 ex)1001"></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">품목명</span></th>
						<td><input type="text" id="product_name" name="product_name" class="form-control" aria-label="Username" aria-describedby="basic-addon1" placeholder="상품이름"></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">규격</span></th>
						<td>
							<select id="product_size" name="product_size" class="form-select" aria-label="Username" aria-describedby="basic-addon1">
								<option>선택</option>
								<option>SMALL</option>
								<option>MEDIUM</option>
								<option>LARGE</option>
							</select>
						</td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">단위</span></th>
						<td><input type="text" id="product_unit" name="product_unit" value="BOX" class="form-control" aria-label="Username" aria-describedby="basic-addon1" style='background:white' readonly></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">품목정보</span></th>
						<td><input type="text" id="product_info" name="product_info" class="form-control" aria-label="Username" aria-describedby="basic-addon1" placeholder="상세 기입"></td>
					</tr>
				</table>
			</div>
		<div class="button-arrange">
		<input type="submit" class="btn btn-primary" value="등록"/>
		<input type="button" class="btn btn-dark" value="취소" onclick="history.back();"/>
<%-- 		<a href = "${root }menu/submenu?menu=idx=${menu_idx}" class="btn btn-dark" >취소</a><!-- 업데이트 --> --%>
		</div>
		</div>
	</form:form>
</div>
<footer>
<c:import url="/WEB-INF/views/include/bottom_info.jsp"/>
</footer>
</body>
</html>