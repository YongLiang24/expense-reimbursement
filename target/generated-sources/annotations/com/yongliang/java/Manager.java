package com.yongliang.java;

public class Manager {
	private int managerId;
	private String managerAccount, managerPass;
	//default constructor
	public Manager() {
		super();
		// TODO Auto-generated constructor stub
	}
	//login constructor
	public Manager(int managerId, String managerAccount, String managerPass) {
		super();
		this.managerId = managerId;
		this.managerAccount = managerAccount;
		this.managerPass = managerPass;
	}
	public int getManagerId() {
		return managerId;
	}
	public void setManagerId(int managerId) {
		this.managerId = managerId;
	}
	public String getManagerAccount() {
		return managerAccount;
	}
	public void setManagerAccount(String managerAccount) {
		this.managerAccount = managerAccount;
	}
	public String getManagerPass() {
		return managerPass;
	}
	public void setManagerPass(String managerPass) {
		this.managerPass = managerPass;
	}
	
}
