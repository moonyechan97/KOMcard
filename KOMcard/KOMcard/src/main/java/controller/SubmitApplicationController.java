package controller;

import dao.CardDAO;
import framework.Controller;
import vo.ApplyCardVO;
import kr.ac.kopo.vo.MemberVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SubmitApplicationController implements Controller {

    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	
    	request.setCharacterEncoding("utf-8");
    	
    	HttpSession session = request.getSession();
    	MemberVO memberVO = (MemberVO)session.getAttribute("member");
    	System.out.println(memberVO);
    	
    	String accountNum = request.getParameter("accountNum");
        String cardId = request.getParameter("cardId");
        String memberId = memberVO.getId();
        

        ApplyCardVO applyCard = new ApplyCardVO();
        applyCard.setCardId(Integer.parseInt(cardId));
        applyCard.setMemberId(memberId);
        applyCard.setAccountNum(accountNum);
        
        System.out.println(applyCard);
       
        CardDAO cardDAO = new CardDAO();
        cardDAO.applyForCard(applyCard);

        return "/jsp/applicationSuccess.jsp";
    }
}