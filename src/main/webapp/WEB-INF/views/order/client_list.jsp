
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='root' value="${pageContext.request.contextPath}/"/>
<!doctype html>
<html>
  <head>
	<meta charset="UTF-8">
	<title>거래처조회</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="style.css">
    <script type="text/javascript">
function button() {
	location.href = '${root }produce/produce_orderwork?order_idx=${obj.order_idx}&menu_idx=${menu_idx }'
}

$(function() {
	var chkObj = document.getElementsByName("RowCheck");	// 체크박스 총 개수
	var rowCnt = chkObj.length;

	$("input[name='allCheck']").click(function() {	// 전체체크 누르면 -> 개별체크박스 모두 자동 체크
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

	$("input[name='RowCheck']").click(function() {	// 개별체크박스를 일일히 모두 누르면 전체체크박스가 자동으로 체크
		if ($("input[name='RowCheck']:checked").length == rowCnt) {
			$("input[name='allCheck']")[0].checked = true;
		} else {
			$("input[name='allCheck']")[0].checked = false;
		}
	});
});


function deleteClient() {
	var url = "deleteClient?menu_idx=${menu_idx}";
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
			success : function() {
					alert("삭제되었습니다.");
					location.replace("client_list?menu_idx=${menu_idx}")
				} 
		});
		} else{
			alert("삭제를 취소하였습니다.")
		}
		}
	
}
    
</script>    
  </head>
  <body>
  <div class="wrapper">
  <c:import url="/WEB-INF/views/include/top_menu.jsp"/>
  <c:import url="/WEB-INF/views/include/side_menu.jsp"/>
  
	<form:form action="${root }client/modify" method="post" modelAttribute="modifyClientBean">
		
		<div class="table_arrange">
		<div class="table_title">
		<h1>거래처조회</h1>
		</div>
			<div class="input-group mb-3">
				<table>
					<tr>
						<th><span class="input-group-text" id="basic-addon1" style="height:38px"><input id="allCheck" type="checkbox" name="allCheck"/></span></th>
						<th><span class="input-group-text" id="basic-addon1">거래처코드</span></th>
						<th><span class="input-group-text" id="basic-addon1">거래처명</span></th>
						<th><span class="input-group-text" id="basic-addon1">연락처</span></th>
						<th><span class="input-group-text" id="basic-addon1">대표자명</span></th>
						<th><span class="input-group-text" id="basic-addon1">우편번호</span></th>
						<th><span class="input-group-text" id="basic-addon1">주소</span></th>
					</tr>
					<c:forEach var="obj" items="${ClientList }">
					<tr>
						<td><span class="input-group-text" id="basic-addon1" style="height:38px; background:white;"><input name ="RowCheck" type="checkbox" id="RowCheck" value="${obj.client_idx }"/></span></td>
						<td><input type="text" id="client_idx" name="client_idx" class="form-control" value="${obj.client_idx }" readonly style=background:white></td>
						<td><input type="text" id="client_name" name="client_name" class="form-control" value="${obj.client_name }" readonly style=background:white></td>
						<td><input type="text" id="client_tel" name="client_tel" class="form-control" value="${obj.client_tel }" readonly style=background:white></td>
						<td><input type="text" id="client_ceo" name="client_ceo" class="form-control" value="${obj.client_ceo }" readonly style=background:white></td>
						<td><input type="text" id="client_zipcode" name="client_zipcode" class="form-control" value="${obj.client_zipcode }" readonly style=background:white></td>
						<td><input type="text" id="client_addr" name="client_addr" class="form-control" value="${obj.client_addr }" readonly style=background:white></td>
					</tr>
					</c:forEach>
				</table>
			</div>
		<div class="button-arrange">
		<input type="button" value="삭제" class="btn btn-danger" onClick="deleteClient();" >
		<input type="button" class="btn btn-dark" value="뒤로가기" onclick="history.back();"/>
		</div>
		</div>
	</form:form>
</div>
  
</body>
  
<footer>
	<c:import url="/WEB-INF/views/include/bottom_info.jsp"/>
</footer>

   <!--  input 안에 : aria-label="Username" aria-describedby="basic-addon1" -->