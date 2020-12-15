package com.devcat.nucacola.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.devcat.nucacola.member.model.service.MemberService;

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
	public String selectBookmark() {

		return "/main";
	}
	// 북마크 취소
	@RequestMapping("/delete.bk")
	public String deleteBookmark() {
		return "/main";
	}
	// 기업 구독 추가	
	@RequestMapping("/insert.sub")
	public String insertSubComp() {
		return "/main";
		
		
	}	
		
	// 기업 구독 조회
	@RequestMapping("/list.sub")
	public String selectSubComp() {
		return "/main";
		
	
	}
	
	// 기업 구독 취소	
	@RequestMapping("/delete.sub")
	public String deleteSubComp() {
		return "/main";
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
