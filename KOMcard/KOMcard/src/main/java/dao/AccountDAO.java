package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.AccountVO;
import vo.TransactionVO;
import kr.ac.kopo.vo.MemberVO;

public class AccountDAO {

	private SqlSession session;

	public AccountDAO() {
		session = new MyBatisConfig().getInstance();
		System.out.println("session : " + session);
	}

	public List<AccountVO> getAccountListByMember(String id) {

		List<AccountVO> accountList = session.selectList("AccountMapper.selectListAccountListById", id);

		return accountList;
	}
	
	public void updateBalance(TransactionVO transactionVO) {
		session.update("AccountMapper.updateBalance", transactionVO);
		AccountVO accountVO = session.selectOne("AccountMapper.selectOneAccount", transactionVO);
		transactionVO.setBalance(accountVO.getBalance());
		session.insert("AccountMapper.insertAccountHistory", transactionVO);
		session.commit();
	}

	
}