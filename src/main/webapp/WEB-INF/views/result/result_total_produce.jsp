<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<c:set var='root' value="${pageContext.request.contextPath}/"/>

<c:set var='chartData' value="${ResultTotal}/"/>
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
 <div id="container" style="height: 60%; width:1000px;  position:absolute; transform: translate(50%, -950px);" ></div>
 <div style="height: 70%; width:900px;  position:absolute; transform: translate(55.5%, -250px);">
		<input type="button" class="btn btn-dark" value="뒤로가기" onclick="history.back();"/>
		</div>
   </div>

		
  <script type="text/javascript" src="https://fastly.jsdelivr.net/npm/echarts@5.3.3/dist/echarts.min.js"></script>
  <!-- Uncomment this line if you want to dataTool extension
  <script type="text/javascript" src="https://fastly.jsdelivr.net/npm/echarts@5.3.3/dist/extension/dataTool.min.js"></script>
  -->
  <!-- Uncomment this line if you want to use gl extension
  <script type="text/javascript" src="https://fastly.jsdelivr.net/npm/echarts-gl@2/dist/echarts-gl.min.js"></script>
  -->
  <!-- Uncomment this line if you want to echarts-stat extension
  <script type="text/javascript" src="https://fastly.jsdelivr.net/npm/echarts-stat@latest/dist/ecStat.min.js"></script>
  -->
  <!-- Uncomment this line if you want to use map
  <script type="text/javascript" src="https://fastly.jsdelivr.net/npm/echarts@4.9.0/map/js/china.js"></script>
  <script type="text/javascript" src="https://fastly.jsdelivr.net/npm/echarts@4.9.0/map/js/world.js"></script>
  -->
  <!-- Uncomment these two lines if you want to use bmap extension
  <script type="text/javascript" src="https://api.map.baidu.com/api?v=3.0&ak=YOUR_API_KEY"></script>
  <script type="text/javascript" src="https://fastly.jsdelivr.net/npm/echarts@5.3.3/dist/extension/bmap.min.js"></script>
  -->

  <script type="text/javascript">
    var dom = document.getElementById('container');
    var myChart = echarts.init(dom, 'dark', {
      renderer: 'canvas',
      useDirtyRect: false
    });
    var app = {};
    
    var option;


    
    const categories = (function () {
    	  let now = new Date();
    	  let res = [];
    	  let len = 10;
    	  while (len--) {
    	    res.unshift(now.toLocaleTimeString().replace(/^\D*/, ''));
    	    now = new Date(+now - 2000);
    	  }
    	  return res;
    	})();
    	const categories2 = (function () {
    	  let res = [];
    	  let len = 10;
    	  while (len--) {
    	    res.push(10 - len - 1);
    	  }
    	  return res;
    	})();
    	const data = (function () {
    	  let res = [];
    	  let len = 10;
    	  while (len--) {
    	    res.push(Math.round(Math.random() * 1000));
    	  }
    	  return res;
    	})();
    	const data2 = (function () {
    	  let res = [];
    	  let len = 0;
    	  while (len < 10) {
    	    res.push(+(Math.random() * 10 + 5).toFixed(1));
    	    len++;
    	  }
    	  return res;
    	})();
    	option = {
    	  title: {
    	    text: '실시간생산실적'
    	  },
    	  tooltip: {
    	    trigger: 'axis',
    	    axisPointer: {
    	      type: 'cross',
    	      label: {
    	        backgroundColor: '#283b56'
    	      }
    	    }
    	  },
    	  legend: {},
    	  toolbox: {
    	    show: true,
    	    feature: {
    	      dataView: { readOnly: false },
    	      restore: {},
    	      saveAsImage: {}
    	    }
    	  },
    	  dataZoom: {
    	    show: false,
    	    start: 0,
    	    end: 100
    	  },
    	  xAxis: [
    	    {
    	      type: 'category',
    	      boundaryGap: true,
    	      data: categories
    	    },
    	    {
    	      type: 'category',
    	      boundaryGap: true,
    	      data: categories2
    	    }
    	  ],
    	  yAxis: [
    	    {
    	      type: 'value',
    	      scale: true,
    	      name: 'Price',
    	      max: 30,
    	      min: 0,
    	      boundaryGap: [0.2, 0.2]
    	    },
    	    {
    	      type: 'value',
    	      scale: true,
    	      name: 'Order',
    	      max: 1200,
    	      min: 0,
    	      boundaryGap: [0.2, 0.2]
    	    }
    	  ],
    	  series: [
    	    {
    	      name: '총 생산수량',
    	      type: 'bar',
    	      xAxisIndex: 1,
    	      yAxisIndex: 1,
    	      data: data
    	    },
    	    {
    	      name: '불량률',
    	      type: 'bar',
    	      xAxisIndex: 1,
    	      yAxisIndex: 1,
    	      data: data
    	    }
    	  ]
    	};
    	app.count = 11;
    	setInterval(function () {
    	  let axisData = new Date().toLocaleTimeString().replace(/^\D*/, '');
    	  data.shift();
    	  data.push(Math.round(Math.random() * 1000));
    	  data2.shift();
    	  data2.push(+(Math.random() * 10 + 5).toFixed(1));
    	  categories.shift();
    	  categories.push(axisData);
    	  categories2.shift();
    	  categories2.push(app.count++);
    	  myChart.setOption({
    	    xAxis: [
    	      {
    	        data: categories
    	      },
    	      {
    	        data: categories2
    	      }
    	    ],
    	    series: [
    	      {
    	        data: data
    	      },
    	      {
    	        data: data2
    	      }
    	    ]
    	  });
    	}, 2100);

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