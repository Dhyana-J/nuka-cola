package com.devcat.nucacola.member.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.devcat.nucacola.common.model.vo.PageInfo;
import com.devcat.nucacola.common.template.Pagination;
import com.devcat.nucacola.member.model.service.MemberService;
import com.devcat.nucacola.member.model.vo.Bookmark;
import com.devcat.nucacola.member.model.vo.CompSub;

@Controller
public class SubscribeController {
	
	// 기업 구독 및 북마크 컨트롤러 입니다.
	
	@Autowired
	private MemberService mService;
	
	// 북마크 추가
	@RequestMapping("/insert.bk")
	public String insertBookmark() {
		return "/main";
	
	}
	
	// 북마크 조회
	@RequestMapping("/list.bk")
	public String selectBookmark(@RequestParam(value="currentPage", defaultValue="1") int currentPage,
								int uno, Model model) {
		int blistCount = mService.countBookmark(uno);
		PageInfo pi = Pagination.getPageInfo(blistCount, currentPage,1,4);
		System.out.println(pi);
		HashMap<Integer, List<String>>skillMap =new HashMap<>();
		ArrayList<Bookmark>blist = mService.selectBookmark(uno,pi);// 채용공고정보
		ArrayList<Bookmark>skills = mService.selectRecruitSkills(uno);// 채용공고 관련업무기술정보
		for(int i=0; i<skills.size();i++) { //조회한 업무기술문자열 뽑아서 , 기준으로 자르기
			System.out.println(skills.get(i).getSkillName());
			String skillStr = skills.get(i).getSkillName();// 기술명문자열 출력
			
			List<String> skillsName = Arrays.asList(skillStr.split(","));// 기술명 , 기준으로 자르기
//			for(int j=0;j<skillsName.length;j++) {// 자른기술명 list에 넣기
//				skillList.add(skillsName);
				System.out.println(i);
				System.out.println(skillsName);
				int key=skills.get(i).getRecruitNo();
				skillMap.put(key,skillsName);
				/*
				for(int j=0;j<skillsName.size();j++) {
				System.out.println(skillsName.get(j));
				}*/ //리스트에 잇는 내용 하나씩 출력
//			}
			System.out.println(skillMap.get(1));
		}
		model.addAttribute("blistCount", blistCount);
		model.addAttribute("pi",pi);
		model.addAttribute("skillMap",skillMap);
		model.addAttribute("blist",blist);
		return "/user/userProfile_bookmark";
	}
	
	
	// bookmark의 more버튼 클릭시 controller
	@ResponseBody
	@RequestMapping(value="/loadMore.bk", produces="text/html; charset=utf-8")
	public void selectBookmark2(@RequestParam(value="currentPage", defaultValue="1") int currentPage,
			int uno, Model model) {
		int blistCount = mService.countBookmark(uno);
		PageInfo pi = Pagination.getPageInfo(blistCount, currentPage,1,4);
		
		HashMap<Integer, List<String>>skillMap =new HashMap<>();
		ArrayList<Bookmark>blist = mService.selectBookmark(uno,pi);// 채용공고정보
		ArrayList<Bookmark>skills = mService.selectRecruitSkills(uno);// 채용공고 관련업무기술정보
		for(int i=0; i<skills.size();i++) { //조회한 업무기술문자열 뽑아서 , 기준으로 자르기
		System.out.println(skills.get(i).getSkillName());
		String skillStr = skills.get(i).getSkillName();// 기술명문자열 출력
		
		List<String> skillsName = Arrays.asList(skillStr.split(","));// 기술명 , 기준으로 자르기
		System.out.println(i);
		System.out.println(skillsName);
		int key=skills.get(i).getRecruitNo();
		skillMap.put(key,skillsName);

		System.out.println(skillMap.get(1));

		model.addAttribute("pi",pi);
		model.addAttribute("skillMap",skillMap);
		model.addAttribute("blist",blist);}
		}
	
	
	
	// 북마크 취소
	@ResponseBody
	@RequestMapping(value="/delete.bk", produces="text/html; charset=utf-8")
	public void deleteBookmark(Bookmark bm) {
		System.out.println(bm);
		int result = mService.deleteBookmark(bm);

//		return "redirect:list.bk?uno="+bm.getRecruitNo();
//		return "redirect:";
	}
	// 기업 구독 추가	
	@RequestMapping("/insert.sub")
	public String insertSubComp() {
		return "/main";
		
		
	}	
		
	// 기업 구독 조회
	@RequestMapping("/list.sub")
	public String selectSubComp(@RequestParam(value="currentPage", defaultValue="1") int currentPage,
								int uno, Model model) {
		int cslistCount = mService.countSubComp(uno);// 해당유저의 구독기업 총개수
		PageInfo pi = Pagination.getPageInfo(cslistCount, currentPage,1,4);
		ArrayList<CompSub> cslist=mService.selectSubComp(uno,pi);
		model.addAttribute("csCount",cslistCount);
		model.addAttribute("pi",pi);
		model.addAttribute("cslist",cslist);
		System.out.println(cslist);
		return "/user/userProfile_scriptCompany";
		
	
	}
	
	// 기업 구독 취소	
	@ResponseBody
	@RequestMapping(value="/delete.sub")
	public void deleteSubComp(CompSub cs) {
		int result = mService.deleteSubComp(cs);
		
//		return "/main";
	}

	//팔로잉 조회
	@RequestMapping("/list.fwi")
	public String selectFollowingList() {
		return "/main";
	}

	// 팔로잉 삭제
	@RequestMapping("/update.fwi")
	public String deleteFollowing() {
		return "/main";
	}


	// 팔로워 조회
	@RequestMapping("/list.fwr")
	public String selectFollowerList() {
		return "/main";
	}

	// 팔로워 삭제
	@RequestMapping("/delete.fwi")
	public String deleteFollower() {
		return "/main";
	}


	// 연결 조회
	@RequestMapping("/list.con")
	public String selectConnectionList() {
		return "/main";
	}

}
