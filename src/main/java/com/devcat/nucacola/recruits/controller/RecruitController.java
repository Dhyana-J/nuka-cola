package com.devcat.nucacola.recruits.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.devcat.nucacola.common.model.vo.PageInfo;
import com.devcat.nucacola.common.model.vo.Skills;
import com.devcat.nucacola.common.template.Pagination;
import com.devcat.nucacola.company.model.service.CompanyService;
import com.devcat.nucacola.company.model.vo.Industries;
import com.devcat.nucacola.member.model.service.MemberService;
import com.devcat.nucacola.member.model.vo.Bookmark;
import com.devcat.nucacola.member.model.vo.Member;
import com.devcat.nucacola.recruits.model.service.RecruitService;
import com.devcat.nucacola.recruits.model.vo.Apply;
import com.devcat.nucacola.recruits.model.vo.ApplyList;
import com.devcat.nucacola.recruits.model.vo.Counsel;
import com.devcat.nucacola.recruits.model.vo.Declare;
import com.devcat.nucacola.recruits.model.vo.Recruit;
import com.devcat.nucacola.recruits.model.vo.RecruitDetail;
import com.devcat.nucacola.recruits.model.vo.RecruitManage;
import com.devcat.nucacola.recruits.model.vo.RecruitSkill;
import com.devcat.nucacola.recruits.model.vo.UserCareer;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

@Controller
public class RecruitController {
	@Autowired
	private RecruitService rService;
	
	@Autowired
	private CompanyService cService;
	
	
	@Autowired
	private MemberService mService;

	// 채용상세페이지
	@RequestMapping("detail.re")
	public String selectRecruit(int rno, Model model) {
		System.out.println(rno);

		RecruitDetail info = rService.selectRecruitDetail(rno);
		ArrayList<RecruitSkill> skillList = rService.selectRecruitSkill(rno);
		int appliesCount = rService.selectAppliesCount(rno);

		System.out.println(info);
		System.out.println(skillList);
		model.addAttribute("info",info);
		model.addAttribute("skills",skillList);
		model.addAttribute("appliesCount",appliesCount);
		return "/recruit/recruitDetail";
	}

	@ResponseBody
	@RequestMapping("declare.re")
	public String insertReply(int rno, String declareTitle, HttpSession session){
		System.out.println(rno+"////"+declareTitle);
		Member m= (Member) session.getAttribute("loginUser");
		Declare d = new Declare();
		d.setDeclareTitle(declareTitle);
		d.setRecruitNo(rno);
		d.setUserNo(m.getUserNo());
		int result = rService.insertDeclare(d);
		if(result > 0){
			return "success";
		}else{
			return "fail";
		}
	}

	//지원 상세조회
	@RequestMapping("detail.ap")
	public String selectApplyDetail(int ano, Model model){
		
		System.out.println(ano);
		
		Apply apply = rService.selectApplyDetail(ano);
		
		System.out.println(apply);
		
		int uno = apply.getUserNo();
		
		ArrayList<RecruitSkill> skillList = rService.selectUserSkills(uno);
		ArrayList<UserCareer> careerList = rService.selectCareers(uno);
		
		System.out.println(skillList);
		System.out.println(careerList);
		
		
		model.addAttribute("a",apply);
		model.addAttribute("s",skillList);
		model.addAttribute("c",careerList);
		
		return "/apply/applyDetail";
	}

	// 단계변경
	@RequestMapping(value="changeprog.ap" ,method = RequestMethod.GET)
	public String changeProgress(int rno,int number){
		System.out.println(rno);
		RecruitSkill rp = new RecruitSkill();
		rp.setRecruitNo(rno);
		rp.setSkillNo(number);
		rService.changeProgress(rp);
		System.out.println("redirect:/detail.ap?ano="+rno);
		return "redirect:/detail.ap?ano="+rno;
	}


	// 지원한 내역조회
	@RequestMapping("list.ap")
	public String selectApplyList(int userNo, Model model) {
		
		// 조회할 채용정보가져오기
		ArrayList<ApplyList> applyList = rService.selectApplyList(userNo);
		int applyCount = rService.selectApplyCount(userNo);
		System.out.println(applyList);
		System.out.println(applyCount);

		int submitState = 0;
		int passState = 0;
		int joinState = 0;
		int failState = 0;
		
		for(ApplyList al : applyList) {
			
			if(al.getApplyProg() == 0) { //채용조건이 0이라면 서류접수에 1 		
				submitState++;				
			}else if(al.getApplyProg() == 1) { // 채용조건이 1이라면 서류합격에 1
				passState++;
			}else if(al.getApplyProg() == 2) { // 채용조건이 2라면 팀 합류에 1
				joinState++;
			}else {								// 채용조건이 3이라면 탈락에 1
				failState++;
			}

		}
		
		// applylist에 담아 model에 넣고 뿌려주기
		model.addAttribute("submitState", submitState);
		model.addAttribute("passState",passState);
		model.addAttribute("joinState", joinState);
		model.addAttribute("failState",failState);
		model.addAttribute("applyList", applyList);
		model.addAttribute("applyCount",applyCount);

		
		return "/apply/applyHistory";
			
	}
	
	
	// 지원한 내역 삭제하기(지원취소)
	@ResponseBody
	@RequestMapping(value="/delete.ap", produces="text/html; charset=utf-8")
	public void deleteApplyList(int userNo, int recruitNo) {
		
		// 새로운 ap 생성자 생성
		Apply ap = new Apply();
		// ap에 userNo와 recruitNo 담기
		ap.setUserNo(userNo);
		ap.setRecruitNo(recruitNo);
		
		System.out.println(ap);
		int result = rService.deleteApplyList(ap);
		
		if(result > 0) {
			System.out.println("삭제성공");
		}else {
			System.out.println("삭제실패");
		}
		
		//return "redirect:list.ap?userNo="+loginUser.getUserNo();
	}

	
	@RequestMapping("recruitEnroll.re")
	public String recruitEnroll() {
		
		return "/recruit/recruitEnrollForm";
	}
	
	
	@RequestMapping("recruitInsert.re")
	public String insertRecruit(Recruit re, int userNo,MultipartFile upfile, float minSal, float maxSal) {
				
		//System.out.println(re);

		int compNo = rService.selectCompNo(userNo);

		System.out.println(compNo);
		re.setCompNo(compNo);

		re.setRecruitMinSal((int)minSal);
		re.setRecruitMaxSal((int)maxSal);

		int result1 = rService.insertRecruit(re);

		if (result1 > 0) {
			//System.out.println("삽입 성공!");
			
			int recruitNo = rService.selectRecruitNo(re); 
			String[] skillList = re.getSkillList().get(0).getSkillName().split(" ");
			
			HashMap<String, Object> recruitMap = makeMap(skillList,recruitNo);
			//System.out.println(recruitMap);
			
			int recruitSuccess = rService.insertRecruitSkill(recruitMap);
			
			if(recruitSuccess>0) {
				
				return "redirect:list.re";
			}
		}
		
		return "redirect:list.re";
	}


	// 채용관리 페이지
	@RequestMapping("manageDetail.re")
	public String selectRecruitManageDetail(int rno, Model model) {
		
		// 지원자 조회를 위한 ArrayList
		ArrayList<RecruitManage> manageList = rService.selectRecruitManageDetail(rno);
		int bookmarkCount = rService.selectBookmarkCount(rno);
		System.out.println(bookmarkCount);
		// 지원자 수 조회를 위한 변수
		int appliesCount = rService.selectAppliesCount(rno);
		
		//String endDate = new SimpleDateFormat("yyyy/MM/dd").format(new Date());
		// manageList에서 date값 뽑기

		System.out.println(manageList);

		int submitState = 0;
		int passState = 0;
		int joinState = 0;
		int failState = 0;
		for(RecruitManage al : manageList) {
			
			if(al.getApplyProg() == 0) { //채용조건이 0이라면 서류접수에 1 		
				submitState++;				
			}else if(al.getApplyProg() == 1) { // 채용조건이 1이라면 서류합격에 1
				passState++;
			}else if(al.getApplyProg() == 2) { // 채용조건이 2라면 팀 합류에 1
				joinState++;
			}else {								// 채용조건이 3이라면 탈락에 1
				failState++;
			}
		
		}
		model.addAttribute("submitState",submitState);
		model.addAttribute("passState",passState);
		model.addAttribute("joinState",joinState);
		model.addAttribute("failState",failState);
		model.addAttribute("appliesCount",appliesCount);
		model.addAttribute("manageList",manageList);
		return "/recruit/recruitManageDetail";
	}
	

	//------------- 채용검색 페이지 -------------
	//맨 처음 보이는 채용검색 화면 
	@RequestMapping("list.re")
	public String recruitSearch(@RequestParam(value="currentPage",defaultValue="1") int currentPage, Model model,HttpSession session) {
		
		//채용검색 진입시 로그인된 유저가 채용관리자거나 회사대표인 경우 채용등록버튼 표시해줘야한다.
		//그걸 위해 변수 세팅해주자.
		Member m = (Member)session.getAttribute("loginUser");
		if(m!=null) {
			
			int isManager = rService.isManager(m.getUserNo());
			if(isManager>0) {
				model.addAttribute("isManager",isManager);
			}
			
			//로그인 상태로 채용검색 페이지 진입시 유저가 북마크한 채용공고 번호 리스트 추출
			ArrayList<String> bookMarkNoList = rService.selectBookMarkNoList(m.getUserNo());
			model.addAttribute("bookMarkNoList",bookMarkNoList);
			
		}
		
		
		
		
		//***셀렉트박스 option 세팅***
		//산업분야
		ArrayList<Industries> industryList = cService.selectIndustryList();
		model.addAttribute("industryList",industryList);
		
		//테크스택
		ArrayList<Skills> skillList = rService.selectSkillList();
		model.addAttribute("skillList",skillList);
		
		//지역검색
		ArrayList<String> locationList = rService.selectLocationList();
		model.addAttribute("locationList",locationList);

		
		//채용공고리스트 Logic
		//채용공고테이블의 기업번호들 distinct로 가져와 배열에 담는다. 이렇게하면 채용공고 있는 회사번호리스트 만들어짐.
		//회사번호 리스트 순회하면서 각 기업번호별로 회사테이블에서 회사정보랑 채용리스트 조회해서 각각 HashMap에 담는다.
		//그 HashMap을 recruitInfoList에 add한다. 
		
		//***채용공고리스트***
		//PageInfo에 쓰일 채용진행중인 회사 수 조회
		int compCount = rService.selectCompCount();
		PageInfo pi = Pagination.getPageInfo(compCount, currentPage, 1, 1);
		
		ArrayList<HashMap<String, Object>> recruitInfoList = new ArrayList<>();	//채용정보(하나의 회사정보+그 회사가 진행중인 채용정보들)담을 ArrayList 
		ArrayList<String> cnoList = rService.selectCnoList(pi); //채용공고 한 개 이상 게시한 회사번호들 가져온다. 페이징처리는 회사갯수기준으로한다.
		
		for(String cno : cnoList) {
			
			HashMap<String, Object> recruitInfo = new HashMap<>();
			ArrayList<Industries> compIndusList = cService.selectCompanyIndustryList(Integer.parseInt(cno));//회사 산업분야저장
			
			recruitInfo.put("company",cService.selectCompany(Integer.parseInt(cno)));//HashMap에 회사정보 담음
			recruitInfo.put("industries",compIndusList);//회사 산업분야정보 담음
			recruitInfo.put("recruitList",rService.selectRecruitList(Integer.parseInt(cno)));//HashMap에 해당회사채용공고리스트 담음
			recruitInfoList.add(recruitInfo);//채용정보리스트에 회사정보+그회사채용리스트 해쉬맵 담음
		}
		
		model.addAttribute("recruitInfoList",recruitInfoList);
		
		return "recruit/recruitSearch";
	}
	
	
	
	
	// 채용식별자, 기술번호를 담는 해시맵 만들어주는 메소드~
	private HashMap<String, Object> makeMap(String[] skillList, int recruitNo) {
		
		// 기술 번호를 알아오기 위한 리스트 생성
		ArrayList<Skills> list = new ArrayList<>();
		//hashMap에 넣을 기술번호들을 담을 리스트 생성
		ArrayList<Integer> skillsNo = new ArrayList<>();
		
		//기술이름 => 기술번호, 기술 이름 알아옴
		list = mService.getSkillNo(skillList);
		
		for(int i =0; i<list.size(); i++) {
			// 기술번호만 골라서 skillNo 담아준다!
			skillsNo.add(list.get(i).getSkillNo());
		}
		
		// 채용식별자와, 기술번호를 한번에 담은 해시맵이다 이마리야
		HashMap<String, Object> ts = new HashMap<String, Object>();
		
		ts.put("recruitNo", recruitNo);
		ts.put("skillsNo",skillsNo);
		
		return ts;
	}

	
	//스크롤 내렸을 때 실행되는 컨트롤러
	@ResponseBody
	@RequestMapping(value="loadMoreList.re",produces="application/json; charset=utf-8")
	public HashMap<String, Object> loadSearchedList(@RequestParam(value="currentPage",defaultValue="1") int currentPage,String rawKeywordList){
		
		
		System.out.println("============controller============");
		
		HashMap<String,Object> container = new HashMap<>(); //뷰에 최종적으로 넘겨줄 객체(pi, keywordList 담김)
		
		HashMap<String, ArrayList<String>> keywordList = null;
		
		
		if(rawKeywordList!=null) { //넘어온 키워드값이 있으면 Map객체로 변환해준다.
			ObjectMapper mapper = new ObjectMapper(); //String을 객체로 변환하기위한 mapper
			try {
				keywordList = mapper.readValue(rawKeywordList, HashMap.class); //넘어온 rawKeywordList를 Map형식의 객체로 바꿔준다.
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		System.out.println("넘어온 json 변환 전값 : ");
		System.out.println(rawKeywordList);
		System.out.println("변환 후값 : ");
		System.out.println(keywordList);
		
		
		//keywordList가 모두 빈 채로 검색요청 들어온 경우
		
		//검색어는 빈문자열로 넘어올 수 있으니 공백이나 빈문자열로 오면 clear해주자
		//검색버튼 누르면 빈문자열로 넘어오지만, 정렬버튼누르면 null값이 넘어온다. null아니면서 빈문자열인 경우 처리해줘야함
		if(keywordList!=null) {
			
			System.out.println("전처리 진입 및 수행");
			
			if(!keywordList.get("keyword").isEmpty()) {
				
				if(keywordList.get("keyword").get(0).trim().equals("")) {
					System.out.println("키워드 무의미한값 clear 진행");
					keywordList.get("keyword").clear();
				}
			}
			
			boolean isEmpty = false;
			
			if(keywordList.get("alignOption")!=null) { //정렬버튼 눌러서 정렬값도 넘어온 경우의 keywordList 검사수행
				isEmpty = keywordList.get("alignOption").isEmpty()
						&&keywordList.get("keyword").isEmpty()&&keywordList.get("position").isEmpty()
						&&keywordList.get("industry").isEmpty()&&keywordList.get("techStack").isEmpty()
						&&keywordList.get("condition").isEmpty()&&keywordList.get("salary").isEmpty();
			}else {//정렬버튼 안누르면 정렬옵션은 keywordList에 안담겨온다. 그 keywordList로 검사수행
				isEmpty =
						keywordList.get("keyword").isEmpty()&&keywordList.get("position").isEmpty()
						&&keywordList.get("industry").isEmpty()&&keywordList.get("techStack").isEmpty()
						&&keywordList.get("condition").isEmpty()&&keywordList.get("salary").isEmpty();
			}
			
			if(isEmpty) {
				keywordList=null;
			}
			
			System.out.println("전처리 완료후 keywordList : ");
			System.out.println(keywordList);
		}
		
		
		
		if(keywordList!=null) {//검색관련 키워드나 태그 하나라도 있을 때 로드
			
			ArrayList<String> salary = keywordList.get("salary");
			if(!salary.isEmpty()) {//연봉값이 넘어온 경우에만 최적화한다.
				
				int minSalary = Integer.parseInt(salary.get(0));
				int maxSalary = 0;
				
				//넘어온 연봉값들 중 최소연봉 최대연봉값만 뽑아 다시 세팅
				for(int i = 0; i<salary.size(); i++) {
					int currentVal = Integer.parseInt(salary.get(i));
					if(minSalary>=currentVal) {
						minSalary=currentVal;
					}
					if(maxSalary<=currentVal) {
						maxSalary=currentVal;
					}
				}
				
				salary.clear(); //최소값 최대값 뽑았으면 해당 ArrayList 초기화
				
				//맨 처음 담긴게 최소값 그 뒤에 담긴게 최대값이다. 이걸 토대로 mapper에서 between쓸거임
				salary.add(Integer.toString(minSalary));
				salary.add(Integer.toString(maxSalary));
				
				keywordList.put("salary",salary);
			}
			
			//활동분야 숫자로 치환
			ArrayList<String> position = keywordList.get("position");
			if(!position.isEmpty()) {
				for(int i = 0; i<position.size(); i++) {
					if(position.get(i).equals("기획/PM")) {
						position.set(i, "0");
					}else if(position.get(i).equals("SW 개발")) {
						position.set(i, "1");
					}else {
						position.set(i, "2");
					}
				}
				keywordList.put("position",position);
			}
			
			//경력 숫자로 치환
			ArrayList<String> condition = keywordList.get("condition");
			if(!condition.isEmpty()) {
				for(int i = 0; i<condition.size(); i++) {
					if(condition.get(i).equals("신입")) {
						condition.set(i, "0");
					}else if(condition.get(i).equals("경력")) {
						condition.set(i, "1");
					}else {
						condition.set(i, "2");
					}
				}
				keywordList.put("condition",condition);
				System.out.println(keywordList);
			}
			
			
			int compCount = rService.selectCompCount(keywordList);//페이징처리는 회사갯수기준으로한다.
			System.out.println("comp : "+compCount);
			
			PageInfo pi = Pagination.getPageInfo(compCount, currentPage, 1, 1);
			container.put("pi",pi); //최종적으로 넘겨줄 객체에 pi 세팅
			
			ArrayList<HashMap<String, Object>> recruitInfoList = new ArrayList<>();	//채용정보(하나의 회사정보+그 회사가 진행중인 채용정보들)담을 ArrayList 
			ArrayList<String> cnoList = rService.selectCnoList(pi,keywordList); //키워드로 걸러진 채용공고 한 개 이상 게시한 회사번호들 가져온다.
			
			for(String cno : cnoList) {
				
				HashMap<String, Object> recruitInfo = new HashMap<>();
				ArrayList<Industries> compIndusList = cService.selectCompanyIndustryList(Integer.parseInt(cno));//회사 산업분야저장
				
				ArrayList<String> compNo = new ArrayList<>();//회사번호,키워드 mapper로 넘기기위해 arrayList활용
				compNo.add(cno);
				keywordList.put("compNo",compNo);
				
				recruitInfo.put("company",cService.selectCompany(Integer.parseInt(cno)));//HashMap에 회사정보 담음
				recruitInfo.put("industries",compIndusList);//회사 산업분야정보 담음
				recruitInfo.put("recruitList",rService.selectRecruitList(keywordList));//HashMap에 해당회사채용공고리스트 담음
				recruitInfoList.add(recruitInfo);//채용정보리스트에 회사정보+그회사채용리스트 해쉬맵 담음
			}
			
			container.put("recruitInfoList",recruitInfoList); //최종적으로 넘겨줄 객체에 세팅
			
			System.out.println("키워드 있을 때 처리 결과 : ");
			System.out.println(recruitInfoList);
			
			
		}else {//검색관련 키워드나 태그 전부없을 때 로드(초기화면에서 로드하는거)
			
			int compCount = rService.selectCompCount();//페이징처리는 회사갯수기준으로한다.
			PageInfo pi = Pagination.getPageInfo(compCount, currentPage, 1, 1);
			container.put("pi",pi); //최종적으로 넘겨줄 객체에 pi 세팅
			
			ArrayList<HashMap<String, Object>> recruitInfoList = new ArrayList<>();	//채용정보(하나의 회사정보+그 회사가 진행중인 채용정보들)담을 ArrayList 
			ArrayList<String> cnoList = rService.selectCnoList(pi); //채용공고 한 개 이상 게시한 회사번호들 가져온다.
			
			for(String cno : cnoList) {
				
				HashMap<String, Object> recruitInfo = new HashMap<>();
				ArrayList<Industries> compIndusList = cService.selectCompanyIndustryList(Integer.parseInt(cno));//회사 산업분야저장
				
				recruitInfo.put("company",cService.selectCompany(Integer.parseInt(cno)));//HashMap에 회사정보 담음
				recruitInfo.put("industries",compIndusList);//회사 산업분야정보 담음
				recruitInfo.put("recruitList",rService.selectRecruitList(Integer.parseInt(cno)));//HashMap에 해당회사채용공고리스트 담음
				recruitInfoList.add(recruitInfo);//채용정보리스트에 회사정보+그회사채용리스트 해쉬맵 담음
			}
			
			container.put("recruitInfoList",recruitInfoList); //최종적으로 넘겨줄 객체에 세팅
			
			System.out.println("키워드 없을 때 처리 결과 : ");
			System.out.println(recruitInfoList);
			
		}
		
		return container;
		
	}
	
	
	
	@ResponseBody
	@RequestMapping("insertingMessage.ap")
	public String insertMessage(Counsel cs) {
		
		System.out.println("보내온 메세지의 값 : " + cs);
		
		// insert 실시
		int result = rService.insertCounsel(cs);
		
		if(result>0) {
			
			// counselNo 알아오기
//			int counselNo = rService.selectCounselNo(cs);
//			
//			System.out.println("counselNo : " + counselNo);
			
			return "success";
		}else {
			return "fail";
		}
	}
	
	
	@ResponseBody
	@RequestMapping(value="selectMessageList.ap",produces="application/json; charset=utf-8")
	public String selectMessageList(int applyNo) {
		
		System.out.println("메세지 전체 조회용 번호 "+ applyNo);
		
		// 전체 조회 담을 공간
		ArrayList<Counsel> csAllList = new ArrayList();
		
		csAllList = rService.selectCounselList(applyNo);
		
		System.out.println("전체 조회해온 메세지 리스트 : " + csAllList);
		
		
		return new Gson().toJson(csAllList);
	}
	
	
	/*---------채용공고 북마크 추가------------*/
	@ResponseBody
	@RequestMapping(value="addBookMark.re",produces="application/json; charset=utf-8")
	public int addBookMark(int userNo, int recruitNo) {
		
		System.out.println("북마크 추가 실행");
		Bookmark b = new Bookmark(userNo,recruitNo);
		
		int result = rService.addBookMark(b);
		System.out.println(result);
		return result;
	}
	@ResponseBody
	@RequestMapping(value="deleteBookMark.re",produces="application/json; charset=utf-8")
	public int deleteBookMark(int userNo, int recruitNo) {
		
		System.out.println("북마크 삭제 실행");
		Bookmark b = new Bookmark(userNo,recruitNo);
		
		int result = rService.deleteBookMark(b);
		System.out.println(result);
		return result;
	}
	
}
