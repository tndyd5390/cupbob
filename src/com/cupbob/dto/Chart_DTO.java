package com.cupbob.dto;

public class Chart_DTO {
	private String prdt_name;
	private String count;
	private String reg_dt;
	private String prdt_no;
	private String price;
	private String male_count;
	private String female_count;
	
	
	public String getPrdt_no() {
		return prdt_no;
	}
	public void setPrdt_no(String prdt_no) {
		this.prdt_no = prdt_no;
	}
	public String getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}
	public String getPrdt_name() {
		return prdt_name;
	}
	public void setPrdt_name(String prdt_name) {
		this.prdt_name = prdt_name;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getMale_count() {
		return male_count;
	}
	public void setMale_count(String male_count) {
		this.male_count = male_count;
	}
	public String getFemale_count() {
		return female_count;
	}
	public void setFemale_count(String female_count) {
		this.female_count = female_count;
	}
}
