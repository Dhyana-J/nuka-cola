package com.devcat.nucacola.company.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.devcat.nucacola.common.model.vo.PageInfo;
import com.devcat.nucacola.company.model.vo.Company;
import com.devcat.nucacola.company.model.vo.Industries;
import com.devcat.nucacola.company.model.vo.TechStack;
import com.devcat.nucacola.member.model.vo.Career;
import com.devcat.nucacola.member.model.vo.Member;
import com.devcat.nucacola.member.model.vo.Bookmark;
import com.devcat.nucacola.recruits.model.vo.Recruit;

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


	public int updateCompanyProfileInfo(SqlSessionTemplate sqlSession, Company c) {
		
		return sqlSession.update("companymapper.updateCompanyProfileInfo",c);
	}

	public ArrayList<Industries> selectCompanyIndus(SqlSessionTemplate sqlSession, int cno) {
		
		return (ArrayList)sqlSession.selectList("companymapper.selectCompanyIndus",cno);
	}

	public int selectMemberCount(SqlSessionTemplate sqlSession, int cno) {//회사 구성원 수 조회
		return sqlSession.selectOne("companymapper.selectMemberCount",cno);
	}

	public ArrayList<String> selectPositionList(SqlSessionTemplate sqlSession, int cno) {
		return (ArrayList)sqlSession.selectList("companymapper.selectPositionList",cno);
	}

	public int addMember(SqlSessionTemplate sqlSession, List<Career> memberList) {
		return sqlSession.insert("companymapper.addMember", memberList);
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
	
	// 채용마감처리
	public int deadlineBtn(SqlSessionTemplate sqlSession, int rno) {
		return sqlSession.update("companymapper.deadlineBtn", rno);
	}

	//회사 검색
	public ArrayList<Company> searchCompanyList(SqlSessionTemplate sqlSession,PageInfo pi, String keyword, 
												int uno, String[] hList, String[] lList, String[] iList){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();	
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		// 전달해줘야 할 값들 해쉬맵에 담겨있음
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("keyword",keyword);
		map.put("uno", uno);
		map.put("hList", hList);
		map.put("lList", lList);
		map.put("iList", iList);
		
		if(iList[0].equals("")) {   //산업분야 배열이 비어있을 경우
			return (ArrayList)sqlSession.selectList("companymapper.searchCompList", map, rowBounds);
		
		}else {  //산업분야 배열이 있을 경우
			return (ArrayList)sqlSession.selectList("companymapper.searchCompIndusList", map, rowBounds);
		}
	
		
	}

	//회사 레코드 갯수
	public int countCompany(SqlSessionTemplate sqlSession, String keyword) {
		
		return sqlSession.selectOne("companymapper.countCompany", keyword);
	}
	
	//회사 인기순 정렬
	public ArrayList<Company> rankingCompanyList(SqlSessionTemplate sqlSession, PageInfo pi, int uno){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("companymapper.rankingCompanyList",uno, rowBounds);
	}

	public int deleteCompanyIndus(SqlSessionTemplate sqlSession, int compNo) {
		
		return sqlSession.delete("companymapper.deleteCompanyIndus", compNo);
	}

	public int updateCompindus(SqlSessionTemplate sqlSession, HashMap<String, Object> hm) {
		
		return sqlSession.insert("companymapper.updateCompindus", hm);
	}

	public int updateCompanyAddress(SqlSessionTemplate sqlSession, Company c) {
		
		return sqlSession.update("companymapper.updateCompanyAddress", c);
	}

	public int deleteCompanySkill(SqlSessionTemplate sqlSession, int compNo) {
		
		return sqlSession.delete("companymapper.deleteCompanySkill", compNo);
	}

	public ArrayList<TechStack> selectTechList(SqlSessionTemplate sqlSession, int cno) {
		return (ArrayList)sqlSession.selectList("companymapper.selectTechList", cno);
	}

	public ArrayList<Industries> selectIndustryList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("companymapper.selectIndustryList");
	}

	public ArrayList<Industries> selectCompanyIndustryList(SqlSessionTemplate sqlSession, int cno) {
		return (ArrayList)sqlSession.selectList("companymapper.selectCompanyIndustryList",cno);
	}
	
	public ArrayList<Member> selectUserSearch(SqlSessionTemplate sqlSession, PageInfo pi , String keyword){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("companymapper.selectUserSearch", keyword, rowBounds);
	}
	
	public ArrayList<Recruit> selectRecruitSearch(SqlSessionTemplate sqlSession, PageInfo pi , String keyword){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("companymapper.selectRecruitSearch", keyword, rowBounds);
	}

	public ArrayList<Company> selectCompanySearch(SqlSessionTemplate sqlSession, PageInfo pi , String keyword){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("companymapper.selectCompanySearch", keyword, rowBounds);
	}

	public int selectCompanyNoUn(SqlSessionTemplate sqlSession, int uno) {
		
		return sqlSession.selectOne("companymapper.selectCompanyNoUn",uno);
	}
	
}