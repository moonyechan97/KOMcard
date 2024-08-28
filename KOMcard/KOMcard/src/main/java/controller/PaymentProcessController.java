package controller;

import dao.AccountDAO;
import dao.TransactionDAO;
import framework.Controller;
import kr.ac.kopo.vo.MemberVO;
import vo.ResponseTransactionVO;
import vo.TransactionVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.util.List;

public class PaymentProcessController implements Controller {

    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");
        int applyCd = Integer.parseInt(request.getParameter("applyCd"));
        String merchantName = request.getParameter("merchantName");
        int amount = Integer.parseInt(request.getParameter("amount"));
        
        MemberVO memberVo = (MemberVO)request.getSession().getAttribute("member");
        String memberId = memberVo.getId();

        TransactionVO transaction = new TransactionVO();
        transaction.setApplyCd(applyCd);
        transaction.setMerchantName(merchantName);
        transaction.setAmount(amount);
        transaction.setMemberId(memberId);

        TransactionDAO transactionDAO = new TransactionDAO();
        transactionDAO.saveTransaction(transaction);
        
        AccountDAO accountDAO = new AccountDAO();
        accountDAO.updateBalance(transaction);
        
        return "/transaction.do";
    }
}
