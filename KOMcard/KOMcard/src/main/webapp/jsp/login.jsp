<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="<c:url value='/css/styles.css'/>">
<style>
body {
    font-family: 'Noto Sans KR', sans-serif;
    background-color: #f0f0f0;
    margin: 0;
    padding: 0;
}

.container {
    max-width: 600px;
    margin: 20px auto;
    padding: 20px;
    background-color: white;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
    display: flex;
    flex-direction: column;
    align-items: center;
}

h2 {
    text-align: center;
    margin-bottom: 20px;
    color: #333;
}

form {
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 100%;
}

label {
    margin-bottom: 5px;
    color: #555;
    width: 100%;
    max-width: 400px;
    text-align: left;
}

.input-field {
    padding: 8px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 14px;
    width: 100%;
    max-width: 400px;
    box-sizing: border-box; /* 추가 */
}

button {
    padding: 10px;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
    width: 100%;
    max-width: 400px;
    box-sizing: border-box; /* 추가 */
}

button:hover {
    background-color: #0056b3;
}

.error {
    color: #ff0000;
    background-color: #ffe5e5;
    padding: 10px;
    border: 1px solid #ff0000;
    border-radius: 5px;
    margin-top: 15px;
    width: 100%;
    max-width: 400px;
    text-align: center;
}
</style>
</head>
<body>
<div class="container">
    <h2>로그인</h2>
    <form method="post" action="<c:url value='/login.do'/>">
        <label for="id">아이디:</label>
        <input type="text" id="id" name="id" class="input-field" required>
        <label for="pwd">패스워드:</label>
        <input type="password" id="pwd" name="pwd" class="input-field" required>
        <button type="submit">로그인</button>
    </form>
    <c:if test="${not empty error}">
        <p class="error">${error}</p>
    </c:if>
</div>
</body>
</html>