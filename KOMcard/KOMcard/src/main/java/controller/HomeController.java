package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import framework.Controller;
import kr.ac.kopo.vo.*;
import util.RedisUtil;

public class HomeController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		RedisUtil redisUtil = new RedisUtil("172.31.9.182", 6379);
		MemberVO redisMember = (MemberVO) redisUtil.getObject("loginUser");
		
		HttpSession session = request.getSession();
		
		if (redisMember == null) {
			session.invalidate();
		} else {
			session.setAttribute("member", redisMember);
		}
		
		return "/index.jsp";
	}
	
	
	
}
