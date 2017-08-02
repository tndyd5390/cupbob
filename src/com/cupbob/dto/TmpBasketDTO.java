package com.cupbob.dto;

public class TmpBasketDTO {
	private String tmpBasketPrdtNo;
	private String tmpBasketPrdtQty;
	private String tmpBasketPrdtPrice;
	private String tmpBasketPrdtName;
	public TmpBasketDTO(){}
	
	public TmpBasketDTO(String tmpBasketPrdtNo, String tmpBasketPrdtQty, String tmpBasketPrice, String tmpBasketPrdtName){
		this.tmpBasketPrdtNo = tmpBasketPrdtNo;
		this.tmpBasketPrdtQty = tmpBasketPrdtQty;
		this.tmpBasketPrdtPrice = tmpBasketPrice;
		this.tmpBasketPrdtName = tmpBasketPrdtName;
	}
	
	public String getTmpBasketPrdtName() {
		return tmpBasketPrdtName;
	}

	public void setTmpBasketPrdtName(String tmpBasketPrdtName) {
		this.tmpBasketPrdtName = tmpBasketPrdtName;
	}

	public String getTmpBasketPrdtPrice() {
		return tmpBasketPrdtPrice;
	}

	public void setTmpBasketPrdtPrice(String tmpBasketPrdtPrice) {
		this.tmpBasketPrdtPrice = tmpBasketPrdtPrice;
	}

	public String getTmpBasketPrdtNo() {
		return tmpBasketPrdtNo;
	}
	public void setTmpBasketPrdtNo(String tmpBasketPrdtNo) {
		this.tmpBasketPrdtNo = tmpBasketPrdtNo;
	}
	public String getTmpBasketPrdtQty() {
		return tmpBasketPrdtQty;
	}
	public void setTmpBasketPrdtQty(String tmpBasketPrdtQty) {
		this.tmpBasketPrdtQty = tmpBasketPrdtQty;
	}
}
