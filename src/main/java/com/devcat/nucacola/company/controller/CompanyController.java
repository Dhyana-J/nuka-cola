package com.devcat.nucacola.company.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

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
import com.devcat.nucacola.company.model.vo.CompIndus;
import com.devcat.nucacola.company.model.vo.Company;
import com.devcat.nucacola.company.model.vo.Industries;
import com.devcat.nucacola.company.model.vo.TechStack;
import com.google.gson.Gson;

@Controller
public class CompanyController {
	
	@Autowired
	private CompanyService cService;
	
	// 회사 전체 조회
	@RequestMapping("list.co")
	public String selectCompanyList(@RequestParam(value="currentPage", defaultValue="1") int currentPage,
			Model model)
	{
		int listCount = cService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 100);
		ArrayList<Company> list = cService.selectCompanyList(pi);
		System.out.println(list);
		
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
				PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 100);
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
	
	// 프로필 메인화면
	@RequestMapping("profileMain.co")
	public String profileMainCompany(int cno) {
		return "company/commpanyProfileMain";
	}
	
	
}
