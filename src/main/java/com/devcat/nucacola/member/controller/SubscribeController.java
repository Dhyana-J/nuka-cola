package com.devcat.nucacola.member.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String selectBookmark(int uno, Model model) {
		ArrayList<Bookmark>blist = mService.selectBookmark(uno);
		
		model.addAttribute("blist",blist);
		return "/user/userProfile_bookmark";
	}
	// 북마크 취소
	@ResponseBody
	@RequestMapping(value="/delete.bk", produces="text/html; charset=utf-8")
	public void deleteBookmark(Bookmark bm) {
		System.out.println(bm);
		int result = mService.deleteBookmark(bm);
//		System.out.println(result);

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
	public String selectSubComp(int uno, Model model) {
		ArrayList<CompSub> cslist=mService.selectSubComp(uno);
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
