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
	<title>주문승인</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${root}style.css">
<script type="text/javascript">


	function button() {
		location.href = '${root }order/order_approve?order_idx=${obj.order_idx}&menu_idx=${menu_idx }'
	}

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

		
	function approve() {
		var url = "approve?menu_idx=${menu_idx}";
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
			var chk = confirm("정말 승인하시겠습니까?");
			if(chk == true){
			$.ajax({
				url : url,
				type : 'POST',
				traditional : true,
				data : {
					valueArr : valueArr
				},
				success : function(){
							alert("승인하였습니다.");
							location.replace("order_approve?menu_idx=${menu_idx}")
						  }
					});
					} else {
							alert("승인을 취소하였습니다.");
			}
		}
	}
	function refuse() {
		var url = "refuse?menu_idx=${menu_idx}";
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
			var chk = confirm("정말 거절하시겠습니까?");
			if(chk == true){
			$.ajax({
				url : url,
				type : 'POST',
				traditional : true,
				data : {
					valueArr : valueArr
				},
				dataType : "text",
				success : function() {
						alert("거절되었습니다.");
						location.replace("order_approve?menu_idx=${menu_idx}")
					} 
			});
			} else {
				alert("거절을 취소하였습니다.");
			}
		}
	}
</script>
</head>
  <body>
  <div class="wrapper">
  
  <c:import url="/WEB-INF/views/include/top_menu.jsp"/>
  <c:import url="/WEB-INF/views/include/side_menu.jsp"/>
		<div class="table_arrange_list">
		<div class="table_title">
		<h1>주문승인</h1>
		</div>
			<div class="input-group mb-3">
				<table>
					<tr>
						<th><span class="input-group-text" id="basic-addon1" style="height:38px"><input id="allCheck" type="checkbox" name="allCheck"/></span></th>
						<th><span class="input-group-text" id="basic-addon1">주문번호</span></th>
						<th><span class="input-group-text" id="basic-addon1">출하상태</span></th>
						<th><span class="input-group-text" id="basic-addon1">거래처코드</span></th>
						<th><span class="input-group-text" id="basic-addon1">품목코드</span></th>
						<th><span class="input-group-text" id="basic-addon1">모델번호</span></th>
						<th><span class="input-group-text" id="basic-addon1">주문등록일</span></th>
						<th><span class="input-group-text" id="basic-addon1">납기요청일</span></th>
						<th><span class="input-group-text" id="basic-addon1">생산예상기간</span></th>
						<th><span class="input-group-text" id="basic-addon1">수량</span></th>
						<th><span class="input-group-text" id="basic-addon1">단위</span></th>
						<th><span class="input-group-text" id="basic-addon1">단가</span></th>
						<th><span class="input-group-text" id="basic-addon1">금액</span></th>
						<th><span class="input-group-text" id="basic-addon1">담당자</span></th>
						<th><span class="input-group-text" id="basic-addon1">등록일시</span></th>
						<th><span class="input-group-text" id="basic-addon1">주문상태</span></th>
						
					</tr>
					<c:forEach var="obj" items="${UnapprovedOrderList }" varStatus="status">
					<tr>
						<td><span class="input-group-text" id="basic-addon1" style="height:38px; background:white;"><input name ="RowCheck" type="checkbox" id="RowCheck" value="${obj.order_idx }"/></span></td>
						<td><input type="text" id="order_idx" name="order_idx" class="form-control" value="${obj.order_idx }" style="background-color:white" readonly></td>
						<td><input type="text" id="order_shipment" name="order_shipment" class="form-control" value="${obj.order_shipment }" style="background-color:white" readonly></td>
						<td><input type="text" id="client_idx" name="client_idx" class="form-control" value="${obj.client_idx }" style="background-color:white" readonly></td>
						<td><input type="text" id="product_idx" name="product_idx" class="form-control" value="${obj.product_idx }" style="background-color:white" readonly></td>
						<td><input type="text" id="product_modelno" name="product_modelno" class="form-control" value="${obj.product_modelno }" style="background-color:white" readonly></td>
						<td><input type="text" id="order_regdate" name="order_regdate" class="form-control" value="${obj.order_regdate }" style="background-color:white; width:110px" readonly></td>
						<td><input type="text" id="order_deadline" name="order_deadline" class="form-control" value="${obj.order_deadline }" style="background-color:white; width:110px" readonly></td>
						<td><input type="text" id="order_exdate" name="order_exdate" class="form-control" value="${obj.order_exdate }" style="background-color:white" readonly></td>
						<td><input type="text" id="order_cnt" name="order_cnt" class="form-control" value="${obj.order_cnt }" style="background-color:white" readonly></td>
						<td><input type="text" id="order_unit" name="order_unit" class="form-control" value="${obj.order_unit }" style="background-color:white" readonly></td>
						<td><input type="text" id="order_unit_price" name="order_unit_price" class="form-control" value="${obj.order_unit_price }" style="background-color:white; width:80px" readonly></td>
						<td><input type="text" id="order_amt" name="order_amt" class="form-control" value="${obj.order_amt }" style="background-color:white; width:110px" readonly></td>
						<td><input type="text" id="order_manager" name="order_manager" class="form-control" value="${obj.order_manager }" style="background-color:white" readonly></td>
						<td><input type="text" id="order_date" name="order_date" class="form-control" value="${obj.order_date }" style="background-color:white; width:100px" readonly></td>
						<td><input type="text" id="order_status" name="order_status" class="form-control" value="${obj.order_status }" style="background-color:white" readonly></td>
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
						<a href="${root }order/order_approve?menu_idx=${menu_idx }&page=${pageBean.prevPage}" class="page-link">이전</a>
					</li>
					</c:otherwise>
					</c:choose>
					
					
					<c:forEach var='idx' begin="${pageBean.min }" end='${pageBean.max }'>
					<c:choose>
					<c:when test="${idx == pageBean.currentPage }">
					<li class="page-item active">
						<a href="${root }order/order_approve?menu_idx=${menu_idx }&page=${idx}" class="page-link">${idx }</a>
					</li>
					</c:when>
					<c:otherwise>
					<li class="page-item">
						<a href="${root }order/order_approve?menu_idx=${menu_idx }&page=${idx}" class="page-link">${idx }</a>
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
						<a href="${root }order/order_approve?menu_idx=${menu_idx }&page=${pageBean.nextPage}" class="page-link">다음</a>
					</li>
					</c:otherwise>
					</c:choose>
					
				</ul>
			</div>
		<div class="button-arrange">
		<input type="button" value="승인" class="btn btn-primary" onClick="approve();" >
		<input type="button" value="거절" class="btn btn-danger" onClick="refuse();" >
		<input type="button" class="btn btn-dark" value="취소" onclick="history.back();"/>
		</div>
		</div>
	</div>
	
<footer>
	<c:import url="/WEB-INF/views/include/bottom_info.jsp"/>
</footer>
  
  </body>
 </html>