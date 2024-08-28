package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.ApplyCardVO;
import vo.CardVO;
import vo.ResponseApplyCardInfoVO;

public class CardDAO {

	private SqlSession session;

	public CardDAO() {
		session = new MyBatisConfig().getInstance();
		System.out.println("session : " + session);
	}

	public List<CardVO> getAllcards() {
		List<CardVO> cards = session.selectList("CardMapper.getAllcards");
		session.close();
		return cards;
	}

	public CardVO getCardById(int id) {
		CardVO card = session.selectOne("CardMapper.getCardById", id);
		session.close();
		return card;
	}

	public void applyForCard(ApplyCardVO applyCard) {
		session.insert("CardMapper.applyForCard", applyCard);
		session.commit();
		session.close();
	}
	
	public List<ResponseApplyCardInfoVO> getAllCardsByMemberId(String memberId){
		return session.selectList("CardMapper.selectListCardsByMemberId", memberId);
	}
	
}