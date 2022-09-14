<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<c:set var='root' value="${pageContext.request.contextPath}/"/>

<c:set var="chartData" value="${ResultTotal}" />

<!DOCTYPE html>
<html lang="en" style="height: 100%">
<head>
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
  <div id="container" style="height: 50%; width:1000px;  position:absolute; transform: translate(50%, -1000px);" ></div>
  		
  		<div style="height: 50%; width:900px;  position:absolute; transform: translate(50%, -450px);">
			<div class="input-group mb-3">
				<table style="text-align:center">
					<tr>
						<th><span id="basic-addon1" >품목명</span></th>
						<th><span id="basic-addon1">작업월</span></th>
						<th><span id="basic-addon1">주문수량</span></th>
						<th><span id="basic-addon1">생산수량</span></th>
						<th><span id="basic-addon1">생산율</span></th>
					</tr>
					<c:forEach var="obj" items="${ResultProductTotalSummary }">
					<tr>
						<td ><input type="text" id="product_name" name="product_name" style="text-align:center" value="${obj.product_name }" readonly style=background:white></td>
						<td><input type="text" id="orderwork_date" name="orderwork_date" style="text-align:center" value="${obj.orderwork_date }월" readonly style=background:white></td>
						<td><input type="text" id="order_cnt" name="order_cnt" style="text-align:right" value="${obj.order_cnt }EA" readonly style=background:white></td>
						<td><input type="text" id="produce_cnt" name="produce_cnt" style="text-align:right" value="${obj.produce_cnt }EA" readonly style=background:white></td>
						<td><input type="text" id="produce_processrate" name="produce_processrate" style="text-align:right" value="${obj.produce_processrate }%" readonly style=background:white></td>
					</tr>
					</c:forEach>
				</table>
			</div>
		<input type="button" class="btn btn-dark" value="뒤로가기" onclick="history.back();"/>
		</div>
		</div>

  <script type="text/javascript" src="https://fastly.jsdelivr.net/npm/echarts@5.3.3/dist/echarts.min.js"></script>


  <script type="text/javascript">
    var dom = document.getElementById('container');
    var myChart = echarts.init(dom, 'dark', {
      renderer: 'canvas',
      useDirtyRect: false
    });
    var app = {};
    
    var option;
    
    var newshirt_july = ${chartData.newshirt_july}
    var newshirt_august = ${chartData.newshirt_august}
    var newshirt_september = ${chartData.newshirt_september}
    
    var knit_july = ${chartData.knit_july}
    var knit_august = ${chartData.knit_august}
    var knit_september = ${chartData.knit_september}
    
    var newjeans_july = ${chartData.newjeans_july}
    var newjeans_august = ${chartData.newjeans_august}
    var newjeans_september = ${chartData.newjeans_september}
    
    var slacks_july = ${chartData.slacks_july}
    var slacks_august = ${chartData.slacks_august}
    var slacks_september = ${chartData.slacks_september}
    
    option = {
		   title: {
    		   text: '품목별 생산실적'
    		    },
    		  legend: {},
    		  tooltip: {},
    		  dataset: {
    		    source: [
    		      ['product', '22/07', '22/08', '22/09'],
    		      ['new shirt', newshirt_july, newshirt_august, newshirt_september],
    		      ['knit', knit_july, knit_august, knit_september],
    		      ['new jeans', newjeans_july, newjeans_august, newjeans_september],
    		      ['slacks', slacks_july, slacks_august, slacks_september],
    		    ]
    		  },
    		  xAxis: [
    		    { type: 'category', gridIndex: 0 },
    		    { type: 'category', gridIndex: 1 }
    		  ],
    		  yAxis: [{ gridIndex: 0 }, { gridIndex: 1 }],
    		  grid: [{ bottom: '55%' }, { top: '55%' }],
    		  series: [
    		    // These series are in the first grid.
    		    { type: 'bar', seriesLayoutBy: 'row' },
    		    { type: 'bar', seriesLayoutBy: 'row' },
    		    { type: 'bar', seriesLayoutBy: 'row' },
    		    { type: 'bar', seriesLayoutBy: 'row' },
    		    // These series are in the second grid.
    		    { type: 'bar', xAxisIndex: 1, yAxisIndex: 1 },
    		    { type: 'bar', xAxisIndex: 1, yAxisIndex: 1 },
    		    { type: 'bar', xAxisIndex: 1, yAxisIndex: 1 }
    		  ]
    		};

    if (option && typeof option === 'object') {
      myChart.setOption(option);
    }

    window.addEventListener('resize', myChart.resize);
  </script>
</body>

<footer>
	<c:import url="/WEB-INF/views/include/bottom_info.jsp"/>
</footer>
</html>