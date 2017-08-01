package com.cupbob.dto;

public class TmpBasketDTO {
	private String tmpBasketPrdtNo;
	private String tmpBasketPrdtQty;
	private String tmpBasketPrdtPrice;
	public TmpBasketDTO(){}
	
	public TmpBasketDTO(String tmpBasketPrdtNo, String tmpBasketPrdtQty, String tmpBasketPrice){
		this.tmpBasketPrdtNo = tmpBasketPrdtNo;
		this.tmpBasketPrdtQty = tmpBasketPrdtQty;
		this.tmpBasketPrdtPrice = tmpBasketPrice;
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
