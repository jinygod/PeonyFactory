<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "form" uri="http://www.springframework.org/tags/form"%>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>로그인</title>

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="style.css">

</head>
<body>

	<c:import url="/WEB-INF/views/include/top_menu.jsp" />

	<div class="table_arrange">
		<div class="table_title">
			<h1>LOGIN</h1>
		</div>
		<div class="card shadow">
			<div class="card-body">
				<form:form action="${root }user/login_pro" method='post'
					modelAttribute="tempLoginUserBean">
					<div class="form-group">
						<form:label path="user_id">아이디</form:label>
						<form:input path="user_id" class='form-control' />
						<form:errors path='user_id' style='color:red' />
					</div>
					<div class="form-group">
						<form:label path="user_pw">비밀번호</form:label>
						<form:password path="user_pw" class='form-control' />
						<form:errors path="user_pw" style='color:red' />
					</div>

					<div class="form-group text-right">
						<div class="login_button">
							<form:button class='btn btn-primary'>로그인</form:button>
							<a href="${root }user/join" class="btn btn-secondary">회원가입</a>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>

	<%-- <c:import url="/WEB-INF/views/include/bottom_info.jsp"/> --%>

</body>
</html>








    