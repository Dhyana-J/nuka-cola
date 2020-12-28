package com.devcat.nucacola.recruits.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devcat.nucacola.common.model.vo.PageInfo;
import com.devcat.nucacola.member.model.dao.MemberDao;
import com.devcat.nucacola.recruits.model.dao.RecruitDao;
import com.devcat.nucacola.recruits.model.vo.Apply;
import com.devcat.nucacola.recruits.model.vo.Recruit;


@Service
public class RecruitServiceImpl implements RecruitService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private RecruitDao rDao;
	
	
	
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
	public Recruit selectRecruit(int rno) {
		// TODO Auto-generated method stub
		return null;
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


	
}
