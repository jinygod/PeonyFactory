<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='root' value="${pageContext.request.contextPath}/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="/WEB-INF/views/include/top_menu.jsp"/>
		
		<div class="table_arrange">
				<ul class="icons">
		<c:forEach var="obj" items="${SubMenuList }">
					<li>
						<div class="icon_img">
							<img src="${root}image/main_icon7.png">
						</div>
						<div class="contents1_bold">${obj.submenu_title }</div>
						<div class="reg_button">
							<a href="${root }menu/${obj.submenu_eng }">MORE</a>
						</div>
					</li>		
					</c:forEach>
					</ul>
					</div>

<%-- <c:import url="/WEB-INF/views/include/bottom_info.jsp"/> --%>
</body>
</html>