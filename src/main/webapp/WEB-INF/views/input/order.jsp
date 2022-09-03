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
		var tot = price * cnt;
		var exdateval = cnt / 100;
		amt.value = tot;
		exdate.value = exdateval;
	}
			

	
</script>

  </head>
<body>
<c:import url="/WEB-INF/views/include/top_menu.jsp"/>
<c:import url="/WEB-INF/views/include/side_menu.jsp"/>
		
	<form:form action="${root }input/order_pro?menu_idx=${menu_idx }" method="post" modelAttribute="orderInfoBean">
		
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
						<td colspan=2 style="text-align:right"><form:errors path='order_idx'  style='color:red'/></td>
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
						<td colspan=2 style="text-align:right"><form:errors path='order_shipment' style='color:red'/></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">담당자</span></th>
						<td><input type="text" id="order_manager" name="order_manager" class="form-control" value="${loginUserBean.user_name }" style="background-color:lightgray; color:gray" readonly></td>
					</tr>
					<tr>						
						<td colspan=2 style="text-align:right"><form:errors path='order_manager' style='color:red'/></td>
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
						<td colspan=2 style="text-align:right"><form:errors path='client_idx'  style='color:red'/></td>
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
						<td colspan=2 style="text-align:right"><form:errors path='product_idx'  style='color:red'/></td>
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
						<td colspan=2 style="text-align:right"><form:errors path='product_modelno'  style='color:red'/></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">주문등록일</span></th>
						<td><input type="date" max="9999-12-31" id="order_regdate" name="order_regdate" class="form-control"></td>
					</tr>
					<tr>						
						<td colspan=2 style="text-align:right"><form:errors path='order_regdate'  style='color:red'/></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">납기요청일</span></th>
						<td><input type="date" max="9999-12-31" id="order_deadline" name="order_deadline" class="form-control"></td>
					</tr>
					<tr>						
						<td colspan=2 style="text-align:right"><form:errors path='order_deadline'  style='color:red'/></td>
					</tr>
					<tr>						
					<tr>
						<th><span class="input-group-text" id="basic-addon1">수량</span></th>
						<td><input type="text" id="cnt" name="order_cnt" class="form-control" onKeyDown="totalAmt()"></td>
					</tr>
					<tr>						
						<td colspan=2 style="text-align:right"><form:errors path='order_cnt'  style='color:red'/></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">단가</span></th>
						<td><input type="text" id="price" name="order_unit_price" class="form-control" onKeyDown="totalAmt()" ></td>
					</tr>
					<tr>						
						<td colspan=2 style="text-align:right"><form:errors path='order_unit_price'  style='color:red'/></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">단위</span></th>
						<td><input type="text" id="order_unit" name="order_unit" class="form-control" value="box" style="background-color:lightgray; color:gray" readonly></td>
					</tr>
					<tr>						
						<td colspan=2 style="text-align:right"><form:errors path='order_unit'  style='color:red'/></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">생산예상기간(D)</span></th>
						<td><input type="text" id="exdate" name="order_exdate" class="form-control" style="background-color:lightgray; color:gray"  readonly></td>
					</tr>
					<tr>
					<td colspan=2 style="text-align:right"><form:errors path='order_exdate'  style='color:red'/></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">합계</span></th>
						<td><input type="text" id="amt" name="order_amt" class="form-control" style="background-color:lightgray; color:gray"  readonly></td>
					</tr>
					<tr>						
						<td colspan=2 style="text-align:right"><form:errors path='order_amt'  style='color:red'/></td>
					</tr>
				</table>
			</div>
		<div class="button-arrange">
		<input type="submit" class="btn btn-primary" value="등록"/>
		<a href = "${root }menu/input" class="btn btn-dark" >취소</a>
		</div>
		</div>
	</form:form>

<%-- <c:import url="/WEB-INF/views/include/bottom_info.jsp"/> --%>
</body>
</html>