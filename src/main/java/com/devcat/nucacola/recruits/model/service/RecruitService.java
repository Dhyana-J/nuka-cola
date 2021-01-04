package com.devcat.nucacola.recruits.model.service;

import java.util.ArrayList;

import com.devcat.nucacola.common.model.vo.PageInfo;
import com.devcat.nucacola.common.model.vo.Skills;
import com.devcat.nucacola.recruits.model.vo.Apply;
import com.devcat.nucacola.recruits.model.vo.Declare;
import com.devcat.nucacola.recruits.model.vo.Recruit;
import com.devcat.nucacola.recruits.model.vo.RecruitDetail;
import com.devcat.nucacola.recruits.model.vo.RecruitSkill;


public interface RecruitService {
	
	// 채용공고 조회
		int selectListCount();
		ArrayList<Recruit> selectRecruitList(PageInfo pi);
		
	// 채용 공고 상세 조회
		int increaseCount(int rno);
		RecruitDetail selectRecruitDetail( int rno);
		ArrayList<RecruitSkill> selectRecruitSkill(int rno);
		int selectAppliesCount(int rno);
		int insertDeclare(Declare d);
	// 채용 공고 수정
		int updateRecruit(Recruit r);
		
		
	// 채용 공고 삭제
		int deleteRecruit(int rno);
	
	// 지원 조회
		ArrayList<Apply> selectApplyList(int rno);
		int selectApplyCount(int rno);
	// 
		
	// 채용 등록	
	int insertRecruit(Recruit re);
	
	// 사용자의 회사 번호 알아오기
	int selectCompNo(int userNo);
	
	// 채용공고 올린 회사들 수 조회
	int selectCompCount();
		
	// 채용공고 회사번호 조회
	ArrayList<String> selectCnoList(PageInfo pi);
	
	//한 회사의 채용공고 리스트 조회
	ArrayList<Recruit> selectRecruitList(int cno);
	
	//전체 기술스택 리스트 조회
	ArrayList<Skills> selectSkillList();
	
	//DB에서 주소 앞 두글자만 조회 (서울, 경기, 대전, 대구 ...)
	ArrayList<String> selectLocationList();
	
}
