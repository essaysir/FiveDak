package semiproject.dak.member.model;

public class MembershipTierDTO {
	
	
	private int tierId; 
	private String tierName;
	private int amountNeeded;
	private int rewardPercentage;
	private String tierImage;
	private String nextTierName;
	private int nextTierNeeded;
	
	public String getNextTierName() {
		return nextTierName;
	}
	public void setNextTierName(String nextTierName) {
		this.nextTierName = nextTierName;
	}
	public int getNextTierNeeded() {
		return nextTierNeeded;
	}
	public void setNextTierNeeded(int nextTierNeeded) {
		this.nextTierNeeded = nextTierNeeded;
	}
	public int getTierId() {
		return tierId;
	}
	public void setTierId(int tierId) {
		this.tierId = tierId;
	}
	public String getTierName() {
		return tierName;
	}
	public void setTierName(String tierName) {
		this.tierName = tierName;
	}
	public int getAmountNeeded() {
		return amountNeeded;
	}
	public void setAmountNeeded(int amountNeeded) {
		this.amountNeeded = amountNeeded;
	}
	public int getRewardPercentage() {
		return rewardPercentage;
	}
	public void setRewardPercentage(int rewardPercentage) {
		this.rewardPercentage = rewardPercentage;
	}
	public String getTierImage() {
		return tierImage;
	}
	public void setTierImage(String tierImage) {
		this.tierImage = tierImage;
	}

}
