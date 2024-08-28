package controller;

import dao.MemberDAO;
import framework.Controller;
import kr.ac.kopo.vo.MemberVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id"); // 파라미터 이름을 문자열 상수로 전달
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String personalNum = request.getParameter("personalNum"); // 파라미터 이름을 문자열 상수로 전달
		String hp = request.getParameter("hp");

		MemberVO member = new MemberVO();

		member.setId(id);
		member.setPwd(pwd);
		member.setName(name);
		member.setPersonalNum(personalNum);
		member.setHp(hp);

		MemberDAO memberDAO = new MemberDAO();

		memberDAO.signUp(member);
		return "/jsp/login.jsp";
	}
}