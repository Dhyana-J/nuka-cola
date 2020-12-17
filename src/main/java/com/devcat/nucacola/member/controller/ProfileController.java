package com.devcat.nucacola.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.devcat.nucacola.common.model.vo.Skills;
import com.devcat.nucacola.member.model.service.MemberService;
import com.devcat.nucacola.member.model.vo.Carrer;
import com.devcat.nucacola.member.model.vo.Member;
import com.devcat.nucacola.member.model.vo.Project;
import com.google.gson.Gson;

@Controller
public class ProfileController {

	
	@Autowired
	private MemberService mService;
	
	/*
	 * // 지원 이력 조회
	 * 
	 * @RequestMapping() public String selectListCount() {
	 "undefined*
	 * 
	 * }
	 */
	
	// 한줄 소개 입력
	@RequestMapping("/update.us")
	public String updateUserInfo(Member m, HttpSession session, Model model) {
		
		int result = mService.updateUserInfo(m);
		
		if(result>0) {

			Member loginUser = new Member();
			loginUser = mService.loginMember(m);
			
			session.setAttribute("loginUser", loginUser);
			
			return "redirect:profile.me";
			
		}else {
			
			model.addAttribute("errorMsg","수정 실패..");
			return "common/errorPage";
		}
		
		
	}
	
	
	// 기술테이블 기술 체크
	@ResponseBody
	@RequestMapping(value="/search.sk", produces="application/json; charset=utf-8")
	public String searchSkill(String skillName,Model model) {
		
		//System.out.println(skillName);
		
		ArrayList<Skills> list = mService.checkSkill(skillName);
		
		System.out.println(list);
		
		
		return new Gson().toJson(list);
		
	}
	
	

	// 활동 분야 입력
	@RequestMapping("/insert.field.us")
	public String insertUserField(int skillNo) {
		return "/main";
	}
	// 활동 분야 수정
	@RequestMapping("/update.field.us")
	public String updateUserField(int skillNo) {
		return "/main";
	}
	

	// 업무 분야 수정
	@RequestMapping("/update.position.us")
	public String updateUserPosition(Member m, HttpSession session, Model model) {
		
		int result = mService.updateUserPosi(m);
		
		if(result>0) {
			
			Member loginUser = mService.loginMember(m);
			
			session.setAttribute("loginUser", loginUser);
			
			return "redirect:profile.me";
			
			
		}else {
			
			model.addAttribute("errorMsg","수정 실패..");
			return "common/errorPage";
			
		}
		
	}
	
	
	// 프로젝트 입력
	@RequestMapping("/insert.project.us")
	public String insertProject(Project p) {
		return "/main";
	}
	// 프로젝트 수정
	@RequestMapping("/update.project.us")
	public String updateProject(Project p) {
		return "/main";
	}
	
	// 최종학력 입력
	@RequestMapping("/insert.edu.us")
	public String insertUserEdu(String userEdu) {
		return "/main";
	}
	// 최종학력 수정
	@RequestMapping("/update.edu.us")
	public String updateUserEdu(String userEdu) {
		return "/main";
	}
	// 경력 입력
	@RequestMapping("/insert.career.us")
	public String insertCareer(Carrer c) {
		return "/main";
	}
	// 경력 수정
	@RequestMapping("/update.career.us")
	public String updateCareer(Carrer c) {
		return "/main";
	}

	
	
	
	
	
}
