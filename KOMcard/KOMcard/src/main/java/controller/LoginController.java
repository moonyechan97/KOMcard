package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import framework.Controller;
import util.RedisUtil;
import kr.ac.kopo.vo.MemberVO;

public class LoginController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("id"); // 파라미터 이름을 문자열 상수로 전달
		String pwd = request.getParameter("pwd"); // 파라미터 이름을 문자열 상수로 전달

		MemberDAO memberDAO = new MemberDAO();

		MemberVO memberVo = memberDAO.getMemberById(id); // 사용자 정보를 가져오는 메서드 호출
		System.out.println("로그인 성공 : " + memberVo);
		
		if (memberVo != null && memberVo.getPwd().equals(pwd)) {
			RedisUtil redisUtil = new RedisUtil("172.31.9.182", 6379);
			redisUtil.saveObject("loginUser",memberVo);
			// 로그인 성공 시 처리
			request.getSession().setAttribute("member", memberVo); // 세션에 사용자 정보 저장
			System.out.println("세션에 저장 성공");
			// JavaScript로 로그인 성공 알림창 띄우기
			request.setAttribute("success", "로그인에 성공했습니다.");

			return "/index.jsp"; // 로그인 성공 후 메인 페이지로 리다이렉트
		} else {
			// 로그인 실패 시 처리
			request.setAttribute("error", "아이디 또는 비밀번호가 일치하지 않습니다.");
			return "/jsp/login.jsp"; // 로그인 페이지로 이동
		}
	}
}
