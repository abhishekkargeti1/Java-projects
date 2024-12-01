package com.entities;

public class UserDetails {
	
	private int id;
	private String userName;
	private String userEmail;
	private String userNumber;
	private String userAddress;
	private String userProfilePic;
	private String userDOB;
	
	
	

	public UserDetails() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UserDetails(String userName, String userEmail, String userNumber, String userAddress, String userProfilePic,
			String userDOB) {
		super();
		this.userName = userName;
		this.userEmail = userEmail;
		this.userNumber = userNumber;
		this.userAddress = userAddress;
		this.userProfilePic = userProfilePic;
		this.userDOB = userDOB;
	}
	
	
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserNumber() {
		return userNumber;
	}

	public void setUserNumber(String userNumber) {
		this.userNumber = userNumber;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserProfilePic() {
		return userProfilePic;
	}

	public void setUserProfilePic(String userProfilePic) {
		this.userProfilePic = userProfilePic;
	}

	public String getUserDOB() {
		return userDOB;
	}

	public void setUserDOB(String userDOB) {
		this.userDOB = userDOB;
	}


	@Override
	public String toString() {
		return "UserDetails [userName=" + userName + ", userEmail=" + userEmail + ", userNumber=" + userNumber
				+ ", userAddress=" + userAddress + ", userProfilePic=" + userProfilePic + ", userDOB=" + userDOB + "]";
	}


	

}
