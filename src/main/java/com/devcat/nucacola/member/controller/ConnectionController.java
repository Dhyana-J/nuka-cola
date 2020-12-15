package com.devcat.nucacola.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.devcat.nucacola.member.model.service.MemberService;

@Controller
public class ConnectionController {

	@Autowired
	private MemberService mService;
	
	
	//팔로잉 조회
	@RequestMapping()
	public String selectFollowingList() {
		return "/main";
	}
	
	// 팔로잉 삭제
	@RequestMapping()
	public String deleteFollowing() {
		return "/main";
	}
	
	
	// 팔로워 조회
	@RequestMapping()
	public String selectFollowerList() {
		return "/main";
	}
	
	// 팔로워 삭제
	@RequestMapping()
	public String deleteFollower() {
		return "/main";
	}
	
	
	// 연결 조회
	@RequestMapping()
	public String selectConnectionList() {
		return "/main";
	}
	
	
}
