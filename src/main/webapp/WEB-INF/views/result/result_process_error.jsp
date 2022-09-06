<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<c:set var='root' value="${pageContext.request.contextPath}/"/>

<c:set var="chartData" value="${ResultProcess}" />

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
  <div id="container" style="height: 50%; width:1000px;  position:absolute; transform: translate(50%, -900px);" ></div>
  		
  		<div style="height: 50%; width:900px;  position:absolute; transform: translate(50%, -400px);">
			<div class="input-group mb-3">
				<table style="text-align:center">
					<tr>
						<th><span id="basic-addon1" >공정명</span></th>
						<th><span id="basic-addon1">작업월</span></th>
						<th><span id="basic-addon1">불량수량</span></th>
						<th><span id="basic-addon1">생산수량</span></th>
						<th><span id="basic-addon1">불량율</span></th>
					</tr>
					<c:forEach var="obj" items="${ResultProcessSummary }">
					<tr>
						<td ><input type="text" id="process_name" name="process_name" style="text-align:center" value="${obj.process_name }" readonly style=background:white></td>
						<td><input type="text" id="orderwork_date" name="orderwork_date" style="text-align:center" value="${obj.orderwork_date }월" readonly style=background:white></td>
						<td><input type="text" id="produce_badcnt" name="produce_badcnt" style="text-align:right" value="${obj.produce_badcnt }EA" readonly style=background:white></td>
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
    
    var cut_july = ${chartData.cut_july};
    var cut_august = ${chartData.cut_august};
    var cut_september = ${chartData.cut_september};
    
    var sew_july = ${chartData.sew_july};
    var sew_august = ${chartData.sew_august};
    var sew_september = ${chartData.sew_september};
    
    var pack_july = ${chartData.pack_july};
    var pack_august = ${chartData.pack_august};
    var pack_september = ${chartData.pack_september};
    
    option = {
  title: {
    text: '공정별 에러현황',
    left: 'center',
  },
  tooltip: {
    trigger: 'item',
    formatter: '{a} : {b} : {c}'
  },
  legend: {
    left: 'left'
  },
  xAxis: {
    type: 'category',
    name: 'month',
    splitLine: { show: false },
    data: ['22/07', '22/08', '22/09']
  },
  grid: {
    left: '3%',
    right: '4%',
    bottom: '3%',
    containLabel: true
  },
  yAxis: {
    type: 'value',
    name: 'y',
  },
  series: [
    {
      name: '재단',
      type: 'line',
      data: [cut_july, cut_august, cut_september]
    },
    {
      name: '재봉',
      type: 'line',
      data: [sew_july, sew_august, sew_september]
    },
    {
      name: '포장',
      type: 'line',
      data: [pack_july, pack_august, pack_september]
    }
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