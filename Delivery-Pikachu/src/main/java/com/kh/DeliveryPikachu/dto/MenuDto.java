package com.kh.DeliveryPikachu.dto;

public class MenuDto {
	
	private int menuNo;
	private int storeNo;
	private String menuName;
	private int menuPrice;
	
	private String menuImgLink;
	
	
	
	public String getMenuImgLink() {
		return menuImgLink;
	}
	public void setMenuImgLink(String menuImgLink) {
		this.menuImgLink = menuImgLink;
	}
	
	public MenuDto() {
		super();
	}
	public int getMenuNo() {
		return menuNo;
	}
	public void setMenuNo(int menuNo) {
		this.menuNo = menuNo;
	}
	public int getStoreNo() {
		return storeNo;
	}
	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public int getMenuPrice() {
		return menuPrice;
	}
	public void setMenuPrice(int menuPrice) {
		this.menuPrice = menuPrice;
	}

	
}
