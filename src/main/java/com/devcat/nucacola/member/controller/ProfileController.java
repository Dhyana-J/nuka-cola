package com.devcat.nucacola.member.controller;

import java.util.ArrayList;
import java.util.HashMap;

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
			
			//System.out.println(loginUser);
			
			session.setAttribute("loginUser", loginUser);
			
			return "redirect:profile.me?userNo="+loginUser.getUserNo();
			
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
		
		//System.out.println(list);
		
		
		return new Gson().toJson(list);
		
	}
	
	

	// 활동 분야 입력
	@ResponseBody
	@RequestMapping(value="/insert.field.us", produces="application/json; charset=utf-8")
	public String insertUserField(String skillName, int userNo) {
		
		//System.out.println(skillName);
		//System.out.println(userNo);

		// 넘어온 기술들을 쪼개서 배열에 담아줌
		String[] arr = skillName.split(" ");
		
		
		
		// 기술 번호를 알아오기 위한 list
		ArrayList<Skills> list = new ArrayList<>();
		
		// hasMap으로 넘기기 위한 기술번호를 담을 list
		ArrayList<Integer> skillsNo = new ArrayList<>();
		
		// 기술 번호 알아오는 리스트(기술번호, 기술이름 다 가져옴)
		list = mService.getSkillNo(arr);
		
		
		// 반복문으로 기술 번호 담아주기
		for(int i=0; i<list.size(); i++) {
			
			skillsNo.add(list.get(i).getSkillNo());
		}
		
		System.out.println(list);
		
		
		HashMap<String, Object> hm = new HashMap<String, Object>();
		
		hm.put("userNo", userNo);
		hm.put("skillsNo",skillsNo);
		
		System.out.println(hm);
		
		// 유저 필드에 기술번호를 담아줌
		int result = mService.insertUserFiled(hm);
		
		ArrayList<String> skillNameList = new ArrayList<>(); 
		
		if (result>0) {
			
			for(int i = 0; i<list.size(); i++) {
				System.out.println(list.get(i).getSkillName());
				skillNameList.add(list.get(i).getSkillName());
			}

		}
		
		
		return new Gson().toJson(skillNameList);	
		
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
			
			return "redirect:profile.me?userNo="+loginUser.getUserNo();
			
			
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
