package com.devcat.nucacola.company.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
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
import com.devcat.nucacola.recruits.model.vo.Recruit;
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
	
	// 다른유저 클릭시 프로필 메인화면
	@RequestMapping("profileMain.co")
	public String profileMainCompany(int cno, Model model) {
		model.addAttribute("cno",cno);
		return "company/companyProfileMain";
	}
	
	// 프로필의 채용공고(진행중, 진행완료)
	@RequestMapping("recruit.co")
	public String profileRecruit(@RequestParam(value="currentPage", defaultValue="1") int currentPage
								 ,Company c, Model model) {
		int INGcount = cService.INGcount(c);
		PageInfo pi = Pagination.getPageInfo(INGcount, currentPage,1,4);
		ArrayList<Recruit> rlist1 = cService.selectCompanyRecruitING(c,pi);
		System.out.println(rlist1);
		
		int ENDcount = cService.ENDcount(c);
		PageInfo pi2 = Pagination.getPageInfo(ENDcount, currentPage,1,4);
		ArrayList<Recruit> rlist2 = cService.selectCompanyRecruitEND(c,pi2);
		System.out.println(rlist2);
		
		ArrayList<Recruit> skills = cService.CompanyRecruitSkills(c);
		HashMap<Integer, List<String>>skillMap =new HashMap<>();
		for(int i=0; i<skills.size();i++) { //조회한 업무기술문자열 뽑아서 , 기준으로 자르기
			System.out.println(skills.get(i).getRecruitNo());
			String skillStr = skills.get(i).getSkillName();// 기술명문자열 출력			
			List<String> skillsName = Arrays.asList(skillStr.split(","));// 기술명 , 기준으로 자르기
				int key=skills.get(i).getRecruitNo();
				skillMap.put(key,skillsName);
			System.out.println(skillMap);
		}
		model.addAttribute("cno",c.getCompNo());
		model.addAttribute("skillMap",skillMap);
		model.addAttribute("rlist1",rlist1);
		model.addAttribute("rlist2",rlist2);
		model.addAttribute("pi1",pi);
		model.addAttribute("pi2",pi2);
		return "company/companyProfileRecruit";
	}
	
	@ResponseBody
	@RequestMapping(value="recruitINGLoad.co",produces="application/json;charset=utf-8")
	public HashMap<String, Object> recruitLoadING(@RequestParam(value="currentPage", defaultValue="1") int currentPage
								 ,Company c, Model model) {
		int INGcount = cService.INGcount(c);
		PageInfo pi = Pagination.getPageInfo(INGcount, currentPage,1,4);
		ArrayList<Recruit> rlist1 = cService.selectCompanyRecruitING(c,pi);
		System.out.println(rlist1);
		
		ArrayList<Recruit> skills = cService.CompanyRecruitSkills(c);
		HashMap<Integer, List<String>>skillMap =new HashMap<>();
		for(int i=0; i<skills.size();i++) { //조회한 업무기술문자열 뽑아서 , 기준으로 자르기
			System.out.println(skills.get(i).getRecruitNo());
			String skillStr = skills.get(i).getSkillName();// 기술명문자열 출력			
			List<String> skillsName = Arrays.asList(skillStr.split(","));// 기술명 , 기준으로 자르기
				int key=skills.get(i).getRecruitNo();
				skillMap.put(key,skillsName);
			System.out.println(skillMap);
		}
		
		HashMap<String, Object> result=new HashMap<>();
		result.put("skillMap", skillMap);
		result.put("rlist1",rlist1);

		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="recruitENDLoad.co",produces="application/json;charset=utf-8")
	public HashMap<String, Object> recruitLoadEND(@RequestParam(value="currentPage", defaultValue="1") int currentPage
								 ,Company c, Model model) {
		int ENDcount = cService.ENDcount(c);
		PageInfo pi2 = Pagination.getPageInfo(ENDcount, currentPage,1,4);
		ArrayList<Recruit> rlist2 = cService.selectCompanyRecruitEND(c,pi2);
		System.out.println(rlist2);
		
		ArrayList<Recruit> skills = cService.CompanyRecruitSkills(c);
		HashMap<Integer, List<String>>skillMap =new HashMap<>();
		for(int i=0; i<skills.size();i++) { //조회한 업무기술문자열 뽑아서 , 기준으로 자르기
			System.out.println(skills.get(i).getRecruitNo());
			String skillStr = skills.get(i).getSkillName();// 기술명문자열 출력			
			List<String> skillsName = Arrays.asList(skillStr.split(","));// 기술명 , 기준으로 자르기
				int key=skills.get(i).getRecruitNo();
				skillMap.put(key,skillsName);
			System.out.println(skillMap);
		}
		
		
		HashMap<String, Object> result=new HashMap<>();
		result.put("skillMap", skillMap);
		result.put("rlist2",rlist2);

		return result;
	}
	
}
