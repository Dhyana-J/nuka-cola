package com.devcat.nucacola.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.devcat.nucacola.member.model.service.MemberService;
import com.devcat.nucacola.member.model.vo.Member;

@Controller
public class SignupController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	@RequestMapping("insert.me")
	public String insertMember(Member m, Model model, HttpSession session) {
		
		System.out.println(m);
		
		// 회원가입 시 입력한 비밀번호 암호화
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		m.setUserPwd(encPwd);
		
		int result = mService.insertMember(m);
		
		if(result>0) {//회원가입 성공
			
			session.setAttribute("alertMsg", "회원가입 성공!");
			return "redirect:/";
			
		}else {//회원가입 실패
			
			model.addAttribute("errorMsg","회원가입 실패!");
			return "common/errorPage";
			
		}
		
	}
	
	
}
