package com.devcat.nucacola.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.devcat.nucacola.member.model.service.MemberService;
import com.devcat.nucacola.member.model.vo.Connection;

@Controller
public class ConnectionController {
	
	
	@Autowired
	private MemberService mService;
	
	@RequestMapping("test.conn")
	public String test(int userNo) {
		for(int i=0; i<10; i++) {
			System.out.println(userNo);
			System.out.println(userNo);
		}
		return "redirect:/";
	}
	
	@ResponseBody
	@RequestMapping("addFollowing.conn")
	public int addFollowing(int userNo, int followingNo) {
		
				//유저번호, 팔로잉할사람 회원번호 넘겨주자
		return mService.addFollowing(new Connection(userNo,followingNo));
		
	}
	
	@ResponseBody
	@RequestMapping("cancelFollowing.conn")
	public int cancelFollowing(int userNo, int followingNo) {
				//유저번호, 팔로잉 취소할사람 회원번호 넘겨주자
		return mService.cancelFollowing(new Connection(userNo,followingNo));
		
	}
	
}
