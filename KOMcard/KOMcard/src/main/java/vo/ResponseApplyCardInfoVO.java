package vo;

public class ResponseApplyCardInfoVO {

	private int applyCd;
	private int cardId;
	private String memberId;
	private String accountNum;
	private String name;
	public int getApplyCd() {
		return applyCd;
	}
	public void setApplyCd(int applyCd) {
		this.applyCd = applyCd;
	}
	public int getCardId() {
		return cardId;
	}
	public void setCardId(int cardId) {
		this.cardId = cardId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getAccountNum() {
		return accountNum;
	}
	public void setAccountNum(String accountNum) {
		this.accountNum = accountNum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "ResponseApplyCardInfoVO [applyCd=" + applyCd + ", cardId=" + cardId + ", memberId=" + memberId
				+ ", accountNum=" + accountNum + ", name=" + name + "]";
	}
	
}
