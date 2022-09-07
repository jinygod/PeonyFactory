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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="style.css">
    <script>

	$(function() {
		var chkObj = document.getElementsByName("RowCheck");
		var rowCnt = chkObj.length;

		$("input[name='allCheck']").click(function() {
			var chk_listArr = $("input[name='RowCheck']");
			for (var i = 0; i < chk_listArr.length; i++) {
				chk_listArr[i].chekced = this.checked;
				if ($("input[name='allCheck']")[0].checked) {
					$("input[name='RowCheck']")[i].checked = true;
				} else {
					$("input[name='RowCheck']")[i].checked = false;
				}
			}
		});

		$("input[name='RowCheck']").click(function() {
			if ($("input[name='RowCheck']:checked").length == rowCnt) {
				$("input[name='allCheck']")[0].checked = true;
			} else {
				$("input[name='allCheck']")[0].checked = false;
			}
		});
	});

		
	function deleteproduct() {
		var url = "delete?menu_idx=${menu_idx}";
		var valueArr = new Array();
		var list = $("input[name='RowCheck']");
		for (var i = 0; i < list.length; i++) {
			if (list[i].checked) { // 선택되어있으면 배열에 값을 저장함
				valueArr.push(list[i].value);
			}
		}
		if (valueArr.length == 0) {
			alert("하나 이상 선택해주세요");
		} else {
			var chk = confirm("정말 삭제하시겠습니까?");
			if(chk == true){
			$.ajax({
				url : url,
				type : 'POST',
				traditional : true,
				data : {
					valueArr : valueArr
				},
				success : function(){
							alert("삭제되었습니다.");
							location.replace("product_list?menu_idx=${menu_idx}")
						  }
					});
					} else {
							alert("삭제를 취소하였습니다.");
			}
		}
	}
    </script>
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
						<th><span class="input-group-text" id="basic-addon1" style="height:38px"><input id="allCheck" type="checkbox" name="allCheck"/></span></th>
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
						<td><span class="input-group-text" id="basic-addon1" style="height:38px; background:white;"><input name ="RowCheck" type="checkbox" id="RowCheck" value="${obj.product_idx }"/></span></td>
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
		<input type="button" value="삭제" class="btn btn-danger" onClick="deleteproduct();" >
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