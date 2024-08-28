<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>거래 내역</title>
    <link rel="stylesheet" href="<c:url value='/css/styles.css'/>">
    <style>
        .container {
            max-width: 800px;
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
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: left;
        }
        th {
            background-color: #f4f4f4;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>거래 내역</h2>
        <table>
            <thead>
                <tr>
                    <th>결제시간</th>
                    <th>카드이름</th>
                    <th>연결계좌</th>
                    <th>상호명</th>
                    <th>결제금액</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="transaction" items="${transactionList}">
                    <tr>
                        <td>${transaction.transactionTime}</td>
                        <td>${transaction.name}</td>
                        <td>${transaction.accountNum}</td>
                        <td>${transaction.merchantName}</td>
                        <td>${transaction.amount}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>