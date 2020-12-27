package com.devcat.nucacola.company.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.devcat.nucacola.common.model.vo.PageInfo;
import com.devcat.nucacola.common.model.vo.Skills;
import com.devcat.nucacola.common.template.Pagination;
import com.devcat.nucacola.company.model.service.CompanyService;
import com.devcat.nucacola.company.model.vo.Company;
import com.devcat.nucacola.member.model.service.MemberService;
import com.devcat.nucacola.member.model.vo.Career;
import com.devcat.nucacola.member.model.vo.Member;
import com.google.gson.Gson;

@Controller
public class CompanyController {
	
	@Autowired
	private CompanyService cService;
	
	@Autowired
	private MemberService mService;
	
	// 회사 전체 조회
	@RequestMapping("list.co")
	public String selectCompanyList(@RequestParam(value="currentPage", defaultValue="1") int currentPage,
			Model model)
	{
		int listCount = cService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 15);
		ArrayList<Company> list = cService.selectCompanyList(pi);
		//System.out.println(list);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		return "/company/companyListView";
	}
	@RequestMapping("load.comp")
	public ResponseEntity<String> loadCompList(
				@RequestParam(value="currentPage", defaultValue="1") int currentPage
	){
				System.out.println(currentPage);
				HttpHeaders responseHeaders = new HttpHeaders();
				int listCount = cService.selectListCount();
				PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 15);
				ArrayList<Company> list = cService.selectCompanyList(pi);
				responseHeaders.setContentType(MediaType.APPLICATION_JSON);
				String json = new Gson().toJson(list);
				return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);
	}
	
	@RequestMapping("enrollForm.co")
	public String enrollForm() {
		return "company/companyEnrollForm";
	}
	
	// 회사 등록
	@RequestMapping("insert.co")
	public String insertCompany(@RequestParam(value ="compindus", required = false)String[]arr,
								Company c,MultipartFile upfile,
								HttpSession session, Model model) {
		System.out.println(c);
		//넘어온 파일이 있으면 파일명 수정
		if(!upfile.getOriginalFilename().equals("")) {
			String changeName = saveFile(session, upfile);
			c.setCompLogo("resources/assets/" + changeName);
		}
		// 회사테이블 insert
		int result = cService.insertCompany(c);
		// 생성된 회사 조회
		Company nc = new Company();
		nc = cService.selectCompanyNo(c.getCompName());
		if(result > 0) { //회사 insert 성공 시
			
		for(String e:arr) { //arr이란 배열에 반복문돌려서 담음 ex) [1,4] , [1,2]
			// HashMap에 회사의 산업분야 컬럼값 담아둠
			HashMap<String, Object> hm = new HashMap<String, Object>();
			hm.put("compNo", nc.getCompNo());
			hm.put("indusNo", Integer.parseInt(e));
			System.out.println(e);
			System.out.println(hm);
			int result2 = cService.insertCompindus(hm);
		}
		
		
		//테크스텍 테이블에 insert
		// 백 엔드 기술 0
		String[] backSkillList = c.getSkillList().get(1).getSkillName().split(" ");
		// 백 앤드 해시맵 출격!
		HashMap<String, Object> backMap = makeMap(backSkillList,nc);
		// 드디어 미친 insert 합니다 총 4개를 하라니 정말 날죽이려는것이냐!
		backMap.put("backNo", 0);
		int backSuccess = cService.insertTech(backMap);
		System.out.println(backMap);
		System.out.println("백 성공 결과 : " + backSuccess);
		
		
		// 프론트 엔드 기술 1 python node.js kotlin 
		String[] frontSkillList = c.getSkillList().get(0).getSkillName().split(" ");
		
		HashMap<String, Object> frontMap = makeMap(frontSkillList,nc);
		// 드디어 미친 insert 합니다 총 4개를 하라니 정말 날죽이려는것이냐!
		frontMap.put("backNo", 1);
		int frontSuccess = cService.insertTech(frontMap);
		System.out.println(frontMap);
		System.out.println("프론트 성공 결과 : " + frontSuccess);
		
		
		
		// 데브 기술 2
		String[] devSkillList = c.getSkillList().get(2).getSkillName().split(" ");
		
		HashMap<String, Object> devMap = makeMap(devSkillList,nc);
		// 드디어 미친 insert 합니다 총 4개를 하라니 정말 날죽이려는것이냐!
		devMap.put("backNo", 1);
		int devSuccess = cService.insertTech(devMap);
		System.out.println(devMap);
		System.out.println("데브 성공 결과 : " + devSuccess);
		
		
		// 기타 기술 3
		String[] etcSkillList = c.getSkillList().get(3).getSkillName().split(" ");
		
		HashMap<String, Object> etcMap = makeMap(etcSkillList,nc);
		// 드디어 미친 insert 합니다 총 4개를 하라니 정말 날죽이려는것이냐!
		etcMap.put("backNo", 1);
		int etcSuccess = cService.insertTech(etcMap);
		System.out.println(etcMap);
		System.out.println("기타 성공 결과 : " + etcSuccess);
		

		
		
			session.setAttribute("alertMsg", "성공적으로 회사가 등록되었습니다.");
			return "redirect:list.co";
		}else {
			model.addAttribute("errorMsg", "회사 등록 실패!");
			return "common/errorPage";
		}
	}
	
	// 첨부파일 업로드 메소드
	private String saveFile(HttpSession session, MultipartFile upfile) {

		String savePath = session.getServletContext().getRealPath("/resources/assets/");
		
		String originName = upfile.getOriginalFilename();
		
		String currentTime = new SimpleDateFormat("yyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	
	}
	
	// 해시맵 만들어주는 메소드~
	private HashMap<String, Object> makeMap(String[] skillList, Company nc) {
		
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
		
		// 기업식별자와, 기술번호를 한번에 담은 해시맵이다 이마리야
		HashMap<String, Object> ts = new HashMap<String, Object>();
		
		ts.put("compNo", nc.getCompNo());
		ts.put("skillsNo",skillsNo);
		
		return ts;
	}
	
	// 프로필 메인화면
	@RequestMapping("profileMain.co")
	public String profileMainCompany(int cno) {
		return "company/companyProfileMain";
	}
	
	//기업 프로필 - 구성원 화면
	@RequestMapping("profileMember.co")
	public String profileMember(int cno, int currentPage, Model model, HttpSession session){
		
		//구성원 수 세팅
		int memberCount = cService.selectMemberCount(cno);
		
		//구성원들 리스트의 페이징처리가 필요하다. 대표(채용담당자)는 한명이니까 페이징 처리 필요없음
		//유저경력테이블에서 해당 회사 재직중인사람 목록 불러오면 됨
		PageInfo pi = Pagination.getPageInfo(memberCount, currentPage, 1, 1);
		
		
		//위에서 설정한 pi를 가지고 지정된 수의 범위 만큼 구성원 정보를 가져오자
		ArrayList<Member> memberList = mService.selectMemberList(cno,pi);
		
		//대표는 따로불러와야됨! Member객체에 회사대표임을 식별할 수 있는게 없다.
		//회사테이블의 기업관리자랑 일치하는사람 조회하든, 유저경력테이블의 포지션이 대표인사람 조회하든 해야!
		Member head = mService.selectHead(cno);
		
		//구성원 추가 포지션 검색시 쓰일 것들
		ArrayList<String> positionList = cService.selectPositionList(cno);
		

		model.addAttribute("positionList",positionList);
		model.addAttribute("pi",pi);
		model.addAttribute("head",head);
		model.addAttribute("memberList",memberList);
		model.addAttribute("cno",cno);
		
		
		return "company/companyProfileMembers";
	}
	
	//기업 구성원 more버튼 클릭 시 실행될 컨트롤러
	@ResponseBody
	@RequestMapping("loadMoreMember.co")
	public HashMap<String,ArrayList<?extends Object>> loadMoreMember(int cno,int currentPage){
		
		//페이지인포를 세팅하고 구성원리스트를 세팅한다.
		PageInfo pi = Pagination.getPageInfo(cService.selectMemberCount(cno), currentPage, 1, 1);
		ArrayList<Member> memberList = mService.selectMemberList(cno, pi);
		
		//페이지인포 객체를 담아준다. (ArrayList를 쓰는 이유는 HashMap에 담아 뷰로 넘겨주기 위함)
		ArrayList<PageInfo> piBox=new ArrayList();
		piBox.add(pi);
		
		HashMap<String,ArrayList<?extends Object>> loadedInfo = new HashMap<>();
		
		loadedInfo.put("piBox",piBox);
		loadedInfo.put("memberList",memberList);
		
		return loadedInfo;
		
	}
	
	//기업 구성원 모달 이메일검색 시 실행될 컨트롤러
	@ResponseBody
	@RequestMapping("searchMemberList.co")
	public ArrayList<Member> searchMemberList(String email){
		
		ArrayList<Member> searchedList = mService.searchMemberList(email);
		
		return searchedList;
		
	}
	
	
	//기업구성원 추가 시 실행될 컨트롤러
	@RequestMapping("addMember.co")
	public String addMember(int[] uno, int cno, String position, HttpSession session, Model model) {
		
		
		
		//insert할 구성원정보를 담을 ArrayList
		List<Career> memberList = new ArrayList<>();
		
		//checked된 유저 수 만큼 객체 추가해준다.
		for(int userNo : uno) {
			memberList.add(new Career(userNo,cno,position));
		}
		
		
		int result = cService.addMember(memberList);
		
		if(result>0) {
			session.setAttribute("alertMsg", "구성원 추가 성공!");
			return "redirect:profileMember.co?cno=1&currentPage=1";
		}else {
			model.addAttribute("errorMsg","구성원 추가 실패");
			return "common/errorPage";
		}
	}
	
	
	
	
}
