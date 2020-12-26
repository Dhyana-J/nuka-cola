package com.devcat.nucacola.company.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.devcat.nucacola.common.model.vo.PageInfo;
import com.devcat.nucacola.company.model.vo.Company;
import com.devcat.nucacola.company.model.vo.Industries;
import com.devcat.nucacola.member.model.vo.Bookmark;
import com.devcat.nucacola.recruits.model.vo.Recruit;

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
	
	public int INGcount(SqlSessionTemplate sqlSession, Company c) {
		return sqlSession.selectOne("companymapper.INGcount", c);
	};
	
	public ArrayList<Recruit> selectCompanyRecruitING(SqlSessionTemplate sqlSession, Company c, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("companymapper.selectCompanyRecruitING", c, rowBounds);
	};
	
	public int ENDcount(SqlSessionTemplate sqlSession, Company c) {
		return sqlSession.selectOne("companymapper.ENDcount", c);
	};
	
	public ArrayList<Recruit> selectCompanyRecruitEND(SqlSessionTemplate sqlSession, Company c, PageInfo pi2) {
		int offset = (pi2.getCurrentPage() - 1) * pi2.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi2.getBoardLimit());
		return (ArrayList)sqlSession.selectList("companymapper.selectCompanyRecruitEND", c, rowBounds);
	};
	
	public ArrayList<Recruit> CompanyRecruitSkills(SqlSessionTemplate sqlSession,Company c) {
		return (ArrayList)sqlSession.selectList("companymapper.CompanyRecruitSkills", c);
	}

}
