<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value="${pageContext.request.contextPath}/"/>
<!doctype html>
<html>
  <head>
	<meta charset="UTF-8">
	<title>기초정보관리</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="style.css">
  </head>
  <body>
  
  <c:import url="/WEB-INF/views/include/top_menu.jsp"/>
  

		<div class="table_arrange">
				<ul class="icons">
					<li>
						<div class="icon_img">
							<img src="${root}image/main_icon7.png">
						</div>
						<div class="contents1_bold">거래처등록</div>
						<div class="reg_button">
							<a href="${root }menu/input/client">등록</a>
						</div>
					</li>
					<li>
						<div class="icon_img">
							<img src="${root}image/main_icon1.png">
						</div>
						<div class="contents1_bold">품목등록</div>
						<div class="reg_button">
							<a href="${root }menu/input/product">등록</a>
						</div>
					</li>
					<li>
						<div class="icon_img">
							<img src="${root}image/main_icon2.png">
						</div>
						<div class="contents1_bold">주문등록</div>
						<div class="reg_button">
							<a href="${root }menu/input/order">등록</a>
						</div>
					</li>
					<li>
						<div class="icon_img">
							<img src="${root}image/main_icon4.png">
						</div>
						<div class="contents1_bold">공정목록</div>
						<div class="reg_button">
							<a href="${root }menu/input/process">등록</a>
						</div>
					</li>
		</ul>
		</div>
	
</body>
</html>