package controller;

import dao.AccountDAO;
import dao.CardDAO;
import framework.Controller;
import vo.AccountVO;
import vo.CardVO;
import kr.ac.kopo.vo.*;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ApplyCardController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		 // 로그인 여부 확인
        if (memberVO == null) {
            // 로그인되지 않은 경우 로그인 페이지로 리다이렉트
            return "/jsp/login.jsp";
        }
		
		request.setCharacterEncoding("utf-8");
		String cardId = request.getParameter("cardId");
		CardDAO cardDAO = new CardDAO();
		CardVO card = cardDAO.getCardById(Integer.parseInt(cardId));
		request.setAttribute("card", card);
		
		// 회원이 가지고 있는 계좌정보 넣어주기
		AccountDAO accountDAO = new AccountDAO();
		List<AccountVO> accountList = accountDAO.getAccountListByMember(memberVO.getId());
		request.setAttribute("accountList", accountList);
		
		return "/jsp/applyCard.jsp";
	}
}