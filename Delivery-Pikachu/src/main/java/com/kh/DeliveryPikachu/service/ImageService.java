package com.kh.DeliveryPikachu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.DeliveryPikachu.dao.MenuDao;
import com.kh.DeliveryPikachu.dao.StoreDao;
import com.kh.DeliveryPikachu.dto.MenuDto;

@Service
public class ImageService {

	@Autowired
	private StoreDao storeDao;

	@Autowired
	private MenuDao menuDao;

	// 가게사진주소 추가
	public String getStoreImgLink(int storeNo) {

		try {
			int attachNo = storeDao.findAttachNo(storeNo);
			return "/download?attachNo=" + attachNo;
		} catch (Exception e) {
			return "/image/store.png"; // 가게 기본이미지
		}
	}

	// 메뉴사진주소 추가
	public String getMenuImgLink(int menuNo) {

		try {
			int attachNo = menuDao.findAttachNo(menuNo);
			return "/download?attachNo=" + attachNo;
		} catch (Exception e) {
			return "/image/menu.png"; // 메뉴 기본이미지
		}
	}

	// 메뉴리스트에 사진주소추가
	public List<MenuDto> menuImageSetUpList() {
		List<MenuDto> list = menuDao.selectListAll();
		
		

		for (MenuDto dto : list) {
			String menuImgLink = getMenuImgLink(dto.getMenuNo());

			dto.setMenuImgLink(menuImgLink);
		}

		return list;
	}

}
