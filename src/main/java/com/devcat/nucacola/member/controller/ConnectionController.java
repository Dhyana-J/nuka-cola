package com.devcat.nucacola.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.devcat.nucacola.common.model.vo.Skills;
import com.devcat.nucacola.member.model.service.MemberService;
import com.devcat.nucacola.member.model.vo.Connection;
import com.devcat.nucacola.member.model.vo.Member;

@Controller
public class ConnectionController {
	
	
	@Autowired
	private MemberService mService;
	
    // 사람검색페이지
	@RequestMapping("list.pa")
	public String partnerForm(HttpSession session,Model model) {
		Member m = (Member) session.getAttribute("loginUser");
		int userNo = m.getUserNo();
		//연결된사람(개발자, 디자이너, 기획자)명수
		ArrayList<Member> connecting =mService.partnerConnecting(userNo);
		System.out.println(connecting.get(0).getUserPosi());
		int developer=0;
		int designer=0;
		int planner=0;
		for(int i=0; i<=connecting.size()-1; i++) {
			if(connecting.get(i).getUserPosi().equals("0")) {
				planner++;
			}else if(connecting.get(i).getUserPosi().equals("1")){
				designer++;
			}else if(connecting.get(i).getUserPosi().equals("2")){
				developer++;
			}
		}
		HashMap<String,Integer> connect = new HashMap<>();
		connect.put("planner", planner);
		connect.put("designer", designer);
		connect.put("developer",developer);
		//활동분야
		ArrayList<Skills> skill = mService.partnerSearchSkill();
		//인기 프로필
		List<Integer> popularNo = mService.partnerPopularProfile();
		System.out.println(popularNo);
		ArrayList<Member> popular = mService.partnerPopularInfo(popularNo);
		System.out.println(popular);
		model.addAttribute("popular", popular);
		model.addAttribute("connect", connect);
		model.addAttribute("skill",skill);
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
