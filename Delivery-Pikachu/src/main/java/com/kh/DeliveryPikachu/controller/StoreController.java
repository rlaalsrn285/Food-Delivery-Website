package com.kh.DeliveryPikachu.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.DeliveryPikachu.dao.StoreDao;
import com.kh.DeliveryPikachu.dto.StoreDto;
import com.kh.DeliveryPikachu.service.AttachService;
import com.kh.DeliveryPikachu.service.ImageService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/store")
public class StoreController {

	@Autowired
	private AttachService attachService;
	@Autowired
	private StoreDao storeDao;
	
	@Autowired
	private ImageService imageService;

	// 가게 등록
	@GetMapping("/insert")
	public String insert() {
		return "/WEB-INF/views/store/insert.jsp";
	}

	@PostMapping("/insert")
	public String insert(@ModelAttribute StoreDto storeDto, @RequestParam MultipartFile attach)
			throws IllegalStateException, IOException {
		int sequence = storeDao.getSequence();
		storeDto.setStoreNo(sequence);
		
		storeDao.insert(storeDto);

		if (!attach.isEmpty()) {
			int attachNo = attachService.save(attach);
			storeDao.connect(storeDto.getStoreNo(), attachNo);
		}
		return "redirect:insertFinish";
	}

	// 등록 완료페이지
	@RequestMapping("/insertFinish")
	public String insertFinish() {
		return "/WEB-INF/views/store/insertFinish.jsp";
	}

	// 모든가게리스트(임시임)
	@RequestMapping("/listAll")
	public String listAll(Model model) {

		List<StoreDto> list;
		list = storeDao.selectListAll();
		model.addAttribute("listAll", list);

		return "/WEB-INF/views/store/storeListAll.jsp";
	}

	// 가게 상세
	@RequestMapping("/myStore")
	public String myStore(@RequestParam int storeNo, Model model) {
		StoreDto storeDto = storeDao.selectOne(storeNo);
		String storeImageLink = imageService.getStoreImgLink(storeNo);
		
		storeDto.setStoreImgLink(storeImageLink);
		model.addAttribute("storeDto", storeDto);

		return "/WEB-INF/views/store/myStore.jsp";
	}

	
}
