package controller;

import dao.CardDAO;
import framework.Controller;
import vo.CardVO;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CardController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        CardDAO cardDAO = new CardDAO();
        List<CardVO> cards = cardDAO.getAllcards();
        request.setAttribute("cards", cards);
        return "/index.jsp";
	}
}