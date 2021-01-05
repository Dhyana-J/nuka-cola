package com.devcat.nucacola.recruits.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.devcat.nucacola.recruits.model.dao.RecruitDao;
import com.devcat.nucacola.recruits.model.vo.*;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devcat.nucacola.common.model.vo.PageInfo;
import com.devcat.nucacola.common.model.vo.Skills;
import com.devcat.nucacola.recruits.model.vo.Apply;
import com.devcat.nucacola.recruits.model.vo.ApplyList;
import com.devcat.nucacola.recruits.model.vo.Declare;
import com.devcat.nucacola.recruits.model.vo.Recruit;
import com.devcat.nucacola.recruits.model.vo.RecruitDetail;
import com.devcat.nucacola.recruits.model.vo.RecruitManage;
import com.devcat.nucacola.recruits.model.vo.RecruitSkill;


@Service
public class RecruitServiceImpl implements RecruitService {

	@Autowired
	private RecruitDao rDao;

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Recruit> selectRecruitList(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int increaseCount(int rno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public RecruitDetail selectRecruitDetail(int rno) {
		// TODO Auto-generated method stub
		return rDao.selectRecruitDetail(sqlSession,rno);
	}
	@Override
	public ArrayList<RecruitSkill> selectRecruitSkill( int rno) {
		// TODO Auto-generated method stub
		return rDao.selectRecruitSkill(sqlSession,rno);
	}
	@Override
	public int selectAppliesCount(int rno){
		return rDao.selectAppliesCount(sqlSession,rno);
	}
	@Override
	public int insertDeclare(Declare d){
		return rDao.insertDeclare(sqlSession,d);
	}
	@Override
	public int updateRecruit(Recruit r) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteRecruit(int rno) {
		// TODO Auto-generated method stub
		return 0;
	}
	// 내가 지원한 채용공고 리스트 조회
	@Override
	public ArrayList<ApplyList> selectApplyList(int userNo) {
		return rDao.selectApplyList(sqlSession, userNo);
	}
	// 내가 지원한 내역 조회(수)
	@Override
	public int selectApplyCount(int userNo) {
		return rDao.selectApplyCount(sqlSession, userNo);
	}
	// 내가 지원한 내역 삭제
	@Override
	public int deleteApplyList(Apply ap) {
		return rDao.deleteApplyList(sqlSession, ap);
	}
	

	@Override
	public int insertRecruit(Recruit re) {
		return rDao.insertRecruit(sqlSession, re);
	}

	@Override
	public int selectCompNo(int userNo) {
		
		return rDao.selectCompNo(sqlSession, userNo);
	}
	
	// 지원자조회
	@Override
	public ArrayList<RecruitManage> selectRecruitManageDetail(int rno) {
		return rDao.selectRecruitManageDetail(sqlSession, rno);
	}

	@Override
	public int selectCompCount() {
		return rDao.selectCompCount(sqlSession);
	}
	
	@Override
	public int selectCompCount(Map<String, ArrayList<String>> keywordList) {
		return rDao.selectCompCount(sqlSession);
	}

	@Override
	public ArrayList<String> selectCnoList(PageInfo pi) {
		return rDao.selectCnoList(sqlSession,pi);
	}

	@Override
	public ArrayList<Recruit> selectRecruitList(int cno) {
		return rDao.selectRecruitList(sqlSession,cno);
	}

	@Override
	public ArrayList<Skills> selectSkillList() {
		return rDao.selectSkillList(sqlSession);
	}

	@Override
	public ArrayList<String> selectLocationList() {
		return rDao.selectLocationList(sqlSession);
	}

	public int selectBookmarkCount(int rno) {
		return rDao.selectBookmarkCount(sqlSession, rno);
	}
	
	public Apply selectApplyDetail(int ano) {
		return rDao.selectApplyDetail(sqlSession, ano);
	}
	@Override
	public ArrayList<RecruitSkill> selectUserSkills(int uno) {
		return rDao.selectUserSkills(sqlSession, uno);
	}

	@Override
	public ArrayList<UserCareer> selectCareers(int uno){
		return rDao.selectCareers(sqlSession,uno);
	}
	@Override
	public int changeProgress(RecruitSkill rp){
		return rDao.changeProgress(sqlSession,rp);
	}
	
}
