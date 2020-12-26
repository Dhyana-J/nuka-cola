package com.devcat.nucacola.company.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devcat.nucacola.common.model.vo.PageInfo;
import com.devcat.nucacola.company.model.dao.CompanyDao;
import com.devcat.nucacola.company.model.vo.Company;
import com.devcat.nucacola.company.model.vo.Industries;
import com.devcat.nucacola.recruits.model.vo.Recruit;

@Service
public class CompanyServiceImpl implements CompanyService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private CompanyDao cDao;

	@Override
	public int selectListCount() {
		return cDao.selectListCount(sqlSession);
	}
	
	@Override
	public ArrayList<Company> selectCompanyList(PageInfo pi) {
		return cDao.selectCompanyList(sqlSession, pi);
	}

	@Override
	public int insertCompany(Company c) {
		return cDao.insertCompany(sqlSession, c);
	}

	@Override
	public Company selectCompany(int cno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateCompany(Company c) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteCompany(int cno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Industries> getIndusNo(String[] arr) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertCompindus(HashMap<String, Object> hm) {
		return cDao.insertCompindus(sqlSession, hm);
	}

	@Override
	public Company selectCompanyNo(String compName) {
		return cDao.selectCompanyNo(sqlSession, compName);
	}

	@Override
	public int insertTech(HashMap<String, Object> backMap) {
		
		return cDao.insertTech(sqlSession,backMap);
	}
	
	//진행중인 채용정보리스트 총갯수
	@Override
	public int INGcount(Company c) {
		return cDao.INGcount(sqlSession, c);
	}
	
	// 진행중인 채용정보리스트 조회
	@Override
	public ArrayList<Recruit> selectCompanyRecruitING(Company c, PageInfo pi) {
		return cDao.selectCompanyRecruitING(sqlSession, c, pi);
	}

	@Override
	public int ENDcount(Company c) {
		return cDao.ENDcount(sqlSession, c);
	}

	@Override
	public ArrayList<Recruit> selectCompanyRecruitEND(Company c, PageInfo pi2) {
		return cDao.selectCompanyRecruitEND(sqlSession, c, pi2);
	}
	@Override
	public ArrayList<Recruit> CompanyRecruitSkills(Company c) {
		return cDao.CompanyRecruitSkills(sqlSession, c);
	}




	
	
}
