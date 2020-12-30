package com.devcat.nucacola.member.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

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
		
		int connectionCount = mService.countConnections(userNo);//팔로잉 삭제 후 연결된 사람 수(profile_following.jsp에서쓰임)
		
		HashMap<String,Integer> list = new HashMap<>();//뷰로 리턴할 HashMap
		
		if(result>0) {//팔로잉 삭제 성공시
			list.put("result",result);
			list.put("followerNo",userNo);
			list.put("followingNo",followingNo);
			list.put("connectionCount",connectionCount);
			return list;
			
		}else{//팔로잉 삭제 실패시
			list.put("result",result);
			return list;
		}
		
	}
	
}
