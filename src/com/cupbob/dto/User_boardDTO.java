package com.cupbob.dto;

public class User_boardDTO {
	private String post_no;
	private String user_no;
	private String title;
	private String contents;
	private String view_cnt;
	private String reg_user_no;
	private String reg_dt;
	private String chg_user_no;
	private String chg_dt;
	private String email;
	private String[] allCheck;
	private String user_name;
	private String readmore;
	
	public String getReadmore() {
		return readmore;
	}
	public void setReadmore(String readmore) {
		this.readmore = readmore;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	
	public String[] getAllCheck() {
		return allCheck;
	}
	public void setAllCheck(String[] allCheck) {
		this.allCheck = allCheck;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPost_no() {
		return post_no;
	}
	public void setPost_no(String post_no) {
		this.post_no = post_no;
	}
	public String getUser_no() {
		return user_no;
	}
	public void setUser_no(String user_no) {
		this.user_no = user_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getView_cnt() {
		return view_cnt;
	}
	public void setView_cnt(String view_cnt) {
		this.view_cnt = view_cnt;
	}
	public String getReg_user_no() {
		return reg_user_no;
	}
	public void setReg_user_no(String reg_user_no) {
		this.reg_user_no = reg_user_no;
	}
	public String getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}
	public String getChg_user_no() {
		return chg_user_no;
	}
	public void setChg_user_no(String chg_user_no) {
		this.chg_user_no = chg_user_no;
	}
	public String getChg_dt() {
		return chg_dt;
	}
	public void setChg_dt(String chg_dt) {
		this.chg_dt = chg_dt;
	}
}
