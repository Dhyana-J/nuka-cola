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
	@RequestMapping()
	public String insertBookmark() {
	
	
	}
	
	// 북마크 조회
	@RequestMapping()
	public String selectBookmark() {
	
	
	}
	// 북마크 취소
	@RequestMapping()
	public String deleteBookmark() {
	
	}
	// 기업 구독 추가	
	@RequestMapping()
	public String insertSubComp() {
	
		
		
	}	
		
	// 기업 구독 조회
	@RequestMapping()
	public String selectSubComp() {
	
		
	
	}
	
	// 기업 구독 취소	
	@RequestMapping()
	public String deleteSubComp() {
		
	}
}
