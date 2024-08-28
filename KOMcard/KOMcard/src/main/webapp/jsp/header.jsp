<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>KOM카드</title>
    <link rel="stylesheet" href="<c:url value='/css/styles.css'/>">
    <script>
        function openLinkAndReset(select) {
            var url = select.value;
            select.selectedIndex = 0; // 선택된 옵션을 초기값으로 변경
            location.href=url;
        }
    </script>
    <style>
        /* Additional styles for the select element */
        select#externalLinks {
            width: auto; /* Adjust the width to fit content */
            padding-right: 20px; /* Add padding to the right */
        }
    </style>
</head>
<body>
<header>
    <h1>KOM카드</h1>
    <nav>
        <a href="<c:url value='/index.jsp'/>">홈</a>
        <c:choose>
            <c:when test="${sessionScope.member ne null}">
                <a href="<c:url value='/payment.do'/>">카드결제</a>
                <a href="<c:url value='/transaction.do'/>">이용내역</a>
                <a href="<c:url value='/jsp/logout.jsp'/>">로그아웃</a>
            </c:when>
            <c:otherwise>
                <a href="<c:url value='/jsp/login.jsp'/>">로그인</a>
                <a href="<c:url value='/jsp/register.jsp'/>">회원가입</a>
            </c:otherwise>
        </c:choose>
        <select id="externalLinks" onchange="openLinkAndReset(this);">
            <option value="#">Family Site</option>
            <option value="http://172.31.9.182:8080/Stock-System-WEB/getOneStock.do">KOM증권</option>
            <option value="http://172.31.9.179:8081/banking/bingo/banking.do">KOM은행</option>
            <option value="http://172.31.9.182:8080/kom_finance_project/index.jsp">통합사이트</option>
        </select>
    </nav>
</header>
</body>
</html>