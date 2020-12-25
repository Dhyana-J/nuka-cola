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
import com.devcat.nucacola.member.model.vo.Member;

@Repository
public class CompanyDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("companymapper.selectListCount");
	}
	
	//기업 번호로 기업 객체 하나 조회해오는 method
	public Company selectCompany(SqlSessionTemplate sqlSession,int cno) {
		
		return sqlSession.selectOne("companymapper.selectCompany",cno);
	}
	
	public ArrayList<Company> selectCompanyList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("companymapper.selectCompanyList", null, rowBounds);
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


	public int selectMemberCount(SqlSessionTemplate sqlSession, int cno) {//회사 구성원 수 조회
		return sqlSession.selectOne("companymapper.selectMemberCount",cno);
	}

	

	
	
	

}
