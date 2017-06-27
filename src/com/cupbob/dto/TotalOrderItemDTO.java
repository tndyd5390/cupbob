package com.cupbob.dto;

public class TotalOrderItemDTO {
	private String prdt_name;
	private String prdt_price;
	private String ord_amnt;
	public String getPrdt_name() {
		return prdt_name;
	}
	public void setPrdt_name(String prdt_name) {
		this.prdt_name = prdt_name;
	}
	public String getPrdt_price() {
		return prdt_price;
	}
	public void setPrdt_price(String prdt_price) {
		this.prdt_price = prdt_price;
	}
	public String getOrd_amnt() {
		return ord_amnt;
	}
	public void setOrd_amnt(String ord_amnt) {
		this.ord_amnt = ord_amnt;
	}
}
