<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/jsp/header.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>홈</title>
<link rel="stylesheet" href="<c:url value='/css/styles.css'/>">
<style>
.welcome-container {
	text-align: center;
	margin: 20px 0;
	padding: 10px;
	background-color: #f8f9fa;
	border-radius: 5px;
}

.welcome-message {
	font-size: 18px;
	color: #333;
}

.welcome-message a {
	color: #007bff;
	text-decoration: none;
	font-weight: bold;
	margin: 0 5px;
}

.welcome-message a:hover {
	text-decoration: underline;
}
</style>
<script>
	function showCategory(category) {
		var cards = document.getElementsByClassName('card');
		for (var i = 0; i < cards.length; i++) {
			if (category === 'all') {
				cards[i].style.display = 'block';
			} else {
				if (cards[i].classList.contains(category)) {
					cards[i].style.display = 'block';
				} else {
					cards[i].style.display = 'none';
				}
			}
		}
	}
</script>
</head>
<body>
	<h1></h1>
	<div class="welcome-container">
		<c:choose>
			<c:when test="${not empty sessionScope.member}">
				<p class="welcome-message">${sessionScope.member.name}님! 환영합니다!</p>
			</c:when>
			<c:otherwise>
				<p class="welcome-message">
					환영합니다! <a href="<c:url value='/jsp/login.jsp'/>">로그인</a> 또는 <a
						href="<c:url value='/jsp/register.jsp'/>">회원가입</a> 해주세요.
				</p>
			</c:otherwise>
		</c:choose>
	</div>

	<nav>
		<a href="#" onclick="showCategory('all')">전체카드</a> <a href="#"
			onclick="showCategory('credit')">신용카드</a> <a href="#"
			onclick="showCategory('check')">체크카드</a>
	</nav>
	<div class="card-container">
		<div class="card credit">
			<a href="<c:url value='/applyCard.do?cardId=1'/>"> <img
				src="<c:url value='/images/신용.Deep Oil.gif'/>" alt="Card 1">
				<p>KOM카드 Deep Oil</p>
			</a>
		</div>
		<div class="card credit">
			<a href="<c:url value='/applyCard.do?cardId=2'/>"> <img
				src="<c:url value='/images/신용.Eats More.gif'/>" alt="Card 2">
				<p>KOM카드 Eats More(이츠모아)</p>
			</a>
		</div>
		<div class="card credit">
			<a href="<c:url value='/applyCard.do?cardId=3'/>"> <img
				src="<c:url value='/images/신용.Globus.gif'/>" alt="Card 3">
				<p>KOM카드 Globus</p>
			</a>
		</div>
		<div class="card credit">
			<a href="<c:url value='/applyCard.do?cardId=4'/>"> <img
				src="<c:url value='/images/신용.YaY.gif'/>" alt="Card 4">
				<p>KOM카드 YaY</p>
			</a>
		</div>
		<div class="card credit">
			<a href="<c:url value='/applyCard.do?cardId=5'/>"> <img
				src="<c:url value='/images/신용.처음.gif'/>" alt="Card 5">
				<p>KOM카드 처음</p>
			</a>
		</div>
	</div>
	<div class="card-container">
		<div class="card check">
			<a href="<c:url value='/applyCard.do?cardId=6'/>"> <img
				src="<c:url value='/images/체크.Global+ 체크(월리를 찾아라).gif'/>"
				alt="Card 6">
				<p>KOM카드 Global+ 체크(월리를 찾아라)</p>
			</a>
		</div>
		<div class="card check">
			<a href="<c:url value='/applyCard.do?cardId=7'/>"> <img
				src="<c:url value='/images/체크.LG트윈스 KOM카드 체크.gif'/>" alt="Card 7">
				<p>LG트윈스 KOM카드 체크</p>
			</a>
		</div>
		<div class="card check">
			<a href="<c:url value='/applyCard.do?cardId=8'/>"> <img
				src="<c:url value='/images/체크.Pick E 체크 캐릭터형(가비지타임).gif'/>"
				alt="Card 8">
				<p>KOM카드 Pick E 체크 캐릭터형(가비지타임)</p>
			</a>
		</div>
		<div class="card check">
			<a href="<c:url value='/applyCard.do?cardId=9'/>"> <img
				src="<c:url value='/images/체크.트래블 체크.gif'/>" alt="Card 9">
				<p>KOM카드 Global+ 트래블 체크</p>
			</a>
		</div>
		<div class="card check">
			<a href="<c:url value='/applyCard.do?cardId=10'/>"> <img
				src="<c:url value='/images/체크.투썸플레이스 KOM카드 체크.gif'/>" alt="Card 10">
				<p>투썸플레이스 KOM카드 체크</p>
			</a>
		</div>
		<!-- 추가 카드 이미지 -->
	</div>
<!-- <div class="card-container">
		<c:forEach var="card" items="${cards}">
			<div class="card ${card.cardType}">
				<a href="<c:url value='/applyCard.do?cardId=${card.id}'/>"> 
					<img src="<c:url value='${card.imagePath}'/>" alt="Card ${card.id}">
					<p>${card.name}</p>
				</a>
			</div>
		</c:forEach>
	</div>
-->
</body>
</html>