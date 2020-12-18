package com.devcat.nucacola.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.devcat.nucacola.common.model.vo.PageInfo;
import com.devcat.nucacola.common.template.Pagination;
import com.devcat.nucacola.member.model.service.MemberService;
import com.devcat.nucacola.member.model.vo.Carrer;
import com.devcat.nucacola.member.model.vo.Member;
import com.devcat.nucacola.member.model.vo.Project;

@Controller
public class ProfileController {

	
	@Autowired
	private MemberService mService;
	
	// 유저 프로필
		@RequestMapping("profile.us")
		public String profileUser() {
			
			return "user/userProfile";
		}
	
	/*
	 * // 지원 이력 조회
	 * 
	 * @RequestMapping() public String selectListCount() {
	 "undefined*
	 * 
	 * }
	 */
	
	// 한줄 소개 입력
	@RequestMapping("/insert.us")
	public String insertUserInfo(String UserInfo) {
		return "/main";
	}
	
	// 한줄 소개 수정
	@RequestMapping("/update.us")
	public String updateUserInfo(String UserInfo) {
		return "/main";
	}
	
	// 기술테이블 기술 체크
	@RequestMapping("/search.sk")
	public String searchSkill(String skillName) {
		return "/main";
	}

	// 활동 분야 입력
	@RequestMapping("/insert.field.us")
	public String insertUserField(int skillNo) {
		return "/main";
	}
	// 활동 분야 수정
	@RequestMapping("/update.field.us")
	public String updateUserField(int skillNo) {
		return "/main";
	}
	
	// 업무 분야 입력
	@RequestMapping("/insert.position.us")
	public String  insertUserPosition(String UserPosition) {
		return "/main";
	}
	// 업무 분야 수정
	@RequestMapping("/update.position.us")
	public String updateUserPosition(String UserPosition) {
		return "/main";
	}
	// 프로젝트 입력
	@RequestMapping("/insert.project.us")
	public String insertProject(Project p) {
		return "/main";
	}
	// 프로젝트 수정
	@RequestMapping("/update.project.us")
	public String updateProject(Project p) {
		return "/main";
	}
	
	// 최종학력 입력
	@RequestMapping("/insert.edu.us")
	public String insertUserEdu(String UserEdu) {
		return "/main";
	}
	// 최종학력 수정
	@RequestMapping("/update.edu.us")
	public String updateUserEdu(String UserEdu) {
		return "/main";
	}
	// 경력 입력
	@RequestMapping("/insert.career.us")
	public String insertCareer(Carrer c) {
		return "/main";
	}
	// 경력 수정
	@RequestMapping("/update.career.us")
	public String updateCareer(Carrer c) {
		return "/main";
	}
	
	// 처음 프로필 진입 시 인맥 불러오기
	@RequestMapping("initConnection.us")
	public String selectConnectionList(@RequestParam(value="currentPage",defaultValue="1") int currentPage,Member m, Model model){
		
		
		//팔로워, 팔로잉, 연결 리스트들의 count를 가져온다.
		int countFollowers=mService.countFollowers(m.getUserNo());
		int countFollowings=mService.countFollowings(m.getUserNo());
		int countConnections=mService.countConnections(m.getUserNo());
		
		//뷰에서 쓰일 팔로워,팔로잉,연결에 대한 페이지인포객체 세팅
		PageInfo frPi=Pagination.getPageInfo(countFollowers, currentPage, 1, 3);
		PageInfo fgPi=Pagination.getPageInfo(countFollowings, currentPage, 1, 3);
		PageInfo cnPi=Pagination.getPageInfo(countConnections, currentPage, 1, 3);
		
		//팔로워,팔로잉,연결 리스트를 각각의 페이지정보만큼 가져온다.
		ArrayList<Member> followers = mService.selectFollowers(m.getUserNo(),frPi);
		ArrayList<Member> followings = mService.selectFollowings(m.getUserNo(),fgPi);
		ArrayList<Member> connections = mService.selectConnections(m.getUserNo(),cnPi);
		
		//위에서 생성한 리스트들을 담을 HashMap을 선언하고
		HashMap<String,ArrayList<Member>> pCon = new HashMap<>(); //personalConnection = 인맥
		
		//맞는 이름을 붙여 각 리스트를 담아준다.
		pCon.put("followers",followers);
		pCon.put("followings", followings);
		pCon.put("connections",connections);
		
		//뷰에서 쓰일 HashMap을 세팅하자.
		model.addAttribute("pCon", pCon);

		//뷰에서 쓰일 각각의 페이지객체를 세팅하자.
		model.addAttribute("frPi",frPi);
		model.addAttribute("fgPi",fgPi);
		model.addAttribute("cnPi",cnPi);
		
		return "user/userProfile";
	}
	
	//프로필 인맥 More버튼 클릭 시 실행될 컨트롤러
	@ResponseBody
	@RequestMapping(value="loadConnection.us",produces="application/json;charset=utf-8")
	public HashMap<String, ArrayList<?extends Object>> selectConnectionList2(Member m,int frCp,int fgCp, int cnCp, Model model){
		
		//frCp : 팔로워 현재페이지
		//fgCp : 팔로잉 현재페이지
		//cnCp : 연결 현재페이지
		
		
		//팔로워, 팔로잉, 연결된사람 수를 카운트한다.
		int countFollowers=mService.countFollowers(m.getUserNo());
		int countFollowings=mService.countFollowings(m.getUserNo());
		int countConnections=mService.countConnections(m.getUserNo());
		
		//뷰에서 쓰일 팔로워,팔로잉,연결에 대한 페이지인포객체 세팅
		PageInfo frPi=Pagination.getPageInfo(countFollowers, frCp, 1, 3);
		PageInfo fgPi=Pagination.getPageInfo(countFollowings, fgCp, 1, 3);
		PageInfo cnPi=Pagination.getPageInfo(countConnections, cnCp, 1, 3);
		
		//팔로워, 팔로잉, 연결된사람 리스트를 가져온다
		ArrayList<Member> followers = mService.selectFollowers(m.getUserNo(),frPi);
		ArrayList<Member> followings = mService.selectFollowings(m.getUserNo(),fgPi);
		ArrayList<Member> connections = mService.selectConnections(m.getUserNo(),cnPi);
		
		//뷰로 각각의 pi 객체를 넘겨줘야한다. (팔로잉, 팔로워, 연결)
		//ArrayList에 담아 넘겨주자.
		ArrayList<PageInfo> piBox = new ArrayList<>();
		piBox.add(frPi);
		piBox.add(fgPi);
		piBox.add(cnPi);

		
		//위에서 세팅된 값들을 HashMap에 넣어 뷰로 넘겨준다.
		//여기서 제네릭에 ?extends Object는 해당 HashMap에 여러가지 형태의 객체를 담기 위함이다.
		//"뭐가들어갈지 모르지만, Object객체를 상속하는 애들을 넣을거야"라는 뜻. 
		//Object가 최상위객체이므로 다넣겠단소리.
		HashMap<String,ArrayList<?extends Object>> pCon = new HashMap<>(); //personalConnection = 인맥
		
		pCon.put("followers", followers);
		pCon.put("followings", followings);
		pCon.put("connections", connections);
		pCon.put("piBox", piBox);
		
		return pCon;
	}

	
	
	
	
	
}
