package com.kh.DeliveryPikachu.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.DeliveryPikachu.dao.StoreDao;
import com.kh.DeliveryPikachu.dto.StoreDto;
import com.kh.DeliveryPikachu.service.AttachService;

@Controller
@RequestMapping("/store")
public class StoreController {

	@Autowired
	private AttachService attachService;
	@Autowired
	private StoreDao storeDao;

	// 가게 등록
	@GetMapping("/insert")
	public String insert() {
		return "/WEB-INF/views/store/insert.jsp";
	}

	@PostMapping("/insert")
	public String insert(@ModelAttribute StoreDto storeDto, @RequestParam MultipartFile attach)
			throws IllegalStateException, IOException {

		storeDao.insert(storeDto);

		if (!attach.isEmpty()) {
			int attachNo = attachService.save(attach);
			storeDao.connect(storeDto.getStoreNo(), attachNo);
		}
		return "redirect:insertFinish";
	}

	@RequestMapping("/insertFinish") // 등록 완료페이지
	public String insertFinish() {
		return "/WEB-INF/views/store/insertFinish.jsp";
	}
}
