<%@page import="util.RedisUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 세션을 무효화하여 로그아웃 처리
    if (session != null) {
        session.invalidate();
    }
	// 레디스에서도 로그인 정보 삭제하여 로그아웃 처리
	RedisUtil redisUtil = new RedisUtil("172.31.9.182", 6379);
	redisUtil.deleteKey("loginUser");
    // index.jsp로 리디렉션
    response.sendRedirect(request.getContextPath() + "/index.jsp");
    return;
%>