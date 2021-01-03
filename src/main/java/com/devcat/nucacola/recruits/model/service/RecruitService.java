package com.devcat.nucacola.recruits.model.service;

import java.util.ArrayList;

import com.devcat.nucacola.common.model.vo.PageInfo;
import com.devcat.nucacola.recruits.model.vo.*;
import org.mybatis.spring.SqlSessionTemplate;
import sun.security.util.Debug;


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
		
	//지원 상세조회
	Apply selectApplyDetail(int ano);
	ArrayList<RecruitSkill> selectUserSkills(int uno);
	ArrayList<UserCareer> selectCareers(int uno);
}
