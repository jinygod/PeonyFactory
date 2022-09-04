<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='root' value="${pageContext.request.contextPath}/"/>
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
  <div id="container" style="height: 100%"></div>

  
  <script type="text/javascript" src="https://fastly.jsdelivr.net/npm/echarts@5.3.3/dist/echarts.min.js"></script>

		<div>
				<table>
					<tr>
						<th><span class="input-group-text" id="basic-addon1">작업지시일</span></th>
						<th><span class="input-group-text" id="basic-addon1">공정명</span></th>
						<th><span class="input-group-text" id="basic-addon1">생산수량</span></th>
						<th><span class="input-group-text" id="basic-addon1">불량수량</span></th>
						<th><span class="input-group-text" id="basic-addon1">생산율</span></th>
					</tr>
					<c:forEach var="obj" items="${ResultProcessList }">
					<tr> 
						<td><input type="text" id="orderwork_date" name="orderwork_date" class="form-control" value="${obj.orderwork_date }" style="background:white" readonly></td>
						<td><input type="text" id="process_name" name="process_name" class="form-control" value="${obj.process_name }" style="background:white" readonly></td>
						<td><input type="text" id="produce_cnt" name="produce_cnt" class="form-control" value="${obj.produce_cnt }" onKeyDown="processrateCalc()"></td>
						<td><input type="text" id="produce_badcnt" name="produce_badcnt" class="form-control" value="${obj.produce_badcnt }" onKeyDown="processrateCalc()"></td>
						<td><input type="text" id="produce_processrate" name="produce_processrate" class="form-control" value="${obj.produce_processrate }" style="background:white" readonly></td>
					</tr>
					</c:forEach>
				</table>
			</div>

  <script type="text/javascript">
    var dom = document.getElementById('container');
    var myChart = echarts.init(dom, null, {
      renderer: 'canvas',
      useDirtyRect: false
    });
    var app = {};
    
    var option;

    option = {
  title: {
    text: '공정별 에러현황',
    left: 'center'
  },
  tooltip: {
    trigger: 'item',
    formatter: '{a} <br/>{b} : {c}'
  },
  legend: {
    left: 'left'
  },
  xAxis: {
    type: 'category',
    name: 'month',
    splitLine: { show: false },
    data: ['2022/07', '2022/08', '2022/09']
  },
  grid: {
    left: '3%',
    right: '4%',
    bottom: '3%',
    containLabel: true
  },
  yAxis: {
    type: 'log',
    name: 'rate',
    minorSplitLine: {
      show: false
    }
  },
  
		
  	let produce_cnt = document.querySelector('#produce_processrate').value;	// 생산수량
  	let produce_badcnt = document.querySelector('#produce_badcnt').value;	// 불량수량
  	let produce_badcnt = document.querySelector('#produce_badcnt').value;	// 불량수량

  
  series: [
    {
      name: '재단',
      type: 'line',
      data: [] = produce_cnt;
    },
    {
      name: '재봉',
      type: 'line',
      data: [1, 2, 4]
    },
    {
      name: '포장',
      type: 'line',
      data: [1, 2, 4]
      ]
    }
  ]
};

    if (option && typeof option === 'object') {
      myChart.setOption(option);
    }

    window.addEventListener('resize', myChart.resize);
  </script>
</body>
</html>