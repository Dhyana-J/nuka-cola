package com.devcat.nucacola.member.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.devcat.nucacola.common.model.vo.PageInfo;
import com.devcat.nucacola.common.model.vo.Skills;
import com.devcat.nucacola.common.template.Pagination;
import com.devcat.nucacola.member.model.service.MemberService;
import com.devcat.nucacola.member.model.service.MemberServiceImpl;
import com.devcat.nucacola.member.model.vo.Career;
import com.devcat.nucacola.member.model.vo.Member;
import com.devcat.nucacola.member.model.vo.Project;

@Controller
public class SignupController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private MemberServiceImpl mailsender;//이메일인증전용

	// 로그인 폼 화면 띄우기
	@RequestMapping("loginForm.me")
	public String loginForm() {
		return "user/login";
	}
	
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m, HttpSession session, ModelAndView mv, HttpServletRequest request) {
		
		Member loginUser = mService.loginMember(m);
			
		//System.out.println(bcryptPasswordEncoder.encode(m.getUserPwd()));
		
		
		
		if (loginUser != null 
								 && bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd()) &&
								 loginUser.getEmailAuth().equals("Y")
								 ) {
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("redirect:/list.pos");
			System.out.println("로그인");
			
			
		}else if(loginUser != null && bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
			
			mailsender.mailSendWithUserKey(loginUser,request);
			session.setAttribute("alertMsg", "작성해주신 이메일로 회원가입 인증메일을 보냈습니다. 인증을 완료해주세요!");
			mv.setViewName("redirect:/");
			
		}else {
			mv.addObject("errorMsg", "로그인 실패!");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		
		if(session.getAttribute("access_Token") != null) {
			
			session.removeAttribute("access_Token");	
		}
		
		
		session.invalidate();
		return "user/login";
	}
	
	
	//회원가입 폼 화면 띄우기
	@RequestMapping("signupForm.me")
	public String signupForm() {
		return "user/signup";
	}
	
	
	@RequestMapping("insert.me")
	public String insertMember(Member m, Model model, HttpSession session, HttpServletRequest request) {
		
		
		// 회원가입 시 입력한 비밀번호 암호화
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		m.setUserPwd(encPwd);
		
		
		int result = mService.insertMember(m);
		
		
		
		if(result>0) {//회원가입 성공
			
			//인증메일 보내기 메소드
			mailsender.mailSendWithUserKey(m,request);
			
			session.setAttribute("alertMsg", "작성해주신 이메일로 회원가입 인증메일을 보냈습니다. 인증을 완료해주세요!");
			return "redirect:/";
			
		}else {//회원가입 실패
			
			model.addAttribute("errorMsg","회원가입 실패!");
			return "common/errorPage";
			
		}
		
	}
	
	@ResponseBody
	@RequestMapping("checkEmail.me")
	public String checkEmail(String email, HttpServletResponse response) {
		
		return mService.checkEmail(email);
		
	}
	
	
	//인증메일 받고 인증 링크 누르면 실행되는 메소드 
	@RequestMapping("confirmEmail.me")
	public String confirmEmail(Member m,Model model, HttpSession session) {
		
		System.out.println("컨펌이메일 실행");
		
		//DB에 auth값을 Y로 변경해주자
		
		int result = mailsender.confirmEmail(m);
		
		if(result>0) {
			session.setAttribute("alertMsg", "인증이 완료되었습니다! 로그인해주세요 환영합니다 :)");
			return "redirect:/";
		}else {
			model.addAttribute("errorMsg","이메일인증 실패");
			return "common/errorPage";
		}
	}
	
	
	// 유저 프로필
	@RequestMapping("profile.me")
	public String profileUser(@RequestParam(value="currentPage",defaultValue="1") int currentPage,int userNo, Model model) {
		
		// 유저 정보 전부 가져오기
		Member pUser = mService.selectUserProfile(userNo);
		// 기술 이름 따로 가져옴
		ArrayList<Skills> skillList = mService.selectUserSkill(userNo);
		
		//유저 프로젝트 정보
		ArrayList<Project> projectList = mService.selectProjectList(userNo); 
		
		//유저경력을 가져오는  select문
		ArrayList<Career> careerList = mService.selectCareerList(userNo);
		//기업식별자를 알아오는 select문 
		//Company compNo = mService.selectComNo(userNo);
		
		
		// 팔로잉 수 알아오기
		//int followingCount = mService.countFollowing(userNo);
		// 팔로워 수 알아오기
		//int followerCount = mService.countFollower(userNo);
		// 연결 수 알아오기
		//int connectionCount = mService.countConnection(userNo);
		
		model.addAttribute("pUser",pUser);
		model.addAttribute("skillList",skillList);
		model.addAttribute("projectList", projectList);
		model.addAttribute("careerList",careerList);
		
		//-----------------인맥정보 불러오기-------------
		//팔로워, 팔로잉, 연결 리스트들의 count를 가져온다.
		//뷰에서 쓰일 팔로워,팔로잉,연결에 대한 페이지인포객체 세팅
		int countFollowers = mService.countFollowers(userNo);
		int countFollowings = mService.countFollowings(userNo);
		int countConnections = mService.countConnections(userNo);
		
		model.addAttribute("countFollowers",countFollowers);
		model.addAttribute("countFollowings",countFollowings);
		model.addAttribute("countConnections",countConnections);
		
		
		PageInfo frPi=Pagination.getPageInfo(countFollowers, currentPage, 1, 3);
		PageInfo fgPi=Pagination.getPageInfo(countFollowings, currentPage, 1, 3);
		PageInfo cnPi=Pagination.getPageInfo(countConnections, currentPage, 1, 3);


		//리스트들을 담을 HashMap을 선언하고
		HashMap<String,ArrayList<Member>> pCon = new HashMap<>(); //personalConnection = 인맥

		//팔로워,팔로잉,연결 리스트를 각각의 페이지정보만큼 가져온다.
		//맞는 이름을 붙여 각 리스트를 담아준다.
		pCon.put("followers",mService.selectFollowers(userNo,frPi));
		pCon.put("followings", mService.selectFollowings(userNo,fgPi));
		pCon.put("connections",mService.selectConnections(userNo,cnPi));

		//뷰에서 쓰일 HashMap을 세팅하자.
		model.addAttribute("pCon", pCon);

		//뷰에서 쓰일 각각의 페이지객체를 세팅하자.
		model.addAttribute("frPi",frPi);
		model.addAttribute("fgPi",fgPi);
		model.addAttribute("cnPi",cnPi);
		
		
		
		return "user/userProfile";
	}
	
	
	   //카카오 로그인 
	@RequestMapping(value="kakaologin.me")
	public String login(@RequestParam("code") String code, HttpSession session, Model model) {
		  System.out.println("code : " + code);
		  
		  //2020.12.15 정찬복 카카로 로그인 토큰값 얻어오기
	      String access_Token = mService.getAccessToken(code);
	      
	      //2020.12.15 정찬복 토큰값으로 아이디용 이메일과 이름 얻어오기
	      HashMap<String, Object> userInfo = mService.getUserInfo(access_Token);
	      
	      System.out.println("login Controller : " +  userInfo);
	      
	      //2020.12.15 정찬복 유효성 검사, email을 잘 얻어오는지 확인
	      if (userInfo.get("email") != null) {
	    	  
	    	  session.setAttribute("kakoId", userInfo.get("email"));

	    	  
	    	  //2020.12.15 Member 객체에 담아서 DB에 저장할 예정
	    	  Member m = new Member();
	    	  
	    	  m.setEmail((String)userInfo.get("email"));
	    	  m.setUserName((String)userInfo.get("nickname"));
	    	  m.setLoginType("kakao");
	    	  m.setEmailAuth("Y");
	    	  
	    	  int result = mService.insertKakaoUser(m);
	    	  //2020.12.15 잘 insert 되었는지 확인 및 알림
	    	  if(result>0) {
	    		  session.setAttribute("alertMsg", "카카오 로그인이 완료되었습니다! 환영합니다 :)");
	    		  return "redirect:/";
	    		  
	    		  
	    	  }else {
	    		  
	    		model.addAttribute("errorMsg","로그인 실패");
	  			return "common/errorPage";
	    	  }
	    	  
	      }
	      
	      model.addAttribute("errorMsg","로그인 실패");
			return "common/errorPage";
     
	   }
	
		/*
		 * // 비밀번호 찾는 구문
		 * 
		 * @RequestMapping(value="findPass.me") public String findPass(Member m,
		 * RedirectAttributes redirectattr, Model model) {
		 * 
		 * // 전달받는 이메일값 저장 String email = m.getEmail(); // 전달한 회원의 식별자 int result =
		 * mService.findPass(email);
		 * 
		 * 
		 * 
		 * return ""; }
		 */
	
	
}

