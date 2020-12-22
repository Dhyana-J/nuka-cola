package com.devcat.nucacola.member.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.devcat.nucacola.common.model.vo.PageInfo;
import com.devcat.nucacola.common.model.vo.Skills;
import com.devcat.nucacola.common.template.Pagination;
import com.devcat.nucacola.member.model.service.MemberService;
import com.devcat.nucacola.member.model.vo.Carrer;
import com.devcat.nucacola.member.model.vo.Member;
import com.devcat.nucacola.member.model.vo.Project;
import com.devcat.nucacola.member.model.vo.UserFiled;
import com.google.gson.Gson;

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
	@RequestMapping("/update.us")
	public String updateUserInfo(Member m, HttpSession session, Model model) {
		
		int result = mService.updateUserInfo(m);
		
		if(result>0) {

			
			return "redirect:profile.me?userNo="+m.getUserNo();
			
		}else {
			
			model.addAttribute("errorMsg","수정 실패..");
			return "common/errorPage";
		}
		
		
	}
	
	
	// 기술테이블 기술 체크
	@ResponseBody
	@RequestMapping(value="/search.sk", produces="application/json; charset=utf-8")
	public String searchSkill(String skillName,Model model) {
		
		//System.out.println(skillName);
		
		ArrayList<Skills> list = mService.checkSkill(skillName);
		
		//System.out.println(list);
		
		
		return new Gson().toJson(list);
		
	}
	
	

	// 활동 분야 입력
	@ResponseBody
	@RequestMapping(value="/insert.field.us", produces="application/json; charset=utf-8")
	public String insertUserField(String skillName, int userNo) {
		
		//System.out.println(skillName);
		//System.out.println(userNo);

		// 넘어온 기술들을 쪼개서 배열에 담아줌
		String[] arr = skillName.split(" ");
		
		
		
		// 기술 번호를 알아오기 위한 list
		ArrayList<Skills> list = new ArrayList<>();
		
		// hasMap으로 넘기기 위한 기술번호를 담을 list
		ArrayList<Integer> skillsNo = new ArrayList<>();
		
		// 기술 번호 알아오는 리스트(기술번호, 기술이름 다 가져옴)
		list = mService.getSkillNo(arr);
		
		
		// 반복문으로 기술 번호 담아주기
		for(int i=0; i<list.size(); i++) {
			
			skillsNo.add(list.get(i).getSkillNo());
		}
		
		System.out.println(list);
		
		
		HashMap<String, Object> hm = new HashMap<String, Object>();
		
		hm.put("userNo", userNo);
		hm.put("skillsNo",skillsNo);
		
		System.out.println(hm);
		
		// 유저 필드에 기술번호를 담아줌
		int result = mService.insertUserFiled(hm);
		
		ArrayList<String> skillNameList = new ArrayList<>(); 
		
		if (result>0) {
			
			for(int i = 0; i<list.size(); i++) {
				System.out.println(list.get(i).getSkillName());
				skillNameList.add(list.get(i).getSkillName());
			}

		}
		
		
		return new Gson().toJson(skillNameList);	
		
	}
	
	// 
	@ResponseBody
	@RequestMapping(value="/delete.field.us", produces="text/html; charset=utf-8")
	public String deleteUserFiled(int userNo, String skillName) {
		
		String[] arr = {skillName};
		//스킬번호 알아오기
		ArrayList<Skills> list = mService.getSkillNo(arr);
		
		System.out.println(list);
		
		// 지울 스킬번호와 유저 번호 정보 넣어주기
		UserFiled uf = new UserFiled();
		
		uf.setUserNo(userNo);
		uf.setSkillNo(list.get(0).getSkillNo());
		
		System.out.println(uf);
		
		int result = mService.deleteUserFiled(uf);
		
		if(result>0) {
			
			return new Gson().toJson("삭제 성공");
		}else {
			return new Gson().toJson("삭제 실패");
		}
		
	}
	


	// 업무 분야 수정
	@RequestMapping("/update.position.us")
	public String updateUserPosition(Member m, HttpSession session, Model model) {
		
		int result = mService.updateUserPosi(m);
		
		if(result>0) {
			
			Member loginUser = mService.loginMember(m);
			
			session.setAttribute("loginUser", loginUser);
			
			return "redirect:profile.me?userNo="+loginUser.getUserNo();
			
			
		}else {
			
			model.addAttribute("errorMsg","수정 실패..");
			return "common/errorPage";
			
		}
		
	}
	
	
	// 프로젝트 입력
	@RequestMapping("/insert.project.us")
	public String insertProject(Project p, Model model) {
		
		int result = mService.insertProject(p);
		
		if(result >0) {
			return "redirect:profile.me";
		}else {
			model.addAttribute("errorMsg","입력실패");
			return "common/errorPage";
		}
		
	}
	
	// 프로젝트 수정
	@RequestMapping("/update.project.us")
	public String updateProject(Project p, HttpSession session, Model model) {
		
		int result = mService.updateProject(p);
		
		if(result > 0) {

			return "redirect:profile.me";
		}else {
			model.addAttribute("errorMsg","입력 실패");
			return "common/errorPage";
		}
		
		
	}
	
	// 최종학력 입력
	@RequestMapping("/update.edu.us")
	public String updateUserEdu(Member m, HttpSession session, Model model) {
		
		
		int result = mService.updateUserEdu(m);
		
		
		if(result > 0) {
			
			Member loginUser = new Member();
			loginUser = mService.loginMember(m);
			
			session.setAttribute("loginUser", loginUser);
			
			return "redirect:profile.me";
			
		}else {
			model.addAttribute("errorMsg","입력 실패");
			
			return "common/errorPage";
		}
		
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

	
	
	
	@RequestMapping("insert.ava")
	public void insertAvatar(MultipartFile upfile, int userNo) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			
			
			Member m = new Member();
			
			String userAvatar = "resources/assets/" + upfile.getOriginalFilename();
			
			m.setUserAvatar(userAvatar);
			m.setUserNo(userNo);
			
			int result = mService.insertAvatar(m);
			
			
		}
		
		
	}
	
	
	
	
}
