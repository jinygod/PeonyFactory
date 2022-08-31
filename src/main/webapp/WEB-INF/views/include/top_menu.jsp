<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value="${pageContext.request.contextPath}/"/>
<!doctype html>
<html>
<meta charset="UTF-8">
  <head>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${root }style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
    	  integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  </head>
<body>
<!--     <div class="wrap"> -->
    <nav class="navbar navbar-dark bg-dark">
        <div class="header">
          <div class="searchArea">
            <form>
              <input type="search" placeholder="search">
              <span>검색</span>
            </form>
          </div>
          <ul class="nav_top">
            <li><a href="${root }">HOME</a></li>
            <li><a href="#">LOGIN</a></li>
            <li><a href="#">JOIN</a></li>
            <li><a href="#">MYPAGE</a></li>
          </ul>
        </div>
      </nav>
<!--       </div> -->
</body>