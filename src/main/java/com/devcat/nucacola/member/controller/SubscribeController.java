package com.devcat.nucacola.member.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.devcat.nucacola.common.model.vo.PageInfo;
import com.devcat.nucacola.common.model.vo.Skills;
import com.devcat.nucacola.common.template.Pagination;
import com.devcat.nucacola.company.model.vo.Company;
import com.devcat.nucacola.member.model.service.MemberService;
import com.devcat.nucacola.member.model.vo.Bookmark;
import com.devcat.nucacola.member.model.vo.Career;
import com.devcat.nucacola.member.model.vo.CompSub;
import com.devcat.nucacola.member.model.vo.Member;
import com.devcat.nucacola.member.model.vo.Project;
import com.google.gson.Gson;

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
								 Member m,Model model,HttpSession session) {
			
		int uno = m.getUserNo();
		int blistCount = mService.countBookmark(uno);
		PageInfo pi = Pagination.getPageInfo(blistCount, currentPage,10,4);
		HashMap<Integer, List<String>>skillMap =new HashMap<>();
		ArrayList<Bookmark>blist = mService.selectBookmark(uno,pi);// 채용공고정보
		ArrayList<Bookmark>skills = mService.selectRecruitSkills(uno);// 채용공고 관련업무기술정보
		for(int i=0; i<skills.size();i++) { //조회한 업무기술문자열 뽑아서 , 기준으로 자르기
//			System.out.println(skills.get(i).getSkillName());
			String skillStr = skills.get(i).getSkillName();// 기술명문자열 출력
			
			List<String> skillsName = Arrays.asList(skillStr.split(","));// 기술명 , 기준으로 자르기

				int key=skills.get(i).getRecruitNo();
				skillMap.put(key,skillsName);
		}
		
		
		  // 유저 정보 전부 가져오기
		Member pUser = mService.selectUserProfile(uno);
		
		model.addAttribute("pUser",pUser);
		
		//-----------------인맥정보 불러오기-------------
		//팔로워, 팔로잉, 연결 리스트들의 count를 가져온다.
		//뷰에서 쓰일 팔로워,팔로잉,연결에 대한 페이지인포객체 세팅
		int countFollowers = mService.countFollowers(uno);
		int countFollowings = mService.countFollowings(uno);
		int countConnections = mService.countConnections(uno);
		
		model.addAttribute("countFollowers",countFollowers);
		model.addAttribute("countFollowings",countFollowings);
		model.addAttribute("countConnections",countConnections);
		
		model.addAttribute("blistCount", blistCount);
		model.addAttribute("pi",pi);
		model.addAttribute("skillMap",skillMap);
		model.addAttribute("blist",blist);
		return "/user/userProfile_bookmark";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "load.bk",method = RequestMethod.GET)
	public HashMap<String, Object> loadBookmark(@RequestParam(value="currentPage", defaultValue="1") int currentPage,
			 						Member m,Model model,HttpSession session) {
		int uno = m.getUserNo();
		int blistCount = mService.countBookmark(uno);
		PageInfo pi = Pagination.getPageInfo(blistCount, currentPage,10,4);
		HashMap<Integer, List<String>>skillMap =new HashMap<>();
		ArrayList<Bookmark>blist = mService.selectBookmark(uno,pi);// 채용공고정보
		ArrayList<Bookmark>skills = mService.selectRecruitSkills(uno);// 채용공고 관련업무기술정보
		for(int i=0; i<skills.size();i++) { //조회한 업무기술문자열 뽑아서 , 기준으로 자르기
			String skillStr = skills.get(i).getSkillName();// 기술명문자열 출력
			
			List<String> skillsName = Arrays.asList(skillStr.split(","));// 기술명 , 기준으로 자르기
				int key=skills.get(i).getRecruitNo();
				skillMap.put(key,skillsName);
		}
		
		HashMap<String, Object> result=new HashMap<>();
		result.put("skillMap",skillMap);
		result.put("blist",blist);
		
		System.out.println("blist"+blist);
		return result;
	}
	
	
	
	// 북마크 취소
	@ResponseBody
	@RequestMapping(value="/delete.bk", produces="text/html; charset=utf-8")
	public void deleteBookmark( Member m,Bookmark bm,HttpSession session) {
		bm.setUserNo(m.getUserNo());
		
		int result = mService.deleteBookmark(bm);

	}
	// 기업 구독 추가	
	@ResponseBody
	@RequestMapping("insert.sub.co")
	public HashMap<String, Integer> insertSubComp(int userNo, int compNo, int subscribed) {

		int result = mService.btnSub(userNo, compNo, subscribed);
		
		//해쉬맵에 값들 담아주기
		HashMap<String,Integer> list = new HashMap<>();
		
		if(result>0) { //구독 성공
			list.put("result", result);
			return list;
		}else { //구독 실패
			list.put("result", result);
			return list;
		}
		
	}	
		
	// 기업 구독 조회
	@RequestMapping("/list.sub")
	public String selectSubComp(@RequestParam(value="currentPage", defaultValue="1") int currentPage,
			 					Member m,HttpSession session, Model model) {
		int uno = m.getUserNo();
		int cslistCount = mService.countSubComp(uno);// 해당유저의 구독기업 총개수
		PageInfo pi = Pagination.getPageInfo(cslistCount, currentPage,1,4);
		ArrayList<CompSub> cslist=mService.selectSubComp(uno,pi);
		model.addAttribute("csCount",cslistCount);
		model.addAttribute("pi",pi);
		model.addAttribute("cslist",cslist);
//		System.out.println(cslist);
		
		
		  // 유저 정보 전부 가져오기
		Member pUser = mService.selectUserProfile(uno);
		
		model.addAttribute("pUser",pUser);
		
		//-----------------인맥정보 불러오기-------------
		//팔로워, 팔로잉, 연결 리스트들의 count를 가져온다.
		//뷰에서 쓰일 팔로워,팔로잉,연결에 대한 페이지인포객체 세팅
		int countFollowers = mService.countFollowers(uno);
		int countFollowings = mService.countFollowings(uno);
		int countConnections = mService.countConnections(uno);
		
		model.addAttribute("countFollowers",countFollowers);
		model.addAttribute("countFollowings",countFollowings);
		model.addAttribute("countConnections",countConnections);
		
		
		return "/user/userProfile_scriptCompany";
		
	}
	
	
	@ResponseBody
	@RequestMapping(value="load.sub",method = RequestMethod.GET)
    public  ResponseEntity<HashMap<String, Object>> loadSubComp(@RequestParam(value="currentPage", defaultValue="1") int currentPage,
			 							Member m,HttpSession session, Model model) {
		HttpHeaders responseHeaders = new HttpHeaders();
		m = (Member)session.getAttribute("loginUser");
		int uno = m.getUserNo();
		int cslistCount = mService.countSubComp(uno);// 해당유저의 구독기업 총개수
		PageInfo pi = Pagination.getPageInfo(cslistCount, currentPage,1,4);
		ArrayList<CompSub> cslist=mService.selectSubComp(uno,pi);
        responseHeaders.setContentType(MediaType.APPLICATION_JSON);
		HashMap<String, Object> result=new HashMap<>();
		result.put("csCount",cslistCount);
		result.put("cslist",cslist);
		return new ResponseEntity<HashMap<String, Object>>(result, responseHeaders, HttpStatus.CREATED);
		
	
	}
	
	// 기업 구독 취소	
	@ResponseBody
	@RequestMapping(value="/delete.sub")
	public void deleteSubComp(CompSub cs, HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");
		cs.setUserNo(m.getUserNo());
//		System.out.println(cs);
		int result = mService.deleteSubComp(cs);

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
