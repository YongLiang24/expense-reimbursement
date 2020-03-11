package com.yongliang.java;

public class Reimbursement implements Comparable<Reimbursement>{
	private int reimbId, empId;
	private String expenseType, expenseDescription;
	private String expenseCost;
	private String requestStatus;
	private String reimbAmount;
	private String dateTime;
	private String createdBy;
	public String getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	//default constructor
	public Reimbursement() {
		super();
	}
	//requests creation constructor
	public Reimbursement(int reimbId, int empId, String expenseType, String expenseDescription, String expenseCost,
			String requestStatus, String reimbAmount, String dateTime, String createdBy) {
		super();
		this.reimbId = reimbId;
		this.empId = empId;
		this.expenseType = expenseType;
		this.expenseDescription = expenseDescription;
		this.expenseCost = expenseCost;
		this.requestStatus = requestStatus;
		this.reimbAmount = reimbAmount;
		this.dateTime = dateTime;
		this.createdBy = createdBy;
		
	}
	public String getDateTime() {
		return dateTime;
	}
	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
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
	public String getExpenseCost() {
		return expenseCost;
	}
	public void setExpenseCost(String expenseCost) {
		this.expenseCost = expenseCost;
	}
	public String getRequestStatus() {
		return requestStatus;
	}
	public void setRequestStatus(String requestStatus) {
		this.requestStatus = requestStatus;
	}
	public String getReimbAmount() {
		return reimbAmount;
	}
	public void setReimbAmount(String reimbAmount) {
		this.reimbAmount = reimbAmount;
	}
	@Override
	public int compareTo(Reimbursement user) {
		return user.reimbId - this.reimbId;
	}
	
	

}
