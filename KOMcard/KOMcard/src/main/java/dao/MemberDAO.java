package dao;

import org.apache.ibatis.session.SqlSession;

import kr.ac.kopo.vo.MemberVO;

public class MemberDAO {

	private SqlSession session;

	public MemberDAO() {
		session = new MyBatisConfig().getInstance();
		System.out.println("session : " + session);
	}

	public MemberVO getMemberById(String id) {

		MemberVO member = session.selectOne("MemberMapper.getMemberById", id);

		return member;
	}

	public void signUp(MemberVO member) {
		session.selectOne("MemberMapper.insertMember", member);
		session.commit(); // 여기서 커밋을 해줘야 데이터가 실제로 삽입됩니다.
		session.close();
	}
}