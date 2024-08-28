package vo;

public class ResponseTransactionVO {

	private int transactionId;
	private String memberId;
	private int applyCd;
	private String transactionTime;
	private String merchantName;
	private int amount;
	private String name;
	private String accountNum;
	public int getTransactionId() {
		return transactionId;
	}
	public void setTransactionId(int transactionId) {
		this.transactionId = transactionId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getApplyCd() {
		return applyCd;
	}
	public void setApplyCd(int applyCd) {
		this.applyCd = applyCd;
	}
	public String getTransactionTime() {
		return transactionTime;
	}
	public void setTransactionTime(String transactionTime) {
		this.transactionTime = transactionTime;
	}
	public String getMerchantName() {
		return merchantName;
	}
	public void setMerchantName(String merchantName) {
		this.merchantName = merchantName;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAccountNum() {
		return accountNum;
	}
	public void setAccountNum(String accountNum) {
		this.accountNum = accountNum;
	}
	@Override
	public String toString() {
		return "ResponseTransactionVO [transactionId=" + transactionId + ", memberId=" + memberId + ", applyCd="
				+ applyCd + ", transactionTime=" + transactionTime + ", merchantName=" + merchantName + ", amount="
				+ amount + ", name=" + name + ", accountNum=" + accountNum + "]";
	}
	
	
	
	
}
