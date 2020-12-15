package com.devcat.nucacola.company.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.devcat.nucacola.company.model.vo.Company;

@Repository
public class CompanyDao {
	
	public ArrayList<Company> selectCompanyList(SqlSessionTemplate sqlSession){
		
		return (ArrayList)sqlSession.selectList("companyMapper.selectCompanyList");
	}

	public int insertCompany(SqlSessionTemplate sqlSession, Company c) {
		return sqlSession.insert("companyMapper.insertCompany", c);
	}
}
