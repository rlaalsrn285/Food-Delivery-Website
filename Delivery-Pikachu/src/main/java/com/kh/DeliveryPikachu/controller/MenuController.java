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

import com.kh.DeliveryPikachu.dao.MenuDao;
import com.kh.DeliveryPikachu.dto.MenuDto;
import com.kh.DeliveryPikachu.dto.StoreDto;
import com.kh.DeliveryPikachu.service.AttachService;

@Controller
@RequestMapping("/menu")
public class MenuController {

	@Autowired
	private AttachService attachService;

	@Autowired
	MenuDao menuDao;

	// 메뉴등록
	@GetMapping("/insert")
	public String insert() {
		return "/WEB-INF/views/menu/insert.jsp";
	}

	@PostMapping("/insert")
	public String insert(@ModelAttribute MenuDto menuDto, @RequestParam MultipartFile attach)
			throws IllegalStateException, IOException {

		int sequence = menuDao.getSequence();
		menuDto.setMenuNo(sequence);

		menuDao.insert(menuDto);

		if (!attach.isEmpty()) {
			int attachNo = attachService.save(attach);
			menuDao.connect(menuDto.getMenuNo(), attachNo);
		}

		return "redirect:insertComplete";
	}

	@RequestMapping("/insertComplete")
	public String insertComplete() {
		return "/WEB-INF/views/menu/insertComplete.jsp";
	}

	// 모든메뉴리스트(임시임)
	@RequestMapping("/listAll")
	public String listAll(Model model) {

		List<MenuDto> list;
		list = menuDao.selectListAll();
		model.addAttribute("listAll", list);

		return "/WEB-INF/views/menu/menuListAll.jsp";
	}
}
