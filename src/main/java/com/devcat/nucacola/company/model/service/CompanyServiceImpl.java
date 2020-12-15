package com.devcat.nucacola.company.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devcat.nucacola.company.model.dao.CompanyDao;
import com.devcat.nucacola.company.model.vo.Company;

@Service
public class CompanyServiceImpl implements CompanyService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private CompanyDao cDao;

	@Override
	public ArrayList<Company> selectCompanyList() {
		return cDao.selectCompanyList(sqlSession);
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

	
	
}
