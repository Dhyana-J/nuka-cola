package com.devcat.nucacola.company.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.devcat.nucacola.common.model.vo.PageInfo;
import com.devcat.nucacola.company.model.vo.Company;

@Repository
public class CompanyDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("companymapper.selectListCount");
	}
	
	public ArrayList<Company> selectCompanyList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("companymapper.selectCompanyList", null, rowBounds);
	}

	public int insertCompany(SqlSessionTemplate sqlSession, Company c) {
		return sqlSession.insert("companymapper.insertCompany", c);
	}
}
