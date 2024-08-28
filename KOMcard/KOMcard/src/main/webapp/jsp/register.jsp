<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Register</title>
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

.input-field, button {
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
    background-color: #007bff;
    color: white;
    border: none;
    font-size: 16px;
    cursor: pointer;
}

button:hover {
    background-color: #0056b3;
}

.form-group {
    width: 100%;
    max-width: 400px;
    margin-bottom: 15px;
    text-align: left;
}

.checkbox-container {
    display: flex;
    align-items: center;
    margin-top: 10px;
    justify-content: flex-start; /* 왼쪽 정렬 */
}

.checkbox-container span {
    margin-right: 10px;
}

.checkbox-container input {
    margin-left: 10px;
}
</style>

</head>
<body>
    <div class="container">
        <h2>회원가입</h2>
        <form method="post" action="<c:url value='/register.do'/>">
            <label for="id">아이디:</label> 
            <input type="text" id="id" name="id" class="input-field" required> 
            
            <label for="pwd">패스워드:</label> 
            <input type="password" id="pwd" name="pwd" class="input-field" required> 
            
            <label for="name">이름:</label> 
            <input type="text" id="name" name="name" class="input-field" required> 
            
            <label for="personal_num">주민등록번호:</label> 
            <input type="text" id="personal_num" name="personalNum" class="input-field" required> 
            
            <label for="hp">핸드폰번호:</label> 
            <input type="text" id="hp" name="hp" class="input-field" required>
            
            <div class="form-group">
                <h3 style="text-align: center;">회원가입 안내사항</h3>
                <p style="color: black;">
                    KOM 금융그룹에 가입하면 KOM은행, KOM카드, KOM증권에 회원 정보가 공유됩니다. 회원 정보는 안전하게 관리되며, 금융상품 및 서비스 제공을 위해 사용됩니다. 가입 시 제공된 정보는 KOM 금융그룹의 모든 계열사에서 통합 관리되며, 최적의 금융 혜택을 제공하기 위해 활용됩니다. 회원님의 정보는 관련 법규에 따라 엄격하게 보호되며, 타사와는 절대 공유되지 않습니다. 다양한 금융 서비스와 혜택을 경험하시기 위해 KOM 금융그룹의 회원이 되어 주세요. 회원님의 신뢰를 바탕으로 더 나은 금융 서비스를 제공할 것을 약속드립니다.
                </p>
                <label class="checkbox-container" style="color: black;">
                    <span>회원가입 안내사항을 읽었으며, 이에 동의합니다.</span>
                    <input type="checkbox" id="terms" name="terms" required> 
                </label>
            </div>
            <button type="submit">회원가입</button>
        </form>
    </div>
</body>
</html>