package com.devcat.nucacola.recruits.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.devcat.nucacola.common.model.vo.PageInfo;
import com.devcat.nucacola.common.model.vo.Skills;
import com.devcat.nucacola.member.model.vo.Bookmark;
import com.devcat.nucacola.recruits.model.vo.Apply;
import com.devcat.nucacola.recruits.model.vo.ApplyList;
import com.devcat.nucacola.recruits.model.vo.Counsel;
import com.devcat.nucacola.recruits.model.vo.Declare;
import com.devcat.nucacola.recruits.model.vo.Recruit;
import com.devcat.nucacola.recruits.model.vo.RecruitDetail;
import com.devcat.nucacola.recruits.model.vo.RecruitManage;
import com.devcat.nucacola.recruits.model.vo.RecruitSkill;
import com.devcat.nucacola.recruits.model.vo.UserCareer;


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
		ArrayList<ApplyList> selectApplyList(int userNo);
		int selectApplyCount(int userNo);
	// 지원한 내역 삭제
		int deleteApplyList(Apply ap);
		
	// 채용 등록	
		int insertRecruit(Recruit re);
	
	// 사용자의 회사 번호 알아오기
	int selectCompNo(int userNo);
	
	// 채용공고 올린 회사들 수 조회 (검색어 없을 때)
	int selectCompCount();
	
	// 채용공고 올린 회사들 수 조회 (검색어 있을 때)
	int selectCompCount(Map<String, ArrayList<String>> keywordList);
		
	// 채용공고 회사번호 조회
	ArrayList<String> selectCnoList(PageInfo pi);
	
	// 채용공고 회사번호 조회(검색어 있을때)
	ArrayList<String> selectCnoList(PageInfo pi,Map<String, ArrayList<String>> keywordList);
	
	//한 회사의 채용공고 리스트 조회
	ArrayList<Recruit> selectRecruitList(int cno);
	
	//한 회사의 채용공고 리스트 조회(검색어 있을때)
	public ArrayList<Recruit> selectRecruitList(Map<String, ArrayList<String>> keywordList);
	
	//전체 기술스택 리스트 조회
	ArrayList<Skills> selectSkillList();
	
	//DB에서 주소 앞 두글자만 조회 (서울, 경기, 대전, 대구 ...)
	ArrayList<String> selectLocationList();

	
	// 지원자 조회
		ArrayList<RecruitManage> selectRecruitManageDetail(int rno);
	// 북마크 수 조회
		int selectBookmarkCount(int rno);
		
	//지원 상세조회
	Apply selectApplyDetail(int ano);
	ArrayList<RecruitSkill> selectUserSkills(int uno);
	ArrayList<UserCareer> selectCareers(int uno);

	//지원자상태변경
	int changeProgress(RecruitSkill rp);
	
	// 채용정보 등록위한 채용공고 번호 알아오기
	int selectRecruitNo(Recruit re);
	
	// 채용공고 기술 등록 하기
	int insertRecruitSkill(HashMap<String, Object> recruitMap);
	//유저 채용관리자 여부 판별
	int isManager(int uno);
	
	
	//counsel 테이블에 insert
	int insertCounsel(Counsel cs);
	
	//counsel 테이블에 대화내역 전체 조회
	ArrayList<Counsel> selectCounselList(int applyNo);
	
	//counsel 테이블 번호 조회
	int selectCounselNo(Counsel cs);
	
	//북마크한 채용공고 번호 리스트 조회
	ArrayList<String> selectBookMarkNoList(int uno);
	
	//채용공고 북마크 추가,삭제
	int addBookMark(Bookmark b);
	int deleteBookMark(Bookmark b);

    int insertApply(Apply a);
}
