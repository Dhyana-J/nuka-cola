package com.devcat.nucacola.recruits.model.service;

import java.awt.*;
import java.util.ArrayList;


import com.devcat.nucacola.recruits.model.dao.RecruitDao;
import com.devcat.nucacola.recruits.model.vo.Declare;
import com.devcat.nucacola.recruits.model.vo.RecruitDetail;
import com.devcat.nucacola.recruits.model.vo.RecruitSkill;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devcat.nucacola.common.model.vo.PageInfo;
import com.devcat.nucacola.common.model.vo.Skills;
import com.devcat.nucacola.member.model.dao.MemberDao;
import com.devcat.nucacola.recruits.model.dao.RecruitDao;
import com.devcat.nucacola.recruits.model.vo.Apply;
import com.devcat.nucacola.recruits.model.vo.Recruit;


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

	@Override
	public ArrayList<Apply> selectApplyList(int rno) {
		return rDao.selectApplyList(sqlSession, rno);
	}
	@Override
	public int selectApplyCount(int rno) {
		return rDao.selectApplyCount(sqlSession, rno);
	}
	
	

	@Override
	public int insertRecruit(Recruit re) {
		return rDao.insertRecruit(sqlSession, re);
	}

	@Override
	public int selectCompNo(int userNo) {
		
		return rDao.selectCompNo(sqlSession, userNo);
	}

	@Override
	public int selectCompCount() {
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


	
}
