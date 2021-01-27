package com.devcat.nucacola.member.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.devcat.nucacola.common.model.vo.PageInfo;
import com.devcat.nucacola.common.model.vo.Skills;
import com.devcat.nucacola.common.template.Pagination;
import com.devcat.nucacola.member.model.service.MemberService;
import com.devcat.nucacola.member.model.vo.Career;
import com.devcat.nucacola.member.model.vo.Member;
import com.devcat.nucacola.member.model.vo.Project;
import com.devcat.nucacola.member.model.vo.UserFiled;
import com.devcat.nucacola.posts.model.vo.Post;
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
			return "redirect:profile.me?userNo="+p.getUserNo();
		}else {
			model.addAttribute("errorMsg","입력실패");
			return "common/errorPage";
		}	
	}
	

	// 프로젝트 수정
	@RequestMapping("/delete.project.us")
	public String deleteProject(Project p,int userNo, int projectId, HttpSession session, Model model) {
		
		
		Project pj = new Project();
		// pj에 userNo과 projectId 값을 담아 delete요청
		pj.setProjectId(projectId);
		pj.setUserNo(userNo);	
		
		System.out.println(pj);
		int result = 0;
		result = mService.deleteProject(pj);
		System.out.println(result);
		
		if(result > 0) {
			System.out.println("삭제성공");
			return "redirect:profile.me?userNo="+p.getUserNo();
		}else {
			System.out.println("삭제실패");
			model.addAttribute("errorMsg","입력 실패");
			return "common/errorPage";
		}
		
		
	}
	
	// 최종학력 입력
	@RequestMapping("/update.edu.us")
	public String updateUserEdu(Member m, HttpSession session, Model model) {
		
		
		int result = mService.updateUserEdu(m);
		
		if(result > 0) {
			return "redirect:profile.me?userNo="+ m.getUserNo();
		}else {
			model.addAttribute("errorMsg","입력 실패");
			return "common/errorPage";
		}
		
	}
	

	// 경력 입력
	@RequestMapping("/insert.career.us")
	public String insertCareer(Career c, HttpSession session, Model model) {

		int result = mService.insertCareer(c);
		
		if(result >0) {
			return "redirect:profile.me?userNo="+c.getUserNo();
		}else {
			model.addAttribute("errorMsg","입력실패");
			return "common/errorPage";
			
		}
	}

	// 경력 수정
	@RequestMapping("/update.career.us")
	public String updateCareer(Career c) {
		return "/main";
	}
	
	
	
	
	//Test
	   //https://stackoverflow.com/questions/37359851/how-to-receive-html-check-box-value-in-spring-mvc-controller
	   //@RequestParam의 value는 넘어오는 input의 name속성과 맞춰주면됩니다
	   //required = false는 이 값이 안넘어와도 예외발생 안하도록해주는거에용
	   //https://velog.io/@hellozin/RequestParamrequired-false-%EC%A3%BC%EC%9D%98%ED%95%A0-%EC%A0%90
	/*
	 * @RequestMapping("testArray.us") public void testArray(@RequestParam(value =
	 * "colors", required = false)String[] arr) {
	 * 
	 * System.out.println("testArray.us 실행됨");
	 * 
	 * for(String e:arr){ System.out.println(e); }
	 * 
	 * }
	 */
	
	
	//준호작성
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
	
	
	//----팔로잉 리스트 페이지
	
	//준호작성
	//처음 페이지 로드 시 실행되는 컨트롤러
	@RequestMapping("initFollowing.us")
	public String initFollowing(@RequestParam(value="currentPage",defaultValue="1") int currentPage,int userNo, Model model) {
		
		//뷰에서쓰일 각각 개수 세팅
		int countFollowers = mService.countFollowers(userNo);
		int countFollowings = mService.countFollowings(userNo);
		int countConnections = mService.countConnections(userNo);
		
		model.addAttribute("countFollowers",countFollowers);
		model.addAttribute("countFollowings",countFollowings);
		model.addAttribute("countConnections",countConnections);
		
		//팔로잉하고있는 회원 수 저장
		int count = mService.countFollowings(userNo);
		
		//페이지인포객체 세팅
		PageInfo fgPi=Pagination.getPageInfo(count, currentPage, 1, 3);
		
		ArrayList<Member> following = mService.selectFollowings(userNo, fgPi);
		
		//뷰에서 쓰일 리스트카운트 세팅
		model.addAttribute("count",count);
		
		//뷰에서 쓰일 리스트 세팅
		model.addAttribute("following",following);
		
		//뷰에서 쓰일 페이지객체 세팅
		model.addAttribute("fgPi",fgPi);
		
		model.addAttribute("profileUserNo",userNo);
		
		Member pUser = mService.selectUserProfile(userNo);
		model.addAttribute("pUser",pUser);
		
		return "user/profile_following";
	}
	
	//준호작성
	//스크롤 내렸을 때 실행되는 컨트롤러
	@ResponseBody
	@RequestMapping(value="loadFollowingList.us",produces="application/json;charset=utf-8")
	public HashMap<String, ArrayList<?extends Object>> loadFollowingList(int userNo,int currentPage ){
		
		PageInfo pi=Pagination.getPageInfo(mService.countFollowings(userNo), currentPage, 1, 3);
		ArrayList<Member> following = mService.selectFollowings(userNo,pi);
		ArrayList<PageInfo> piBox = new ArrayList<>(); //HashMap으로 리턴하기 위해 pi객체를 한번 감싼다.
		piBox.add(pi);
		
		HashMap<String,ArrayList<?extends Object>> loadedInfo = new HashMap<>();
		
		loadedInfo.put("following",following);
		loadedInfo.put("piBox",piBox);
		
		return loadedInfo;
		
	}
	
	//----팔로워 리스트 
	//준호작성
	@RequestMapping("initFollower.us")
	public String initFollower(@RequestParam(value="currentPage",defaultValue="1") int currentPage,int userNo, Model model) {
		
		//뷰에서쓰일 각각 개수 세팅
		int countFollowers = mService.countFollowers(userNo);
		int countFollowings = mService.countFollowings(userNo);
		int countConnections = mService.countConnections(userNo);
		
		model.addAttribute("countFollowers",countFollowers);
		model.addAttribute("countFollowings",countFollowings);
		model.addAttribute("countConnections",countConnections);
		
		//팔로워수 저장
		int count = mService.countFollowers(userNo);
		
		//페이지인포객체 세팅
		PageInfo frPi=Pagination.getPageInfo(count, currentPage, 1, 3);
		
		ArrayList<Member> follower = mService.selectFollowers(userNo, frPi);
		
		System.out.println(follower.get(0).getUserAvatar());
		
		//뷰에서 쓰일 리스트카운트 세팅
		model.addAttribute("count",count);
		
		//뷰에서 쓰일 리스트 세팅
		model.addAttribute("follower",follower);
		
		//뷰에서 쓰일 페이지객체 세팅
		model.addAttribute("frPi",frPi);
		
		Member pUser = mService.selectUserProfile(userNo);
		model.addAttribute("pUser",pUser);
		

		return "user/profile_follower";
	}
	
	//스크롤 내렸을 때 실행되는 컨트롤러
	//준호작성
	@ResponseBody
	@RequestMapping(value="loadFollowerList.us",produces="application/json;charset=utf-8")
	public HashMap<String, ArrayList<?extends Object>> loadFollowerList(int userNo,int currentPage ){
		
		PageInfo pi=Pagination.getPageInfo(mService.countFollowers(userNo), currentPage, 1, 3);
		ArrayList<Member> follower = mService.selectFollowers(userNo,pi);
		ArrayList<PageInfo> piBox = new ArrayList<>(); //HashMap으로 리턴하기 위해 pi객체를 한번 감싼다.
		piBox.add(pi);
		
		HashMap<String,ArrayList<?extends Object>> loadedInfo = new HashMap<>();
		
		loadedInfo.put("follower",follower);
		loadedInfo.put("piBox",piBox);
		
		return loadedInfo;
		
	}
	
	//----연결된 사람 리스트
	//준호작성
	@RequestMapping("initConnect.us")
	public String initConnection(@RequestParam(value="currentPage",defaultValue="1") int currentPage,int userNo, Model model) {
		
		//뷰에서쓰일 각각 개수 세팅
		int countFollowers = mService.countFollowers(userNo);
		int countFollowings = mService.countFollowings(userNo);
		int countConnections = mService.countConnections(userNo);
		
		model.addAttribute("countFollowers",countFollowers);
		model.addAttribute("countFollowings",countFollowings);
		model.addAttribute("countConnections",countConnections);
		
		//팔로워수 저장
		int count = mService.countConnections(userNo);
		
		//페이지인포객체 세팅
		PageInfo cnPi=Pagination.getPageInfo(count, currentPage, 1, 3);
		
		ArrayList<Member> connection = mService.selectConnections(userNo, cnPi);
		
		//뷰에서 쓰일 리스트카운트 세팅
		model.addAttribute("count",count);
		
		//뷰에서 쓰일 리스트 세팅
		model.addAttribute("connection",connection);
		
		//뷰에서 쓰일 페이지객체 세팅
		model.addAttribute("cnPi",cnPi);
		
		Member pUser = mService.selectUserProfile(userNo);
		model.addAttribute("pUser",pUser);
		
		
		return "user/profile_connect";
	}
	//스크롤 내렸을 때 실행되는 컨트롤러
	//준호작성
	@ResponseBody
	@RequestMapping(value="loadConnectionList.us",produces="application/json;charset=utf-8")
	public HashMap<String, ArrayList<?extends Object>> loadConnectionList(int userNo,int currentPage ){
		
		PageInfo pi=Pagination.getPageInfo(mService.countConnections(userNo), currentPage, 1, 3);
		ArrayList<Member> connection = mService.selectConnections(userNo,pi);
		ArrayList<PageInfo> piBox = new ArrayList<>(); //HashMap으로 리턴하기 위해 pi객체를 한번 감싼다.
		piBox.add(pi);
		
		HashMap<String,ArrayList<?extends Object>> loadedInfo = new HashMap<>();
		
		loadedInfo.put("connection",connection);
		loadedInfo.put("piBox",piBox);
		
		return loadedInfo;
		
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
	// 프로필 내가 작성한 post
	@RequestMapping("/profilePost.us")
	public String memberProfilePost(@RequestParam(value="currentPage",defaultValue="1") int currentPage,int userNo,Model model) {

			Member pUser = mService.selectUserProfile(userNo);
			
			model.addAttribute("pUser",pUser);
			
			//-----------------인맥정보 불러오기-------------
			//팔로워, 팔로잉, 연결 리스트들의 count를 가져온다.
			//뷰에서 쓰일 팔로워,팔로잉,연결에 대한 페이지인포객체 세팅
			int countFollowers = mService.countFollowers(userNo);
			int countFollowings = mService.countFollowings(userNo);
			int countConnections = mService.countConnections(userNo);
			
			model.addAttribute("countFollowers",countFollowers);
			model.addAttribute("countFollowings",countFollowings);
			model.addAttribute("countConnections",countConnections);
			
			int myPostCount=mService.myPostCount(userNo);
			PageInfo pi=Pagination.getPageInfo(myPostCount,currentPage, 10, 4);
			ArrayList<Post> list = mService.myPostList(userNo,pi);
			System.out.println(list);
			model.addAttribute("plist",list);
			return "/user/userProfilePost";
			
			
		}
	// 프로필 내가 작성한 post 페이징처리
	@ResponseBody
	@RequestMapping(value="profilePostLoad.us",produces="application/json;charset=utf-8")
	public HashMap<String, Object> postLoad(@RequestParam(value="currentPage",defaultValue="1") int currentPage,int userNo,Model model) {
		

		Member pUser = mService.selectUserProfile(userNo);
		
		model.addAttribute("pUser",pUser);
 
		
		int myPostCount=mService.myPostCount(userNo);
		PageInfo pi=Pagination.getPageInfo(myPostCount,currentPage, 1, 4);
		ArrayList<Post> list = mService.myPostList(userNo,pi);

		HashMap<String, Object> result=new HashMap<>();
		result.put("plist",list);
		return result;
		
	}
	// 프로필 내가 작성한 post 삭제
	@ResponseBody
	@RequestMapping(value="postCancle.us",produces="application/json;charset=utf-8")
	public int PostCancle(@RequestParam(value="currentPage",defaultValue="1") int currentPage,int postNo, Model model) {
		
		int result = mService.myPostDelete(postNo);
		return result;
		
		
	}
	
	// 프로필 내가 작성한 post 수정
		@RequestMapping("/postUpdate.us")
//		@RequestMapping(value="postUpdate.us",produces="application/json;charset=utf-8")
		public String postUpdate(Post p,Model model) {
			System.out.println(p);
			int uno = p.getUserNo();
			int result = mService.myPostUpdate(p);
			if(result>0) {
				return "redirect:/profilePost.us?userNo="+uno;
			}else {
				
				model.addAttribute("errorMsg","수정 실패");
				return "common/errorPage";
			}
//		    System.out.println("삭제되었나요?"+result);
//			redirectAttributes.addAttribute("userNo",p.getUserNo());			

			
			
		}
	
	
	
	// 프로필 좋아요한 post
		@RequestMapping("profileLikePost.us")
		public String profileLikePost(@RequestParam(value="currentPage", defaultValue="1") int currentPage,
				 Member m,Model model,HttpSession session) {
			
			int uno = m.getUserNo();
			int plistCount = mService.countLikePost(uno);
			
			PageInfo pi = Pagination.getPageInfo(plistCount, currentPage,1,4);
			
			
			ArrayList<Post> plist = mService.selectLikePost(pi, uno);
			
			Member pUser = mService.selectUserProfile(uno);
			model.addAttribute("pUser",pUser);
			
			model.addAttribute("pi", pi);
			model.addAttribute("plist", plist);
			return "/user/profile_likePost";
			
			
			
			
			/*
			
			//-----------------인맥정보 불러오기-------------
			//팔로워, 팔로잉, 연결 리스트들의 count를 가져온다.
			//뷰에서 쓰일 팔로워,팔로잉,연결에 대한 페이지인포객체 세팅
			int countFollowers = mService.countFollowers(userNo);
			int countFollowings = mService.countFollowings(userNo);
			int countConnections = mService.countConnections(userNo);
			
			model.addAttribute("countFollowers",countFollowers);
			model.addAttribute("countFollowings",countFollowings);
			model.addAttribute("countConnections",countConnections);
			
			return "/user/profile_likePost";
			 */
			
		}
		
	
	
}
