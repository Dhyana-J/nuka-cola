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



	
	
}
