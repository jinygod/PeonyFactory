<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='root' value="${pageContext.request.contextPath}/"/>
<!doctype html>
<html>
  <head>
	<meta charset="UTF-8">
	<title>생산현황조회</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="style.css">
    
    <script>
    
    	function processrateCalc() {
			
    		let order_cnt = document.querySelector('#order_cnt').value;	// 주문수량
	    	let produce_cnt = document.querySelector('#produce_cnt').value;	// 생산수량
	    	let produce_losscnt = document.querySelector('#produce_losscnt').value;	// 손실수량
	    	let produce_badcnt = document.querySelector('#produce_badcnt').value;	// 불량수량
	    	
	    	if(produce_cnt >= 0 && produce_losscnt >= 0 && produce_badcnt >= 0) {
	    		 produce_processrate.value = Math.floor((produce_cnt / order_cnt) * 100) +'%';
	    	} else {
	    		document.querySelector('#produce_cnt').value= "";
	    		document.querySelector('#produce_losscnt').value= "";
	    		document.querySelector('#produce_badcnt').value= "";
	    		alert('입력 수량을 확인하세요');
	    	}
    	}
    	
    	  function chkRate() {
    		  let order_cnt = Number(document.querySelector('#order_cnt').value);	// 주문수량
  	    	  let produce_cnt = document.querySelector('#produce_cnt').value;	// 생산수량
    		  
    		  if(order_cnt > produce_cnt) {
	    	    alert('입력 수량을 확인하세요');
	    	    return false;
    		  }
    	  }
    	
    </script>
    
  </head>
  <body>
  
  <c:import url="/WEB-INF/views/include/top_menu.jsp"/>
  <c:import url="/WEB-INF/views/include/side_menu.jsp"/>
  
	<div class="container">
	<div class="table_arrange">
	<form:form action="${root }produce/produce_status_pro?menu_idx=${menu_idx }" method="post" modelAttribute="produceStatusBean" onsubmit="return chkRate();">
		
		<div class="table_title">
		<h1>생산현황조회</h1>
		</div>
			<div class="input-group mb-3">
				<table>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">작업지시번호</span></th>
						<th><span class="input-group-text" id="basic-addon1">작업지시명</span></th>
						<th><span class="input-group-text" id="basic-addon1">작업지시일</span></th>
						<th><span class="input-group-text" id="basic-addon1">품목코드</span></th>
						<th><span class="input-group-text" id="basic-addon1">모델번호</span></th>
						<th><span class="input-group-text" id="basic-addon1">주문등록일</span></th>
						<th><span class="input-group-text" id="basic-addon1">납기요청일</span></th>
						<th><span class="input-group-text" id="basic-addon1">생산예상기간</span></th>
						<th><span class="input-group-text" id="basic-addon1">주문수량</span></th>
						<th><span class="input-group-text" id="basic-addon1">단위</span></th>
						<th><span class="input-group-text" id="basic-addon1" style="width:70px">단가</span></th>
						<th><span class="input-group-text" id="basic-addon1" style="width:100px">금액</span></th>
						<th><span class="input-group-text" id="basic-addon1">생산수량</span></th>
						<th><span class="input-group-text" id="basic-addon1">손실수량</span></th>
						<th><span class="input-group-text" id="basic-addon1">불량수량</span></th>
						<th><span class="input-group-text" id="basic-addon1">생산율</span></th>
						<th><span class="input-group-text" id="basic-addon1">생산상태</span></th>
					</tr>
					<c:forEach var="obj" items="${ProduceStatusList }">
					<tr> 
						<td><input type="text" id="orderwork_idx" name="orderwork_idx" class="form-control" value="${obj.orderwork_idx }" style="background:white" readonly></td>
						<td><input type="text" id="process_name" name="process_name" class="form-control" value="${obj.process_name }" style="background:white" readonly></td>
						<td><input type="text" id="orderwork_date" name="orderwork_date" class="form-control" value="${obj.orderwork_date }" style="background:white" readonly></td>
						<td><input type="text" id="product_idx" name="product_idx" class="form-control" value="${obj.product_idx }" style="background:white" readonly></td>
						<td><input type="text" id="product_modelno" name="product_modelno" class="form-control" value="${obj.product_modelno }" style="background:white" readonly></td>
						<td><input type="text" id="order_regdate" name="order_regdate" class="form-control" value="${obj.order_regdate }" style="background:white" readonly></td>
						<td><input type="text" id="order_deadline" name="order_deadline" class="form-control" value="${obj.order_deadline }" style="background:white" readonly></td>
						<td><input type="text" id="order_exdate" name="order_exdate" class="form-control" value="${obj.order_exdate }" style="background:white" readonly></td>
						<td><input type="text" id="order_cnt" name="order_cnt" class="form-control" value="${obj.order_cnt }" style="background:white" readonly></td>
						<td><input type="text" id="order_unit" name="order_unit" class="form-control" value="${obj.order_unit }" style="background:white" readonly></td>
						<td><input type="text" id="order_unit_price" name="order_unit_price" class="form-control" value="${obj.order_unit_price }" style="background:white" readonly></td>
						<td><input type="text" id="order_amt" name="order_amt" class="form-control" value="${obj.order_amt }" style="background:white" readonly></td>
						<td><input type="text" id="produce_cnt" name="produce_cnt" class="form-control" value="${obj.produce_cnt }" onKeyDown="processrateCalc()"></td>
						<td><input type="text" id="produce_losscnt" name="produce_losscnt" class="form-control" value="${obj.produce_losscnt }" onKeyDown="processrateCalc()"></td>
						<td><input type="text" id="produce_badcnt" name="produce_badcnt" class="form-control" value="${obj.produce_badcnt }" onKeyDown="processrateCalc()"></td>
						<td><input type="text" id="produce_processrate" name="produce_processrate" class="form-control" value="${obj.produce_processrate }" style="background:white" readonly></td>
						<td><input type="text" id="orderwork_status" name="orderwork_status" class="form-control" value="${obj.orderwork_status }"style="background:white" readonly></td>
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
						<a href="${root }produce/produce_status?menu_idx=${menu_idx }&page=${pageBean.prevPage}" class="page-link">이전</a>
					</li>
					</c:otherwise>
					</c:choose>
					
					
					<c:forEach var='idx' begin="${pageBean.min }" end='${pageBean.max }'>
					<c:choose>
					<c:when test="${idx == pageBean.currentPage }">
					<li class="page-item active">
						<a href="${root }produce/produce_status?menu_idx=${menu_idx }&page=${idx}" class="page-link">${idx }</a>
					</li>
					</c:when>
					<c:otherwise>
					<li class="page-item">
						<a href="${root }produce/produce_status?menu_idx=${menu_idx }&page=${idx}" class="page-link">${idx }</a>
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
						<a href="${root }produce/produce_status?menu_idx=${menu_idx }&page=${pageBean.nextPage}" class="page-link">다음</a>
					</li>
					</c:otherwise>
					</c:choose>
					
				</ul>
			</div>
			
		<div class="button-arrange">
		<input type="submit" class="btn btn-primary" value="입력완료"/>
		<input type="button" class="btn btn-dark" value="뒤로가기" onclick="history.back();"/>
		</div>
	</form:form>
		</div>
	</div>
<%-- <c:import url="/WEB-INF/views/include/bottom_info.jsp"/> --%>
  
  </body>
</html>