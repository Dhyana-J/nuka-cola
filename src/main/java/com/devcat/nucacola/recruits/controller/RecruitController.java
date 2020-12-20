package com.devcat.nucacola.recruits.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.devcat.nucacola.common.model.vo.PageInfo;
import com.devcat.nucacola.recruits.model.vo.Recruit;

@Controller
public class RecruitController {
	
	// 채용상세페이지
	@RequestMapping("/detail.re")
	public String selectRecruit(int rno) {
		return "/main";
	}
}
