package com.yongliang.java;

//POJO class for employee
public class Employee {
	private int empId;
	private String  empPass, fullName, telephone, email, street, city, state, zipcode, country;
	//default constructor
	public Employee() {
		super();
	}
	//login constructor using email and password
	public Employee(int empId, String empPass, String email) {
		super();
		this.empId = empId;
		this.empPass = empPass;
		this.email = email;
	}
	//personal information constructor
	public Employee(String fullName, String telephone, String email, String street, String city, String state,
			String zipcode, String country) {
		super();
		this.fullName = fullName;
		this.telephone = telephone;
		this.email = email;
		this.street = street;
		this.city = city;
		this.state = state;
		this.zipcode = zipcode;
		this.country = country;
	}
	
	
	public Employee(int empId, String empPass, String fullName, String telephone, String email, String street,
			String city, String state, String zipcode, String country) {
		super();
		this.empId = empId;
		this.empPass = empPass;
		this.fullName = fullName;
		this.telephone = telephone;
		this.email = email;
		this.street = street;
		this.city = city;
		this.state = state;
		this.zipcode = zipcode;
		this.country = country;
	}
	public Employee(int empId,  String fullName, String telephone, String email, String street,
			String city, String state, String zipcode, String country) {
		super();
		this.empId = empId;
		this.fullName = fullName;
		this.telephone = telephone;
		this.email = email;
		this.street = street;
		this.city = city;
		this.state = state;
		this.zipcode = zipcode;
		this.country = country;
	}
	
	public int getEmpId() {
		return empId;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
	}


	public String getEmpPass() {
		return empPass;
	}

	public void setEmpPass(String empPass) {
		this.empPass = empPass;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}
	
	

}
