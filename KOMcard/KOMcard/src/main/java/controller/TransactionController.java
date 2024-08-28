package controller;

import dao.TransactionDAO;
import framework.Controller;
import kr.ac.kopo.vo.MemberVO;
import vo.ResponseTransactionVO;
import vo.TransactionVO;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TransactionController implements Controller {

    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
    		MemberVO memberVo = (MemberVO)request.getSession().getAttribute("member");
    		String memberId = memberVo.getId();
     
    	  String month = request.getParameter("month");

          TransactionDAO transactionDAO = new TransactionDAO();
          List<ResponseTransactionVO> transactionList = transactionDAO.getAllTransactionByMemberId(memberId);
          
          request.setAttribute("transactionList", transactionList);
          
          return "/jsp/transaction.jsp";
      }
  }