<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='root' value="${pageContext.request.contextPath}/"/>
<!doctype html>
<html>
  <head>
	<meta charset="UTF-8">
	<title>작업지시서</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
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


function request() {
	var process_name = document.querySelector('#process_name').value;
	if (process_name == '선택') {
		alert('작업지시명을 선택해주세요');
	}
	else{
	var url = "request?menu_idx=${menu_idx}";
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
		var chk = confirm("작업요청 하시겠습니까?");
		if(chk == true){
		$.ajax({
			url : url,
			type : 'POST',
			traditional : true,
			data : {
				valueArr : valueArr
			},
			success : function() {
					alert("작업요청 하였습니다.");
					location.replace("produce_orderwork?menu_idx=${menu_idx}")
				} 
		});
		} else{
			alert("작업요청을 취소하였습니다.")
		}
		}
	}
}
    
</script>    
  </head>
  <body>
  <div class="wrapper">
  <c:import url="/WEB-INF/views/include/top_menu.jsp"/>
  <c:import url="/WEB-INF/views/include/side_menu.jsp"/>
  
		<form name='orderwork_info'>
		<div class="table_arrange">
		<div class="table_title">
		<h1>작업지시서</h1>
		</div>
			<div class="input-group mb-3">
				<table>
					<tr>
						<th><span class="input-group-text" id="basic-addon1" style="height:38px"><input id="allCheck" type="checkbox" name="allCheck"/></span></th>
						<th><span class="input-group-text" id="basic-addon1">작업지시번호</span></th>
						<th><span class="input-group-text" id="basic-addon1">작업지시명</span></th>
						<th><span class="input-group-text" id="basic-addon1">품목코드</span></th>
						<th><span class="input-group-text" id="basic-addon1">모델번호</span></th>
						<th><span class="input-group-text" id="basic-addon1">주문등록일</span></th>
						<th><span class="input-group-text" id="basic-addon1">납기요청일</span></th>
						<th><span class="input-group-text" id="basic-addon1">생산예상기간</span></th>
						<th><span class="input-group-text" id="basic-addon1">수량</span></th>
						<th><span class="input-group-text" id="basic-addon1">단위</span></th>
						<th><span class="input-group-text" id="basic-addon1" style="width:70px">단가</span></th>
						<th><span class="input-group-text" id="basic-addon1" style="width:100px">금액</span></th>
						<th><span class="input-group-text" id="basic-addon1">작업지시일</span></th>
						<th><span class="input-group-text" id="basic-addon1">작업상태</span></th>
					</tr>
					<c:forEach var="obj" items="${OrderWorkList }">
					<tr>
						<td><span class="input-group-text" id="basic-addon1" style="height:38px; background:white;"><input name ="RowCheck" type="checkbox" id="RowCheck" value="${obj.orderwork_idx }"/></span></td>
						<td><input type="text" id="orderwork_idx" name="orderwork_idx" class="form-control" value="${obj.orderwork_idx }" style="background-color:white" readonly></td>
								<td><select id="process_name" name="process_name" class="form-select" style="font-weight:bold; color:red">
										<option>선택</option>
										<c:forEach var="option" items="${ProcessList }">
										<option id="process_name">${option.process_name}</option>
										</c:forEach>
								</select></td>
						<td><input type="text" id="product_idx" name="product_idx" class="form-control" value="${obj.product_idx }" style="background-color:white" readonly></td>
						<td><input type="text" id="product_modelno" name="product_modelno" class="form-control" value="${obj.product_modelno }" style="background-color:white" readonly></td>
						<td><input type="text" id="order_regdate" name="order_regdate" class="form-control" value="${obj.order_regdate }" style="background-color:white" readonly></td>
						<td><input type="text" id="order_deadline" name="order_deadline" class="form-control" value="${obj.order_deadline }" style="background-color:white" readonly></td>
						<td><input type="text" id="order_exdate" name="order_exdate" class="form-control" value="${obj.order_exdate }" style="background-color:white" readonly></td>
						<td><input type="text" id="order_cnt" name="order_cnt" class="form-control" value="${obj.order_cnt }" style="background-color:white" readonly></td>
						<td><input type="text" id="order_unit" name="order_unit" class="form-control" value="${obj.order_unit } " style="background-color:white" readonly></td>
						<td><input type="text" id="order_unit_price" name="order_unit_price" class="form-control" value="${obj.order_unit_price }" style="background-color:white" readonly></td>
						<td><input type="text" id="order_amt" name="order_amt" class="form-control" value="${obj.order_amt }" style="background-color:white" readonly></td>
						<td><input type="text" id="orderwork_date" name="orderwork_date" class="form-control" value="${obj.orderwork_date }" style="background-color:white" readonly></td>
						<td><input type="text" id="orderwork_status" name="orderwork_status" class="form-control" value="${obj.orderwork_status }" style="background-color:white" readonly	></td>
					</tr>
					</c:forEach>
				</table>
			</div>
			
			<div class="d-none d-md-block">
				<ul class="pagination justify-content-center">
					<c:choose>
					<c:when test="${pageBean.prevPage <= 0 }">
					<li class="page-item disabled">
						<a href="#" class="page-link">이전</a>
					</li>
					</c:when>
					<c:otherwise>
					<li class="page-item">
						<a href="${root }produce/produce_orderwork?menu_idx=${menu_idx }&page=${pageBean.prevPage}" class="page-link">이전</a>
					</li>
					</c:otherwise>
					</c:choose>
					
					
					<c:forEach var='idx' begin="${pageBean.min }" end='${pageBean.max }'>
					<c:choose>
					<c:when test="${idx == pageBean.currentPage }">
					<li class="page-item active">
						<a href="${root }produce/produce_orderwork?menu_idx=${menu_idx }&page=${idx}" class="page-link">${idx }</a>
					</li>
					</c:when>
					<c:otherwise>
					<li class="page-item">
						<a href="${root }produce/produce_orderwork?menu_idx=${menu_idx }&page=${idx}" class="page-link">${idx }</a>
					</li>
					</c:otherwise>
					</c:choose>
					
					</c:forEach>
					
					<c:choose>
					<c:when test="${pageBean.max >= pageBean.pageCnt }">
					<li class="page-item disabled">
						<a href="#" class="page-link">다음</a>
					</li>
					</c:when>
					<c:otherwise>
					<li class="page-item">
						<a href="${root }produce/produce_orderwork?menu_idx=${menu_idx }&page=${pageBean.nextPage}" class="page-link">다음</a>
					</li>
					</c:otherwise>
					</c:choose>
					
				</ul>
			</div>
		<div class="button-arrange">
		<input type="button" value="작업요청" class="btn btn-primary" onClick= "request();" >
		<input type="button" class="btn btn-dark" value="뒤로가기" onclick="history.back();"/>
		</div>
		</div>
	</form>
	</div>
	<footer>
		<c:import url="/WEB-INF/views/include/bottom_info.jsp"/>
	</footer>
  
  </body>
  
   <!--  input 안에 : aria-label="Username" aria-describedby="basic-addon1" -->