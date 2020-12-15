package com.devcat.nucacola.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.devcat.nucacola.member.model.service.MemberService;
import com.devcat.nucacola.member.model.vo.Carrer;
import com.devcat.nucacola.member.model.vo.Project;

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
	@RequestMapping("/insert.us")
	public String insertUserInfo(String UserInfo) {
		return "/main";
	}
	
	// 한줄 소개 수정
	@RequestMapping("/update.us")
	public String updateUserInfo(String UserInfo) {
		return "/main";
	}
	
	// 기술테이블 기술 체크
	@RequestMapping("/search.sk")
	public String searchSkill(String skillName) {
		return "/main";
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
	
	// 업무 분야 입력
	@RequestMapping("/insert.position.us")
	public String  insertUserPosition(String UserPosition) {
		return "/main";
	}
	// 업무 분야 수정
	@RequestMapping("/update.position.us")
	public String updateUserPosition(String UserPosition) {
		return "/main";
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
	public String insertUserEdu(String UserEdu) {
		return "/main";
	}
	// 최종학력 수정
	@RequestMapping("/update.edu.us")
	public String updateUserEdu(String UserEdu) {
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
