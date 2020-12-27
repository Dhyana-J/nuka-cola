package com.devcat.nucacola.company.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.devcat.nucacola.common.model.vo.PageInfo;
import com.devcat.nucacola.common.model.vo.Skills;
import com.devcat.nucacola.company.model.vo.CompIndus;
import com.devcat.nucacola.company.model.vo.Company;
import com.devcat.nucacola.company.model.vo.Industries;
import com.devcat.nucacola.company.model.vo.TechStack;

@Repository
public class CompanyDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("companymapper.selectListCount");
	}
	
	public ArrayList<Company> selectCompanyList(SqlSessionTemplate sqlSession, PageInfo pi , int uno){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("companymapper.selectCompanyList", uno, rowBounds);
	}

	public int insertCompany(SqlSessionTemplate sqlSession, Company c) {
		
		return sqlSession.insert("companymapper.insertCompany", c);
	}
	
	//산업분야식별자 
	public ArrayList<Industries> getIndusNo(SqlSessionTemplate sqlSession, String[] arr){
		
		return (ArrayList)sqlSession.selectList("companymapper.getIndusNo", arr);
	}
	
	public int insertCompindus(SqlSessionTemplate sqlSession, HashMap<String,Object> hm) {
		
		return sqlSession.insert("companymapper.insertCompindus", hm);
		
	}
	// 회사 번호 알아오기
	public Company selectCompanyNo(SqlSessionTemplate sqlSession, String compName) {
		
		return sqlSession.selectOne("companymapper.selectCompanyNo", compName);
	}

	public int insertTech(SqlSessionTemplate sqlSession, HashMap<String, Object> backMap) {
		
		return sqlSession.insert("companymapper.insertTech",backMap);
	}

	//회사 검색
	public ArrayList<Company> searchCompanyList(SqlSessionTemplate sqlSession, PageInfo pi, String keyword){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("companymapper.searchCompanyList", keyword, rowBounds);
	}

	//회사 레코드 갯수
	public int countCompany(SqlSessionTemplate sqlSession, String keyword) {
		
		return sqlSession.selectOne("companymapper.countCompany", keyword);
	}
	
	//회사 인기순 정렬
	public ArrayList<Company> rankingCompanyList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("companymapper.rankingCompanyList", null, rowBounds);
	}
}