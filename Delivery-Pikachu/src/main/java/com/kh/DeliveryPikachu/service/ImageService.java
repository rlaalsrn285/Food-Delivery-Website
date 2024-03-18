package com.kh.DeliveryPikachu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.DeliveryPikachu.dao.StoreDao;

@Service
public class ImageService {

	@Autowired
	private StoreDao storeDao;
	
	//attachNo찾은후 가게사진주소 반환
	public String getStoreImgLink(int storeNo) {
		
		try {
			int attachNo = storeDao.findAttachNo(storeNo);
			return "/download?attachNo=" + attachNo;
		}
		catch(Exception e) {
			return "/image/store.png"; 
		}
	}
	
	
	
	
}
