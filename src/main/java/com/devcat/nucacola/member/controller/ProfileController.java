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
	 * 
	 * }
	 */
	
	// 한줄 소개 입력
	@RequestMapping()
	public String insertUserInfo(String UserInfo) {
		
	}
	
	// 한줄 소개 수정
	@RequestMapping()
	public String updateUserInfo(String UserInfo) {
		
	}
	
	// 기술테이블 기술 체크
	@RequestMapping()
	public String checkSkill(String skillName) {
		
	}

	// 활동 분야 입력
	@RequestMapping()
	public String insertUserFiled(int skillNo) {
		
	}
	// 활동 분야 수정
	@RequestMapping()
	public String updateUserFiled(int skillNo) {
		
	}
	
	// 업무 분야 입력
	@RequestMapping()
	public String  insertUserPosi(String UserPosi) {
		
	}
	// 업무 분야 수정
	@RequestMapping()
	public String updateUserPosi(String UserPosi) {
		
	}
	// 프로젝트 입력
	@RequestMapping()
	public String insertProject(Project p) {
		
	}
	// 프로젝트 수정
	@RequestMapping()
	public String updateProject(Project p) {
		
	}
	
	// 최종학력 입력
	@RequestMapping()
	public String insertUserEdu(String UserEdu) {
		
	}
	// 최종학력 수정
	@RequestMapping()
	public String updateUserEdu(String UserEdu) {
		
	}
	// 경력 입력
	@RequestMapping()
	public String insertCarrer(Carrer c) {
		
	}
	// 경력 수정
	@RequestMapping()
	public String updateCarrer(Carrer c) {
		
	}

	
	
	
	
	
}
