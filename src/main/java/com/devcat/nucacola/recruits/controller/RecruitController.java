package com.devcat.nucacola.recruits.controller;

import java.util.ArrayList;


import com.devcat.nucacola.member.model.vo.Member;
import com.devcat.nucacola.posts.model.vo.Comment;
import com.devcat.nucacola.recruits.model.service.RecruitService;
import com.devcat.nucacola.recruits.model.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.devcat.nucacola.common.model.vo.PageInfo;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class RecruitController {
	@Autowired
	private RecruitService rService;

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
		int uno = Integer.parseInt(apply.getUserNo());
		ArrayList<RecruitSkill> skillList = rService.selectUserSkills(uno);
		ArrayList<UserCareer> careerList = rService.selectCareers(uno);
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
		int result = rService.changeProgress(rp);
		System.out.println("redirect:/detail.ap?ano="+rno);
		return "redirect:/detail.ap?ano="+rno;
	}
	// 지원한 내역조회
	@RequestMapping("list.ap")
	public String selectApplyList(Member m, int rno, Model model, HttpSession session) {
		System.out.println(rno);
		
		ArrayList<Apply> applyList = rService.selectApplyList(rno);
		int applyCount = rService.selectApplyCount(rno);
		
		model.addAttribute("applyList", applyList);
		model.addAttribute("applyCount", applyCount);
		
		System.out.println(applyList);
		System.out.println(applyCount);
		return "/apply/applyHistory";
			
	}
	
	
	
	@RequestMapping("recruitEnroll.re")
	public String recruitEnroll() {
		
		return "/recruit/recruitEnrollForm";
	}
	
	
	@RequestMapping("recruitInsert.re")
	public void insertRecruit(Recruit re, int userNo) {

		System.out.println(re);

		int compNo = rService.selectCompNo(userNo);

		System.out.println(compNo);


		re.setCompNo(compNo);


		int minSal = (int) (re.getRecruitMinSal());
		int maxSal = (int) (re.getRecruitMaxSal());


		System.out.println(minSal);
		System.out.println(maxSal);

		re.setRecruitMinSal(minSal);
		re.setRecruitMaxSal(maxSal);

		System.out.println(re);

		int result = rService.insertRecruit(re);

		if (result > 0) {
			System.out.println("삽입 성공!");

		}
	}
	// 채용관리 페이지
	@RequestMapping("mDetail.re")
	public String selectRecruitManage(int rno, Model model) {
		
		
		
		return "/recruit/recruitManageDetail";
		
	}
	
	
	
}
