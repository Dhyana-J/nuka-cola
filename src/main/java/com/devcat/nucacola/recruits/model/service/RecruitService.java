package com.devcat.nucacola.recruits.model.service;

import java.util.ArrayList;

import com.devcat.nucacola.common.model.vo.PageInfo;
import com.devcat.nucacola.recruits.model.vo.Apply;
import com.devcat.nucacola.recruits.model.vo.Recruit;



public interface RecruitService {
	
	// 채용공고 조회
		int selectListCount();
		ArrayList<Recruit> selectRecruitList(PageInfo pi);
		
	// 채용 공고 상세 조회
		int increaseCount(int rno);
		Recruit selectRecruit(int rno);
	
	// 채용 공고 수정
		int updateRecruit(Recruit r);
		
		
	// 채용 공고 삭제
		int deleteRecruit(int rno);
	
	// 지원 조회
		ArrayList<Apply> selectApplyList(int rno);
		
		
}
