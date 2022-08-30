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
    <div class="wrap">
      <div class="intro_bg">
        <div class="header">
          <div class="searchArea">
            <form>
              <input type="search" placeholder="search">
              <span>검색</span>
            </form>
          </div>
          <ul class="nav">
            <li><a href="${root }menu/input/client">거래처등록</a></li>
            <li><a href="${root }menu/input/product">품목등록</a></li>
            <li><a href="${root }menu/input/order">주문등록</a></li>
            <li><a href="${root }menu/input/process">공정등록</a></li>
          </ul>
        </div>
      </div>
      </div>

</body>
</html>