package com.devcat.nucacola.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.devcat.nucacola.common.model.vo.PageInfo;
import com.devcat.nucacola.common.model.vo.Skills;
import com.devcat.nucacola.common.template.Pagination;
import com.devcat.nucacola.member.model.service.MemberService;
import com.devcat.nucacola.member.model.vo.Connection;
import com.devcat.nucacola.member.model.vo.Member;
import com.devcat.nucacola.member.model.vo.PartnerSearch;

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
		System.out.println(skill);
		//인기 프로필
		ArrayList<Member> follower = mService.partnerFollowers(userNo);
		for(Member f :follower) {
			System.out.println(f);
		}
		List<Integer> popularNo = mService.partnerPopularProfile();
		System.out.println(popularNo);
		ArrayList<Member> popular = mService.partnerPopularInfo(popularNo);
		System.out.println(popular);
		model.addAttribute("follower",follower);
		model.addAttribute("popular", popular);
		model.addAttribute("connect", connect);
		model.addAttribute("skill",skill);
		return "partner/partner";
	}
	
	//사람조회
	@ResponseBody
	@RequestMapping(value = "search.pa", method = RequestMethod.GET)
	public HashMap<String,Object> searchPerson(@RequestParam(value="currentPage", defaultValue="1") int currentPage, String posiList,@RequestParam(value="skillList", defaultValue="000") String skillList, String schoolList
			,String keyword,HttpSession session) {
		Member m = (Member) session.getAttribute("loginUser");
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.setContentType(MediaType.APPLICATION_JSON);
		int pList = Integer.parseInt(posiList);//업무분야
		
		
		System.out.println(posiList);
		System.out.println(skillList);
		System.out.println(schoolList);
		System.out.println(keyword);
		String[] skLists= skillList.split(",");	// 기술분야		
		List<Integer> skList = Stream.of(skLists).map(Integer::parseInt).collect(Collectors.toList());
		// 기술분야와 관련된 사람들 조회
		skList = mService.partnerSearchSkill(skList);
		System.out.println("skList"+skList);
		PartnerSearch p = new PartnerSearch(m.getUserNo(),pList,skList,schoolList,keyword);
		
		//연결된 사람들중 검색결과 총수
		int listCount1 = mService.partnerSearchCount1(p);
		System.out.println("연결된사람들중에 검색결과 총명 수:"+listCount1);
		PageInfo pi1 = Pagination.getPageInfo(listCount1, currentPage, 10, 4);
		ArrayList<Member> ConPeople = mService.partnerConnResult(p,pi1);//연결된사람들중에서 검색
		System.out.println(ConPeople);
		
		//그외 사람들중 검색 결과 총수
		int listCount2 = mService.partnerSearchCount2(p);
		System.out.println("그외 사람들중에 검색결과 총명 수:"+listCount2);
		PageInfo pi2 = Pagination.getPageInfo(listCount2, currentPage, 10, 4);
		ArrayList<Member> ETCPeople = mService.partnerETCResult(p,pi2);//그외 사람들중에서 검색
		for(Member et: ETCPeople) {
			System.out.println(et);
		}

		
		HashMap<String,Object> list = new HashMap<>();
		list.put("ConPeople", ConPeople);
		list.put("ETCPeople", ETCPeople);
		list.put("ConPeopleCount", listCount1);
		list.put("ETCPeopleCount", listCount2);
		list.put("pi1", pi1);
		list.put("pi2", pi2);
		
		
		
		
		//String json = new Gson().toJson(list);
		//new ResponseEntity<String>(json, responseHeaders, HttpStatus.CREATED);
		return list;
		
	}
	
	
	
	//ETC사람 페이징처리
		@ResponseBody
		@RequestMapping(value = "ETCPeopleLoad.pa", method = RequestMethod.GET)
		public HashMap<String,Object> ETCPeopleLoad(@RequestParam(value="currentPage", defaultValue="1") int currentPage, String posiList,@RequestParam(value="skillList", defaultValue="000") String skillList, String schoolList
				,String keyword,HttpSession session) {
			Member m = (Member) session.getAttribute("loginUser");
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.setContentType(MediaType.APPLICATION_JSON);
			int pList = Integer.parseInt(posiList);//업무분야
			
			
			System.out.println(posiList);
			System.out.println(skillList);
			System.out.println(schoolList);
			System.out.println(keyword);
			String[] skLists= skillList.split(",");	// 기술분야		
			List<Integer> skList = Stream.of(skLists).map(Integer::parseInt).collect(Collectors.toList());
			// 기술분야와 관련된 사람들 조회
			skList = mService.partnerSearchSkill(skList);
			System.out.println("skList"+skList);
			PartnerSearch p = new PartnerSearch(m.getUserNo(),pList,skList,schoolList,keyword);
			
			//그외 사람들중 검색 결과 총수
			int listCount2 = mService.partnerSearchCount2(p);
			System.out.println("그외 사람들중에 검색결과 총명 수:"+listCount2);
			PageInfo pi2 = Pagination.getPageInfo(listCount2, currentPage, 10, 4);
			ArrayList<Member> ETCPeople = mService.partnerETCResult(p,pi2);//그외 사람들중에서 검색
			for(Member et: ETCPeople) {
				System.out.println(et);
			}

			
			HashMap<String,Object> list = new HashMap<>();
			list.put("ETCPeople", ETCPeople);
			list.put("ETCPeopleCount", listCount2);
			list.put("pi2", pi2);
			
			
			
			
			//String json = new Gson().toJson(list);
			//new ResponseEntity<String>(json, responseHeaders, HttpStatus.CREATED);
			return list;
			
		}
	//ETC사람 페이징처리
		@ResponseBody
		@RequestMapping(value = "ConnPeopleLoad.pa", method = RequestMethod.GET)
			public HashMap<String,Object> ConnPeopleLoad(@RequestParam(value="currentPage", defaultValue="1") int currentPage, String posiList,@RequestParam(value="skillList", defaultValue="000") String skillList, String schoolList
						,String keyword,HttpSession session) {
			Member m = (Member) session.getAttribute("loginUser");
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.setContentType(MediaType.APPLICATION_JSON);
			int pList = Integer.parseInt(posiList);//업무분야

			String[] skLists= skillList.split(",");	// 기술분야		
			List<Integer> skList = Stream.of(skLists).map(Integer::parseInt).collect(Collectors.toList());
					// 기술분야와 관련된 사람들 조회
			skList = mService.partnerSearchSkill(skList);
			System.out.println("skList"+skList);
			PartnerSearch p = new PartnerSearch(m.getUserNo(),pList,skList,schoolList,keyword);
					
					//연결된 사람들중 검색결과 총수
			int listCount1 = mService.partnerSearchCount1(p);
			System.out.println("연결된사람들중에 검색결과 총명 수:"+listCount1);
			PageInfo pi1 = Pagination.getPageInfo(listCount1, currentPage, 10, 4);
			ArrayList<Member> ConPeople = mService.partnerConnResult(p,pi1);//연결된사람들중에서 검색
			System.out.println(ConPeople);
					

			HashMap<String,Object> list = new HashMap<>();
			list.put("ConPeople", ConPeople);
			list.put("ConPeopleCount", listCount1);
			list.put("pi1", pi1);


			return list;
					
			}
	
	//학교명 검색
	@ResponseBody
	@RequestMapping(value="/search.sc", produces="application/json; charset=utf-8")
	public void searchSchoolName(String schoolName, Model model) {
		
//		ArrayList<Member>list = mService.searchSchoolName(schoolName);
		
//		return new Gson().toJson(list);
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
