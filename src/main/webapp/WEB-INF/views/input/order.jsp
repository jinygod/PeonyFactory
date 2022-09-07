<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='root' value="${pageContext.request.contextPath}/"/>
<!doctype html>
<html>
  <head>
	<meta charset="UTF-8">
	<title>주문등록</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="style.css">
    
    <script>

	
    function totalAmt() {
		let price = document.querySelector('#price').value;
		let cnt  = document.querySelector('#cnt').value;
		let date1 = new Date(document.querySelector('#order_regdate').value);
		let date2 = new Date(document.querySelector('#order_deadline').value);
		var difference_in_time = date2.getTime() - date1.getTime();
		var exdateval = difference_in_time / (1000 * 3600 * 24); 
		var tot = price * cnt;
		amt.value = tot;
		exdate.value = exdateval;
		
		var order_info = document.order_info;
		
		if(order_info.order_exdate.value < 0){
			order_info.order_exdate.focus();
    		alert('납기요청일은 주문요청일보다 전일 수 없습니다. 확인하여 다시 지정해주세요.');
    		return false;
		}
	}


	function jbSubmit() {
		var order_info = document.order_info;
	  
		if(!order_info.order_cnt.value || !order_info.order_unit_price.value){
    		order_info.order_cnt.focus();
    		order_info.order_unit_price.focus();
    		alert('입력되지 않은 정보가 있습니다. 모든 입력 칸에 정보를 입력했는지 확인해주세요.');
    		return false;
		}
		if(order_info.client_idx.value == "선택"){
    		order_info.client_idx.focus();
    		alert('거래처코드를 정하지 않았습니다. 선택란을 눌러 거래처코드를 지정해주세요.');
    		return false;
		}
		if(order_info.product_idx.value == "선택"){
    		order_info.product_idx.focus();
    		alert('품목코드를 정하지 않았습니다. 선택란을 눌러 품목코드를 지정해주세요.');
    		return false;
		}
		if(order_info.product_modelno.value == "선택"){
    		order_info.product_modelno.focus();
    		alert('모델번호를 정하지 않았습니다. 선택란을 눌러 모델번호를 지정해주세요.');
    		return false;
		}
		if(!order_info.order_regdate.value){
    		order_info.order_regdate.focus();
    		alert('주문등록일 날짜를 정하지 않았습니다. 주문등록일자 지정해주세요.');
    		return false;
		}
		if(!order_info.order_deadline.value){
    		order_info.order_deadline.focus();
    		alert('납기요청일 날짜를 정하지 않았습니다. 납기요청일 지정해주세요.');
    		return false;
		}
	
	}
	
</script>

  </head>
<body>
<div class="wrapper">
	<c:import url="/WEB-INF/views/include/top_menu.jsp"/>
	<c:import url="/WEB-INF/views/include/side_menu.jsp"/>
		
	<form:form action="${root }input/order_pro?menu_idx=${menu_idx }" name="order_info" method="post" modelAttribute="orderInfoBean" onsubmit="return jbSubmit();">
		
		<div class="table_arrange">
		<div class="table_title">
		<h1 class = "order_title">주문등록</h1>
		</div>
			<div class="input-group mb-3">
				<table>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">주문번호</span></th>
						<td><input type="text" id="order_idx" name="order_idx" class="form-control" value="${OrderSeq } " style="background-color:lightgray; color:gray" readonly></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">주문상태</span></th>
						<td><input type="text" id="order_status" name="order_status" class="form-control" value="미승인" style="background-color:lightgray; color:gray" readonly></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">출하상태</span></th>
						<td><input type="text" id="order_shipment" name="order_shipment" class="form-control" value="출하전" style="background-color:lightgray; color:gray" readonly></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">담당자</span></th>
						<td><input type="text" id="order_manager" name="order_manager" class="form-control" value="${loginUserBean.user_name }" style="background-color:lightgray; color:gray" readonly></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">거래처코드</span></th>
						<td><select id="client_idx" name="client_idx" class="form-select">
										<option style=font-color:lightgray>선택</option>
										<c:forEach var="option" items="${ClientList }">
										<option id="client_idx" value="${option.client_idx }">${option.client_idx}(${option.client_name })</option>
										</c:forEach>
								</select></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">품목코드</span></th>
						<td><select id="product_idx" name="product_idx" class="form-select">
										<option style=font-color:lightgray>선택</option>
										<c:forEach var="option" items="${ProductList }">
										<option id="product_idx" value="${option.product_idx }">${option.product_idx}(${option.product_name}-${option.product_size })</option>
										</c:forEach>
								</select></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">모델번호</span></th>
						<td><select id="product_modelno" name="product_modelno" class="form-select">
						<option style=font-color:lightgray>선택</option>
						<c:forEach var="option" items="${ProductList }">
						<option id="product_idx" value="${option.product_modelno }">${option.product_modelno}(${option.product_name})</option>
						</c:forEach>
						</select></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">주문등록일</span></th>
						<td><input type="date" max="9999-12-31" id="order_regdate" name="order_regdate" class="form-control"></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">납기요청일</span></th>
						<td><input type="date" max="9999-12-31" id="order_deadline" name="order_deadline" class="form-control"></td>
					</tr>
					<tr>						
					<tr>
						<th><span class="input-group-text" id="basic-addon1">수량</span></th>
						<td><input type="text" id="cnt" name="order_cnt" class="form-control" onKeyDown="totalAmt()"></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">단가</span></th>
						<td><input type="text" id="price" name="order_unit_price" class="form-control" onKeyDown="totalAmt()" ></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">단위</span></th>
						<td><input type="text" id="order_unit" name="order_unit" class="form-control" value="box" style="background-color:lightgray; color:gray" readonly></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">생산예상기간(D)</span></th>
						<td><input type="text" id="exdate" name="order_exdate" class="form-control" style="background-color:lightgray; color:gray"  readonly></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">합계</span></th>
						<td><input type="text" id="amt" name="order_amt" class="form-control" style="background-color:lightgray; color:gray"  readonly></td>
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
	
<footer>
	<c:import url="/WEB-INF/views/include/bottom_info.jsp"/>
</footer>

</body>
</html>