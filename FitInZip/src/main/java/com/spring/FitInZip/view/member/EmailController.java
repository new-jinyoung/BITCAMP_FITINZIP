package com.spring.FitInZip.view.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.FitInZip.back.member.service.EmailService;
import com.spring.FitInZip.back.member.vo.MemberVO;


@Controller
@SessionAttributes("member")
public class EmailController {
	
	@Autowired
	private EmailService emailService; 

	// 메인 로그인 화면
	@RequestMapping("/loginMain")
	public String loginMain() {
		System.out.println("loginMain 실행중");
		
		return "login/loginForm";
	}
	
	
	@RequestMapping("/emailJoinForm")
	public String emailJoinForm(MemberVO vo) {
		System.out.println("emailJoinForm 실행중");
		
		
		return "login/emailJoinForm";
	}
	
	// 이메일 중복검사
	@RequestMapping("/emailCheck")
	@ResponseBody
	public Boolean emailCheck(String id) {
		System.out.println("emailCheck에 넘어온 id : " + id);
		
		Boolean overlap = false;
		
		int result = emailService.emailCheck(id);
		
		System.out.println("result : " + result);
		if (result == 1) {
			overlap = true;
		}
		
		return overlap;
	}
	
	
	@RequestMapping("/emailJoin")
	@ResponseBody
	public String emailJoin(Model model, MemberVO vo) {
		System.out.println("emailJoin 실행중");
		System.out.println("이메일가입 정보 입력 후 vo : " + vo);
		
		emailService.emailJoin(vo);
		emailService.welcomeCoupon(vo);
		
		model.addAttribute("member", vo);
		
		return "true";
	}
	
	@RequestMapping("/welcome")
	public String welcome() {
		
		return "login/welcome";
	}
	
	
	@RequestMapping("/emailLoginCheck")
	@ResponseBody
	public boolean emailLogin(MemberVO vo, Model model, HttpSession session) {
		
		boolean isJoin = false;
		
		MemberVO member = emailService.emailLogin(vo);
		
		if (member != null && member.getWithdrawal().equals("WD00") && member.getRole().equals("RL00")) {
			isJoin = true;
			model.addAttribute("member", member);
		}
		
		return isJoin;
	}
	
	
	
	
}
