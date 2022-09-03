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
				<input type='hidden' name = "menu_idx" value='${obj.menu_idx}' />
					<li>
						<div class="icon_img">
							<img src="${root}image/main_icon${obj.submenu_idx }.png">
						</div>
						<div class="contents1_bold">${obj.submenu_title }</div>
						<div class="reg_button">
							<a href="${root }${obj.menu_eng}/${obj.submenu_eng }?menu_idx=${obj.menu_idx}">MORE</a>
						</div>
					</li>		
					</c:forEach>
					</ul>
					</div>
<%-- <c:import url="/WEB-INF/views/include/bottom_info.jsp"/> --%>
</body>
</html>