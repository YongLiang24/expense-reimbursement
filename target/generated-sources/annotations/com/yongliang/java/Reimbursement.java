package com.yongliang.java;

public class Reimbursement {
	private int reimbId, empId;
	private String expenseType, expenseDescription;
	private int expenseCost;
	private String requestStatus;
	private int reimbAmount;
	//default constructor
	public Reimbursement() {
		super();
	}
	//requests creation constructor
	public Reimbursement(int reimbId, int empId, String expenseType, String expenseDescription, int expenseCost,
			String requestStatus, int reimbAmount) {
		super();
		this.reimbId = reimbId;
		this.empId = empId;
		this.expenseType = expenseType;
		this.expenseDescription = expenseDescription;
		this.expenseCost = expenseCost;
		this.requestStatus = requestStatus;
		this.reimbAmount = reimbAmount;
	}
	public int getReimbId() {
		return reimbId;
	}
	public void setReimbId(int reimbId) {
		this.reimbId = reimbId;
	}
	public int getEmpId() {
		return empId;
	}
	public void setEmpId(int empId) {
		this.empId = empId;
	}
	public String getExpenseType() {
		return expenseType;
	}
	public void setExpenseType(String expenseType) {
		this.expenseType = expenseType;
	}
	public String getExpenseDescription() {
		return expenseDescription;
	}
	public void setExpenseDescription(String expenseDescription) {
		this.expenseDescription = expenseDescription;
	}
	public int getExpenseCost() {
		return expenseCost;
	}
	public void setExpenseCost(int expenseCost) {
		this.expenseCost = expenseCost;
	}
	public String getRequestStatus() {
		return requestStatus;
	}
	public void setRequestStatus(String requestStatus) {
		this.requestStatus = requestStatus;
	}
	public int getReimbAmount() {
		return reimbAmount;
	}
	public void setReimbAmount(int reimbAmount) {
		this.reimbAmount = reimbAmount;
	}
	
	

}
