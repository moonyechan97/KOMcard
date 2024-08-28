package vo;

public class AccountVO {

	private String accountNum;
	private String memberId;
	private long balance;
	private String accountType;
	private String regDate;
	private String accountPwd;
	public String getAccountNum() {
		return accountNum;
	}
	public void setAccountNum(String accountNum) {
		this.accountNum = accountNum;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public long getBalance() {
		return balance;
	}
	public void setBalance(long balance) {
		this.balance = balance;
	}
	public String getAccountType() {
		return accountType;
	}
	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getAccountPwd() {
		return accountPwd;
	}
	public void setAccountPwd(String accountPwd) {
		this.accountPwd = accountPwd;
	}
	@Override
	public String toString() {
		return "AccountVO [accountNum=" + accountNum + ", memberId=" + memberId + ", balance=" + balance
				+ ", accountType=" + accountType + ", regDate=" + regDate + ", accountPwd=" + accountPwd + "]";
	}
	
	
	
	
}
