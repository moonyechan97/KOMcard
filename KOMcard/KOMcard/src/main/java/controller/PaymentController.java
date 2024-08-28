package controller;

import dao.CardDAO;
import dao.TransactionDAO;
import framework.Controller;
import kr.ac.kopo.vo.MemberVO;
import vo.CardVO;
import vo.ResponseApplyCardInfoVO;
import vo.TransactionVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.util.List;

public class PaymentController implements Controller {

    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        MemberVO memberVo = (MemberVO)request.getSession().getAttribute("member");
        String memberId = memberVo.getId();

        CardDAO cardDAO = new CardDAO();
        List<ResponseApplyCardInfoVO> cardList = cardDAO.getAllCardsByMemberId(memberId);
        request.setAttribute("cardList", cardList);
        
        return "/jsp/payment.jsp";
    }
}
