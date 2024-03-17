package com.kh.DeliveryPikachu.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.DeliveryPikachu.dao.MemberDao;
import com.kh.DeliveryPikachu.dto.MemberDto;
import com.kh.DeliveryPikachu.service.AttachService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberDao memberDao;

	@Autowired
	private AttachService attachService;

	// 회원가입페이지
	@GetMapping("/signup")
	public String signup() {
		return "/WEB-INF/views/member/signup.jsp";
	}

	@PostMapping("/signup")
	public String signup(@ModelAttribute MemberDto memberDto, @RequestParam MultipartFile attach)
			throws IllegalStateException, IOException {

		// 회원정보 등록
		memberDao.insert(memberDto);
		// 첨부파일 등록
		if (!attach.isEmpty()) {
			int attachNo = attachService.save(attach);
			memberDao.connect(memberDto.getMemberId(), attachNo);
		}

		return "redirect:signupFinish";
	}

	@RequestMapping("/signupFinish")
	public String signupFinish() {
		return "/WEB-INF/views/member/signupFinish.jsp";
	}

	// 로그인
	@GetMapping("/signIn")
	public String signIn() {
		return "/WEB-INF/views/member/signIn.jsp";
	}

	@PostMapping("/signin")
	public String signin(@ModelAttribute MemberDto inputDto, HttpSession session) {
		// 사용자가 입력한 아이디로 회원정보를 조회한다
		MemberDto findDto = memberDao.selectOne(inputDto.getMemberId());
		// 로그인 가능 여부를 판정
		boolean isValid = findDto != null && inputDto.getMemberPw().equals(findDto.getMemberPw());
		// 결과에 따라 다른 처리
		if (isValid) {
			// 세션에 데이터 추가
			session.setAttribute("loginId", findDto.getMemberId());
			session.setAttribute("loginGrade", findDto.getMemberGrade());
			session.setAttribute("memberNo", findDto.getMemberNo());
			// 최종 로그인시각 갱신

			return "redirect:/";
		} else {// 로그인 실패
			return "redirect:signInFail";
		}
	}

	// 로그인실패화면
	@RequestMapping("/signInFail")
	public String signInFail() {
		return "/WEB-INF/views/member/signInFail.jsp";
	}

	// 프사 반환
	@RequestMapping("/profilePhoto")
	public String image(HttpSession session) {
		try {
			String loginId = (String) session.getAttribute("loginId");
			int attachNo = memberDao.findAttachNo(loginId);
			return "redirect:/download?attachNo=" + attachNo;
		} catch (Exception e) {
			return "redirect:/image/user.png";
		}
	}
	
	@RequestMapping("/mypage")
	public String mypage(HttpSession session, Model model) {
		String loginId = (String) session.getAttribute("loginId");
		MemberDto memberDto = memberDao.selectOne(loginId);
		model.addAttribute("memberDto", memberDto);

		return "/WEB-INF/views/member/mypage.jsp";
	}
	
	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
