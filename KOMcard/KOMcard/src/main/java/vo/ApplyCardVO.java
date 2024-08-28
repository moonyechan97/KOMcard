package vo;

public class ApplyCardVO {
	private int applyCd;
	private int cardId;
	private String memberId;
	private String accountNum;
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
	@Override
	public String toString() {
		return "ApplyCardVO [applyCd=" + applyCd + ", cardId=" + cardId + ", memberId=" + memberId + ", accountNum="
				+ accountNum + "]";
	}
	
	
}