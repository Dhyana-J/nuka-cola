package com.devcat.nucacola.recruits.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.devcat.nucacola.recruits.model.service.RecruitService;
import com.devcat.nucacola.recruits.model.vo.Apply;

@Controller
public class RecruitController {
	
	@Autowired
	private RecruitService rService;
	
	// 채용상세페이지
	@RequestMapping("/detail.re")
	public String selectRecruit(int rno) {
		return "/main";
	}
	
	@RequestMapping(value="list.ap")
	public String selectApplyList(int rno, Model model) {
		
		ArrayList<Apply> ApplyList = rService.selectApplyList(rno);
		
		model.addAttribute("ApplyList", ApplyList);
		
		System.out.println(ApplyList);
		return "apply/applyHistory";
			
	}
	
}
