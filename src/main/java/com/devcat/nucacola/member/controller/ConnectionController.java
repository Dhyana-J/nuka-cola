package com.devcat.nucacola.member.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.devcat.nucacola.member.model.service.MemberService;
import com.devcat.nucacola.member.model.vo.Connection;

@Controller
public class ConnectionController {
	
	
	@Autowired
	private MemberService mService;
	

	@RequestMapping("list.pa")
	public String partnerForm() {
		return "partner/partner";
	}
	
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
	public HashMap<String,Integer> addFollowing(int userNo, int followingNo) {
		
					
		int result = mService.addFollowing(new Connection(userNo,followingNo));
		
		HashMap<String,Integer> list = new HashMap<>();//뷰로 리턴할 HashMap
		
		if(result>0) {//팔로잉 추가 성공시
			list.put("result",result);
			list.put("followerNo",userNo);
			list.put("followingNo",followingNo);
			return list;
			
		}else{//팔로잉 추가 실패시
			list.put("result",result);
			return list;
		}
		
	}
	
	@ResponseBody
	@RequestMapping("cancelFollowing.conn")
	public HashMap<String,Integer> cancelFollowing(int userNo, int followingNo) {
		
		int result = mService.cancelFollowing(new Connection(userNo,followingNo));
		
		HashMap<String,Integer> list = new HashMap<>();//뷰로 리턴할 HashMap
		
		if(result>0) {//팔로잉 추가 성공시
			list.put("result",result);
			list.put("followerNo",userNo);
			list.put("followingNo",followingNo);
			return list;
			
		}else{//팔로잉 추가 실패시
			list.put("result",result);
			return list;
		}
		
	}
	
}
