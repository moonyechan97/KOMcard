<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>카드 결제</title>
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
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin-bottom: 5px;
            color: #555;
        }
        input, select, textarea {
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
        button {
            padding: 15px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>카드 결제</h2>
        <form action="<c:url value='/paymentProcess.do'/>" method="post">
            <label for="cardName">카드 선택</label>
            <select id="cardName" name="applyCd" required>
                <c:forEach var="card" items="${requestScope.cardList}">
                    <option value="${card.applyCd}">${card.name} ${card.accountNum }</option>
                </c:forEach>
            </select>

            <label for="merchantName">상호명</label>
            <input type="text" id="merchantName" name="merchantName" required>

            <label for="amount">결제 금액</label>
            <input type="number" id="amount" name="amount" required>

            <button type="submit">결제하기</button>
        </form>
    </div>
</body>
</html>