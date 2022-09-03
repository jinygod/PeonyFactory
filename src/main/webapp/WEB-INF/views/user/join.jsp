<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<script>
	function checkUserIdExist(){
		
		var user_id = $("#user_id").val()
		
		if(user_id.length == 0 ){
			alert('아이디를 입력해주세요')
			return 
		}
		
		$.ajax({
			url : '${root}user/checkUserIdExist/' + user_id,
			type : 'get',
			dataType : 'text',
			success : function(result){
				if(result.trim() == 'true'){
					alert('사용할 수 있는 아이디입니다')
					$("#userIdExist").val('true')
				} else{
					alert('사용할 수 없는 아이디입니다')
					$('#userIdExist').val('false')
				}
			}
		})
	}
	
	function resetUserIdExist(){
		$("#userIdExist").val('false')
	}
	
</script>
<body>

	<c:import url="/WEB-INF/views/include/top_menu.jsp" />

				<div class="table_arrange">
				<div class="table_title">
				<h1>회원가입</h1>
				</div>
				<div class="card shadow">
					<div class="card-body">
						<form:form action="${root }user/join_pro" method='post' modelAttribute="joinUserBean">
							<form:hidden path="userIdExist"/>
							<div class="form-group">
								<form:label path="user_name">이름</form:label>
								<form:input path="user_name" class="form-control" />
								<form:errors path="user_name" style='color:red'/>

							</div>
							<div class="form-group">
								<form:label path="user_id">아이디</form:label>
								<div class="input-group">
									<form:input path="user_id" class='form-contorl' onkeypress="resetUserIdExist()"/>
									<div class="input-group-append">
										<button type="button" class="btn btn-primary" onclick='checkUserIdExist()'>중복확인</button>
									</div>
								</div>
								<form:errors path="user_id"  style='color:red'/>
							</div>
							<div class="form-group">
								<form:label path="user_pw">비밀번호</form:label>
								<form:password path="user_pw" class='form-control' />
								<form:errors path='user_pw' style='color:red' />
							</div>
							<div class="form-group">
								<form:label path="user_pw2">비밀번호 확인</form:label>
								<form:password path="user_pw2" class='form-control' />
								<form:errors path='user_pw2'  style='color:red'/>
							</div>
							<div class="form-group">
								<form:label path="user_email">E-mail</form:label>
								<form:input path="user_email" class='form-control' />
								<form:errors path='user_email'  style='color:red'/>
							</div>
							<div class="form-group">
								<form:label path="user_tel">연락처</form:label>
								<form:input path="user_tel" class='form-control' placeholder="ex)01012345678"/>
								<form:errors path='user_tel'  style='color:red'/>
							</div>
							<div class="form-group">
								<div class="text-right">
									<div class="login_button">
									<form:button class='btn btn-primary'>회원가입</form:button>
									</div>
								</div>
							</div>
						</form:form>
					</div>
					</div>
				</div>

<%-- 	<c:import url="/WEB-INF/views/include/bottom_info.jsp" /> --%>

</body>
</html>








