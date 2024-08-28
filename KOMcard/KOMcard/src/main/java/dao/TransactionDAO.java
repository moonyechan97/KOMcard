package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.ResponseTransactionVO;
import vo.TransactionVO;

public class TransactionDAO {

	private SqlSession session;

	public TransactionDAO() {
		session = new MyBatisConfig().getInstance();
		System.out.println("session : " + session);
	}

	public void saveTransaction(TransactionVO transaction) {
		session.insert("TransactionMapper.saveTransaction", transaction);
		session.commit();
	}
	
	public List<ResponseTransactionVO> getAllTransactionByMemberId(String memberId){
		return session.selectList("TransactionMapper.selectListTransactionByMemberId", memberId);
	}
	
}