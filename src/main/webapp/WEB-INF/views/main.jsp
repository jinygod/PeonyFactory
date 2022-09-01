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
            <li><a href="${root }">HOME</a></li>
            <li><a href="#">LOGIN</a></li>
            <li><a href="#">JOIN</a></li>
            <li><a href="#">MYPAGE</a></li>
          </ul>
        </div>
      </div>
      

      <!-- intro end-->
      <ul class="amount">
        <li>	
          <div>
            <div class="contents1">총 수주금액</div>
            <div class="result">$128,021</div>
          </div>
        </li>
        <li>
          <div>
            <div class="contents1">총 생산량</div>
            <div class="result">93,234</div>
          </div>
        </li>
        <li>
          <div>
            <div class="contents1">불량률</div>
            <div class="result">1.7%</div>
          </div>
        </li>
        <li>
            <div>
              <div class="contents1">목표 불량률</div>
              <div class="result">0%</div>
            </div>
        </li>
      </ul>
      <!-- amount end -->

	<div class="main_text0">
		<h1>ABOUT</h1>
		<div class="contents1">우리는 재규어처럼 재빠르게, 남들과는 다르게 옷을 뽑아냅니다.</div>
		<ul class="icons">
			<c:forEach var='obj' items="${MenuList }">
				<c:if test="${obj.menu_idx <= 3 }">
					<li>
						<div class="icon_img">
							<img src="image/main_icon${obj.menu_idx }.png">
						</div>
						<div class="contents1_bold">${obj.menu_title }</div>
						<div class="contents2">${obj.menu_content }</div>
						<div class="more">
							<a href="${root }menu/submenu?menu_idx=${obj.menu_idx}">MORE</a>
						</div>
					</li>
				</c:if>
			</c:forEach>
		</ul>
		<ul class="icons">
			<c:forEach var='obj' items="${MenuList }">
				<c:if test="${obj.menu_idx == 4 || obj.menu_idx == 5 }">
					<li>
						<div class="icon_img">
							<img src="image/main_icon${obj.menu_idx }.png">
						</div>
						<div class="contents1_bold">${obj.menu_title }</div>
						<div class="contents2">${obj.menu_content }</div>
						<div class="more">
							<a href="${root }menu/submenu?menu_idx=${obj.menu_idx}">MORE</a>
						</div>
					</li>
				</c:if>
			</c:forEach>
			<c:forEach var='obj' items="${MenuList }">
			<c:if test="${obj.menu_idx == 6 }">
				<li>
					<div class="icon_img">
						<img src="image/main_icon${obj.menu_idx }.png">
					</div>
					<div class="contents1_bold">${obj.menu_title }</div>
					<div class="contents2">${obj.menu_content }</div>
					<div class="more">
						<a href="${root }menu/input?menu_idx=${obj.menu_idx}">MORE</a>
					</div>
				</li>
			</c:if>
			</c:forEach>

		</ul>
	</div>
	
		<div class="main_text1">
			<h1>SERVICE</h1>
			<div class="contents1">최신 트렌드를 반영한 의류들만 납품하고 있습니다</div>
			<div class="service">
				<div class="food_photo">
					<img src="image/coat1.jpg">
				</div>
				<div class="contents2">
					<h2>이것이 옷이야, 날개야?</h2>
					이것이 옷인지 날개인지 헷갈리시는 분들도 있을거에요. <br> 왜냐면 이것은 그냥 Pixabay에서
					옷이라고 검색했더니 나온 이미지인데 <br> 옷 같은 아무것이나 검색이 된것 같아요. <br>
					<br> 총알오징어는, 사실 어떤 특정한 품종을 가진 게 아니랍니다. <br> 우리가 사먹지 말아야
					한다는 것이죠. <br> 불과 약 5년전만 해도 시장에 가면 냉동오징어 한마리에 천원이면 샀는데, <br>
					이젠 두마리에 7~8천원씩 하니, 더이상 서민음식이 아니게 된거죠. <br>
					<br> 얼마전에는 가격을 비교해 보았더니 마른오징어를 기준으로 <br> 같은 그람수에 같은 가격이
					나올 정도로 천정부지로 오징어값이 치솟았답니다. <br> 그런 오징어, 못생겼다고 놀리지 말고 <br>
					이제 소중하게 대해주어야 하지 않을까요?<br>
				</div>
			</div>
		</div>

		<div class="main_text2">
			<ul>
				<li>
					<div>
						<h1>CONTACT</h1>
					</div>
					<div>우리에게 파트너십을 신청하거나, 고객이 되어주세요</div>
					<div class="more2">더 알아보기</div>
				</li>
				<li></li>
			</ul>
		</div>
		</div>

	<div class="footer">
		<div class="footer-first">LOGO</div>
		<div class="footer-last">
			Co. Team division3 <br> Addr. 경기도 성남시 중원구 성남동 3219번지 KR 아트팰리스 4호
			5층 <br> 031-751-3688 <br> COPYRIGHT 2022. Team division3.
			ALL RIGHT RESERVED.
		</div>
	</div>
</body>
</html>