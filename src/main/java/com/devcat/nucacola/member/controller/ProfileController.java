package com.devcat.nucacola.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.devcat.nucacola.common.model.vo.PageInfo;
import com.devcat.nucacola.common.template.Pagination;
import com.devcat.nucacola.member.model.service.MemberService;
import com.devcat.nucacola.member.model.vo.Carrer;
import com.devcat.nucacola.member.model.vo.Member;
import com.devcat.nucacola.member.model.vo.Project;

@Controller
public class ProfileController {

	
	@Autowired
	private MemberService mService;
	
	// 유저 프로필
		@RequestMapping("profile.us")
		public String profileUser() {
			
			return "user/userProfile";
		}
	
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
	
	// 인맥 불러오기
	@RequestMapping("connection.us")
	public String selectConnectionList(@RequestParam(value="currentPage",defaultValue="1") int currentPage,Member m, Model model){
		
		System.out.println(currentPage);
		int countFollowers=mService.countFollowers(m.getUserNo());
		int countFollowings=mService.countFollowings(m.getUserNo());
		int countConnections=mService.countConnections(m.getUserNo());
		
		System.out.println("팔로워수 : "+countFollowers);
		System.out.println("팔로잉수 : "+countFollowings);
		System.out.println("연결수 : "+countConnections);
		
		
		PageInfo frPi=Pagination.getPageInfo(countFollowers, currentPage, 1, 3);
		PageInfo fgPi=Pagination.getPageInfo(countFollowings, currentPage, 1, 3);
		PageInfo cnPi=Pagination.getPageInfo(countConnections, currentPage, 1, 3);
		
		ArrayList<Member> followers = mService.selectFollowers(m.getUserNo(),frPi);
		ArrayList<Member> followings = mService.selectFollowings(m.getUserNo(),fgPi);
		ArrayList<Member> connections = mService.selectConnections(m.getUserNo(),cnPi);
		
		
		HashMap<String,ArrayList<Member>> pCon = new HashMap<>(); //personalConnection = 인맥
		
		pCon.put("followers",followers);
		pCon.put("followings", followings);
		pCon.put("connections",connections);
		
		
		PageInfo pi;
		
		if(countFollowers>=countFollowings) {
			if(countFollowers>=countConnections) {
				pi=frPi;
			}else {
				pi=cnPi;
			}
		}else {
			if(countFollowings>=countConnections) {
				pi=fgPi;
			}else {
				pi=cnPi;
			}
		}
		
		
		model.addAttribute("pCon", pCon);
		model.addAttribute("pi",pi);
		
		return "user/userProfile";
	}
	
	@ResponseBody
	@RequestMapping("connection2.us")
	public Map<String, ArrayList<Member>> selectConnectionList2(@RequestParam(value="currentPage",defaultValue="1") int currentPage,Member m, Model model){
		
		//팔로워, 팔로잉, 연결된사람 수를 카운트한다.
		int countFollowers=mService.countFollowers(m.getUserNo());
		int countFollowings=mService.countFollowings(m.getUserNo());
		int countConnections=mService.countConnections(m.getUserNo());
		
		PageInfo frPi=Pagination.getPageInfo(countFollowers, currentPage, 1, 3);
		PageInfo fgPi=Pagination.getPageInfo(countFollowings, currentPage, 1, 3);
		PageInfo cnPi=Pagination.getPageInfo(countConnections, currentPage, 1, 3);
		
		ArrayList<Member> followers = mService.selectFollowers(m.getUserNo(),frPi);
		ArrayList<Member> followings = mService.selectFollowings(m.getUserNo(),fgPi);
		ArrayList<Member> connections = mService.selectConnections(m.getUserNo(),cnPi);
		

		
		
		Map<String,ArrayList<Member>> pCon = new HashMap<>(); //personalConnection = 인맥
		
		
		
		pCon.put("followers", followers);
		pCon.put("followings", followings);
		pCon.put("connections", connections);
		
		
		
		return pCon;
	}

	
	
	
	
	
}
