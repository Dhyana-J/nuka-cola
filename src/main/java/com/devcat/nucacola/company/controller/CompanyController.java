package com.devcat.nucacola.company.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.devcat.nucacola.company.model.service.CompanyService;
import com.devcat.nucacola.company.model.vo.Company;

@Controller
public class CompanyController {
	
	@Autowired
	private CompanyService cService;
	
	@RequestMapping("list.co")
	public String selectCompanyList(Model model) {
		
		ArrayList<Company> list = cService.selectCompanyList();
		
		model.addAttribute("list", list);
		
		return "company/companyListView";
	}
	
	@RequestMapping("enrollForm.co")
	public String enrollForm() {
		return "company/companyEnrollForm";
	}
	
	@RequestMapping("insert.co")
	public String insertCompany(Company c, MultipartFile upfile,
								HttpSession session, Model model) {
	
		if(!upfile.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(session, upfile);
			
			c.setCompLogo("resources/assets/" + changeName);
		}
		
		int result = cService.insertCompany(c);
		
		if(result > 0) {
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
	
	
}
