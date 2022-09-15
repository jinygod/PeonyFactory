<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<c:set var='root' value="${pageContext.request.contextPath}/"/>

<c:set var="chartData" value="${ResultTotal}" />
<!DOCTYPE html>

  <meta charset="utf-8">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body style="height: 100%; margin: 0">

		<div class="wrapper">
  <c:import url="/WEB-INF/views/include/top_menu.jsp"/>
  <c:import url="/WEB-INF/views/include/side_menu.jsp"/>
<html>

<head>

	<meta charset="UTF-8">

	<title>보고서영역_1</title>

	<style type = "text/css">

		/**/

		ul { 

			font-size : 15px; 

			text-align : center;

			overflow : hidden;			

		}

 

		li { list-style-type : none; }

		.gnb li { display: inline; }

		.gnb li a {

			flex-direction :row;

			-webkit-flex-direction : row;

			-ms-flex-direction:row;

			justify-content: space-around;

			-webkit-justify-content: space-around;

			background:lightblue; /*--no-repeat;*/

			display: inline-block;

			color: #fff;

				width: 100px; 

				height: 35px; 

				line-height: 35px;

			text-align : center;

			text-decoration : none;

			overflow : hidden;			

		}

 

		.gnb li a:hover {

			text-decoration: underline;

			background: #369;

			overflow : hidden;			

 

		}

 

		/*표 영역 */

		table {

			 

			width : 100%;

			border-collapse: collaps;

			margin-bottom: 20px

 

		}

		

		table, td, th, tr {

 

			border: 1px solid black;

			border-collapse:collapse;

			align : center;

			border : 1px solid #000; 

			text-align:center; 

			

		}

 

		td {

			border : 1px solid #000; 

			text-align:center; 

		}

		th {

			border : 1px solid #000; text-align:center; 

		}	

 

		.c1{

			background: #ff0; /*노란색*/

		}

 

		.c2{

			background: #0ff; /*하늘색*/

		}

 

		/*텍스트 영역 */

		P{

			margin: 10px 110px; padding:10px;

			border: 1px solid crison;

		}

		.txt1 { text-align: left; }

		.txt2 { text-align: right; }

		.txt3 { text-align: center; }

				

 

 

	</style>

</head>

<body>

 	<div class="table_arrange">
 		<ul class="gnb">
		<li><a href="${root }result/result_report?menu_idx=${menu_idx}" target="_self" style="text-decoration: none;" >실적보고서</a></li>

		<li><a href="${root }result/result_report_data?menu_idx=${menu_idx}" target="_self" style="text-decoration: none;" >데이터취합</a></li>

		<li><a href="${root }result/result_report_write?menu_idx=${menu_idx}" target="_self" >보고서작성</a></li>

		<li><a href="views\all">총보고서</a></li>

		<li><a href="${root }result/result_report_standard?menu_idx=${menu_idx}">평가기준서</a></li>

	</ul>
	<form:form action="${root }produce/produce_status_pro?menu_idx=${menu_idx }" method="post" modelAttribute="produceStatusBean" onsubmit="return chkRate();">
		
		<div class="table_title">
		<h1>실적보고서</h1>
		</div>
			<div class="input-group mb-3">
				<table>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">구분</span></th>
						<th><span class="input-group-text" id="basic-addon1">new shirt</span></th>
						<th><span class="input-group-text" id="basic-addon1">knit</span></th>
						<th><span class="input-group-text" id="basic-addon1">new jeans</span></th>
						<th><span class="input-group-text" id="basic-addon1">slacks</span></th>
						<th><span class="input-group-text" id="basic-addon1">총계</span></th>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">주문수</span></th>
						<td><span class="input-group-text" id="basic-addon1">200</span></td>
						<td><span class="input-group-text" id="basic-addon1"></span></td>
						<td><span class="input-group-text" id="basic-addon1"></span></td>
						<td><span class="input-group-text" id="basic-addon1"></span></td>
						<td><span class="input-group-text" id="basic-addon1"></span></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">생산수</span></th>
						<td><span class="input-group-text" id="basic-addon1"></span></td>
						<td><span class="input-group-text" id="basic-addon1"></span></td>
						<td><span class="input-group-text" id="basic-addon1"></span></td>
						<td><span class="input-group-text" id="basic-addon1"></span></td>
						<td><span class="input-group-text" id="basic-addon1"></span></td>
					</tr>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">생산율</span></th>
						<td><span class="input-group-text" id="basic-addon1"></span></td>
						<td><span class="input-group-text" id="basic-addon1"></span></td>
						<td><span class="input-group-text" id="basic-addon1"></span></td>
						<td><span class="input-group-text" id="basic-addon1"></span></td>
						<td><span class="input-group-text" id="basic-addon1"></span></td>
					</tr>
				</table>
			</div>
			</form:form>
</body>

</html>