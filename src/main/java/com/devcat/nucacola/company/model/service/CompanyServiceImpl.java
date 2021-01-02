package com.devcat.nucacola.company.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devcat.nucacola.common.model.vo.PageInfo;
import com.devcat.nucacola.company.model.dao.CompanyDao;
import com.devcat.nucacola.company.model.vo.Company;
import com.devcat.nucacola.company.model.vo.Industries;
import com.devcat.nucacola.company.model.vo.TechStack;
import com.devcat.nucacola.member.model.vo.Career;
import com.devcat.nucacola.member.model.vo.Member;
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
	public ArrayList<Company> selectCompanyList(PageInfo pi, int uno) {
		return cDao.selectCompanyList(sqlSession, pi, uno);
	}

	@Override
	public int insertCompany(Company c) {
		return cDao.insertCompany(sqlSession, c);
	}

	@Override
	public Company selectCompany(int cno) {
		
		return cDao.selectCompany(sqlSession, cno);
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


	@Override
	public int updateCompanyProfileInfo(Company c) {
		
		return cDao.updateCompanyProfileInfo(sqlSession,c);
	}

	@Override
	public ArrayList<Industries> selectCompanyIndus(int cno) {
		
		return cDao.selectCompanyIndus(sqlSession,cno);
	}

	public int selectMemberCount(int cno) {//회사 구성원 수 조회
		return cDao.selectMemberCount(sqlSession,cno);
	}

	@Override
	public ArrayList<String> selectPositionList(int cno) {
		return cDao.selectPositionList(sqlSession,cno);
	}

	@Override
	public int addMember(List<Career> memberList) {
		return cDao.addMember(sqlSession,memberList);
	}



	public ArrayList<Company> searchCompanyList(PageInfo pi, String keyword, int uno, String[] hList, String[] lList, String[] iList) {
		return cDao.searchCompanyList(sqlSession, pi, keyword, uno, hList, lList, iList);
	}

	@Override
	public int countCompany(String keyword) {
		return cDao.countCompany(sqlSession, keyword);
	}

	@Override
	public ArrayList<Company> rankingCompanyList(PageInfo pi, int uno) {
		return cDao.rankingCompanyList(sqlSession, pi, uno);
	}

	@Override
	public int deleteCompanyIndus(int compNo) {
		
		return cDao.deleteCompanyIndus(sqlSession, compNo);
	}

	@Override
	public int updateCompindus(HashMap<String, Object> hm) {
		return cDao.updateCompindus(sqlSession, hm);
	}

	@Override
	public int updateCompanyAddress(Company c) {
		
		return cDao.updateCompanyAddress(sqlSession, c);
	}

	@Override
	public int deleteCompanySkill(int compNo) {
		
		return cDao.deleteCompanySkill(sqlSession, compNo);
	}

	@Override
	public ArrayList<TechStack> selectTechList(int cno) {
		return cDao.selectTechList(sqlSession, cno);
	}

	@Override
	public ArrayList<Member> selectUserSearch(PageInfo pi, String keyword) {
		return cDao.selectUserSearch(sqlSession, pi, keyword);
	}

	@Override
	public ArrayList<Recruit> selectRecruitSearch(PageInfo pi, String keyword) {
		return cDao.selectRecruitSearch(sqlSession, pi, keyword);
	}

	@Override
	public ArrayList<Company> selectCompanySearch(PageInfo pi, String keyword) {
		return cDao.selectCompanySearch(sqlSession, pi, keyword);
	}
	




	
	
}
