<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>카드 신청</title>
    <link rel="stylesheet" href="<c:url value='/css/styles.css'/>">
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }
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
        .card-info {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-bottom: 20px;
        }
        .card-info img {
            width: 200px;
            height: 150px;
            border-radius: 5px;
            margin-bottom: 10px;
            transition: transform 0.3s;
        }
        .card-info img:hover {
            transform: scale(1.2);
        }
        .card-details {
            text-align: center;
        }
        .card-details h3 {
            margin: 0;
            font-size: 24px;
            color: #333;
        }
        .card-details p {
            margin: 5px 0;
            color: #666;
        }
        form {
            display: flex;
            flex-direction: column;
            align-items: stretch;
        }
        label {
            margin-bottom: 5px;
            color: #555;
            width: 100%;
        }
        input, select, textarea {
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            width: 100%;
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
        .form-step {
            display: none;
        }
        .form-step.active {
            display: block;
        }
        .agreement-section {
            text-align: left;
            width: 100%;
            margin-bottom: 20px;
        }
        .agreement-section h2 {
            margin: 10px 0;
            color: #333;
        }
        .agreement-section ul {
            list-style: none;
            padding: 0;
            margin: 0;
            text-align: left; /* 왼쪽 정렬 */
        }
        .agreement-section ul li {
            margin-bottom: 10px;
            display: flex;
            align-items: center;
            text-align: left; /* 왼쪽 정렬 */
        }
        .agreement-section ul li input[type="checkbox"] {
            margin-right: 10px;
        }
        .centered-buttons {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }
        .centered-buttons button {
            margin: 0 10px;
        }
        .left-align {
            text-align: left;
        }
        .conditional-input {
            display: none;
        }
    </style>
    <script>
        function maskPersonalNum(personalNum) {
            var tmp = personalNum.substr(0, 6) + '-' + personalNum.charAt(6) + '******';
            return tmp;
        }

        function validateForm() {
            var agree = document.getElementById('agree').checked;
            if (!agree) {
                alert('카드 발급 동의사항에 동의해 주세요.');
                return false;
            }
            return true;
        }

        function showNextStep(currentStep, nextStep) {
            document.getElementById(currentStep).classList.remove('active');
            document.getElementById(nextStep).classList.add('active');
        }

        function validateStep1() {
            if (!document.getElementById('agree1').checked) {
                alert('필수사항은 동의 해야 합니다.');
                return false;
            }
            if (!document.getElementById('agree2').checked) {
                alert('필수사항은 동의 해야 합니다.');
                return false;
            }
            if (!document.getElementById('agree3').checked) {
                alert('필수사항은 동의 해야 합니다.');
                return false;
            }
            if (!document.getElementById('agree4').checked) {
                alert('필수사항은 동의 해야 합니다.');
                return false;
            }
            if (!document.getElementById('agree5').checked) {
                alert('필수사항은 동의 해야 합니다.');
                return false;
            }

            var cardType = document.getElementById('cardType').value;
            if (cardType === 'CREDIT') {
                if (document.getElementById('annualIncome').value === 'under_6M') {
                    alert('연소득 600만원 이하는 신청 불가');
                    return false;
                }
                if (document.getElementById('annualIncome').value === '') {
                    alert('연소득을 입력하세요');
                    return false;
                }
                if (document.getElementById('creditScore').value === 'under_500') {
                    alert('신용점수 500점 미만은 신청 불가');
                    return false;
                }
                if (document.getElementById('creditScore').value === '') {
                    alert('신용점수를 입력하세요');
                    return false;
                }
            }
            return true;
        }

        function agreeAllBtnClk() {
            var form = document.getElementById('applyForm');
            var checkboxes = form.querySelectorAll('input[type="checkbox"]');
            var allChecked = true;

            checkboxes.forEach(function(checkbox) {
                if (!checkbox.checked) {
                    allChecked = false;
                }
            });

            checkboxes.forEach(function(checkbox) {
                checkbox.checked = !allChecked;
            });
        }

        function toggleConditionalInputs() {
            var cardType = document.getElementById('cardType').value;
            var conditionalInputs = document.querySelectorAll('.conditional-input');
            if (cardType === 'CREDIT') {
                conditionalInputs.forEach(function(input) {
                    input.style.display = 'block';
                });
            } else {
                conditionalInputs.forEach(function(input) {
                    input.style.display = 'none';
                });
            }
        }
        
        window.onload = toggleConditionalInputs;
    </script>
</head>
<body>
    <div class="container">
        <h2>카드 신청</h2>
        <div class="card-info">
            <img src="<c:url value='${card.imagePath}'/>" alt="${card.name}">
            <div class="card-details">
                <h3>${card.name}</h3>
                <p>${card.description}</p>
            </div>
        </div>
        <form action="<c:url value='/submitApplication.do'/>" method="post" id="applyForm">
            <input type="hidden" name="cardId" value="${card.id}">
            <input type="hidden" id="cardType" name="cardType" value="${card.cardType}">
            <div id="step1" class="form-step active">
                <label for="personalNum">주민등록번호</label>
                <input type="text" id="personalNum" name="personalNum" value="${sessionScope.member.personalNum}" readonly>
                <script>
                    document.getElementById('personalNum').value = maskPersonalNum('${sessionScope.member.personalNum}');
                </script>
                <label for="name">이름</label>
                <input type="text" id="name" name="name" value="${sessionScope.member.name}" readonly>
                <label for="phone">전화번호</label>
                <input type="tel" id="hp" name="phone" required>
                
                <div class="agreement-section left-align">
                    <h2>카드발급 관련 동의사항</h2>
                    <div class="centered-buttons">
                        <button type="button" class="agree-all" id="agree-all-btn" onclick="agreeAllBtnClk()">전체 동의합니다</button>
                    </div>
                    <h2>개인(신용)정보 필수적 동의</h2>
                    <ul>
                        <li><input type="checkbox" id="agree1"><label for="agree1">개인(신용)정보 필수 수집 · 이용에 관한 동의(필수)</label></li>
                        <li><input type="checkbox" id="agree2"><label for="agree2">개인(신용)정보 필수 조회에 관한 동의(필수)</label></li>
                        <li><input type="checkbox" id="agree3"><label for="agree3">개인(신용)정보 필수 제공에 관한 동의(필수)</label></li>
                        <li><input type="checkbox" id="agree4"><label for="agree4">개인(신용)정보 필수적 제공 제3자에 관한사항 동의(상품서비스 제공)(필수)</label></li>
                    </ul>
                    <h2>카드발급 관련 개인(신용)정보 동의</h2>
                    <ul>
                        <li><input type="checkbox" id="agree5"><label for="agree5">공공 마이데이터 개인(신용)정보 수집 · 이용 · 제공 · 조회 동의(필수)</label></li>
                        <li><input type="checkbox" id="agree6"><label for="agree6">신용평가기관 정보활용 신청정보 제공자동조회(선택)</label></li>
                    </ul>
                    <h2>카드신청 미완료 시 연락을 위한 동의(선택)</h2>
                    <ul>
                        <li><input type="checkbox" id="agree7"><label for="agree7">시스템 장애 및 신청 미완료 시 상담원 전화연락 전화를 위해 개인정보 수집 · 이용에 동의합니다.</label></li>
                        <li><input type="checkbox" id="agree8"><label for="agree8">고유식별정보 수집 · 이용 동의</label></li>
                        <li><input type="checkbox" id="agree9"><label for="agree9">개인정보 수집 · 이용 동의</label></li>
                    </ul>
                    <h2>상품설명 강화 안내</h2>
                    <ul>
                        <li><input type="checkbox" id="agree10"><label for="agree10">카드상품, 은퇴자, 주부 등에게 기타이익이설 등 상품설명 강화안내(선택)</label></li>
                    </ul>
                </div>
                <div class="conditional-input">
                    <label for="annualIncome">연소득:</label>
                    <select id="annualIncome" name="annualIncome">
                        <option value="">선택하세요</option>
                        <option value="over_100M">1억원 초과</option>
                        <option value="over_50M_to_100M">5,000만원 초과~1억원</option>
                        <option value="over_6M_to_50M">600만원 초과~5,000만원</option>
                        <option value="under_6M">600만원 이하</option>
                    </select><br>
                    <label for="creditScore">신용점수:</label>
                    <select id="creditScore" name="creditScore">
                        <option value="">선택하세요</option>
                        <option value="over_700">700점 초과</option>
                        <option value="over_500_to_700">500점 초과~700점</option>
                        <option value="under_500">500점 이하</option>
                    </select><br>
                </div>
                <div class="centered-buttons">
                    <button type="button" onclick="if(validateStep1()) showNextStep('step1', 'step2')">다음</button>
                </div>
            </div>
            <div id="step2" class="form-step">
                <label for="account_Num">계좌번호:</label>
                <select name="accountNum">
                    <c:forEach items="${requestScope.accountList }" var="account">
                        <option value="${account.accountNum }">${account.accountNum }</option>
                    </c:forEach>
                </select>
                <div class="centered-buttons">
                    <button type="submit" onclick="return validateForm()">카드 신청</button>
                </div>
            </div>
        </form>
    </div>
</body>
</html>