<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>카드 신청 완료</title>
<link rel="stylesheet" href="<c:url value='/css/styles.css'/>">
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
	background-color: #f0f0f0;
	margin: 0;
	padding: 0;
	display: flex;
	flex-direction: column;
	align-items: center;
	min-height: 100vh;
}

.container {
	max-width: 600px;
	margin: 20px auto;
	padding: 20px;
	background-color: white;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
	text-align: center;
}

h2 {
	color: #333;
	margin-bottom: 20px;
}

p {
	color: #666;
	margin-bottom: 20px;
}

a {
	display: inline-block;
	padding: 10px 20px;
	background-color: #007bff;
	color: white;
	text-decoration: none;
	border-radius: 5px;
}

a:hover {
	background-color: #0056b3;
}

/* Ensure header takes full width and doesn't interfere with flex layout */
header {
	width: 100%;
}
</style>
</head>
<body>
	<div class="container">
		<h2>카드 신청이 완료되었습니다!</h2>
		<p>신청해주셔서 감사합니다. 곧 처리되도록 하겠습니다.</p>
		<a href="<c:url value='/index.jsp'/>">메인으로 돌아가기</a>
	</div>
</body>
</html>