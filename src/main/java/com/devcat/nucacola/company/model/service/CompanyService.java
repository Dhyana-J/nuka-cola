package com.devcat.nucacola.company.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.devcat.nucacola.common.model.vo.PageInfo;
import com.devcat.nucacola.company.model.vo.Company;
import com.devcat.nucacola.company.model.vo.Industries;
import com.devcat.nucacola.member.model.vo.Career;

public interface CompanyService {
	
	//1.  기업 리스트 조회용 서비스
	int selectListCount();
	ArrayList<Company> selectCompanyList(PageInfo pi, int uno);
	
	//2. 기업등록용 서비스
	int insertCompany(Company c);
	
	//2-1. 스킬번호 알아오기
	ArrayList<Industries> getIndusNo(String[] arr);
	
	//2-2. 회사의 산업분야 등록
	int insertCompindus(HashMap<String, Object> hm);
	
	//2-3. 회사의 기업번호 알아오기
	Company selectCompanyNo(String compName);
	
	//3. 기업 상세조회용 서비스
	Company selectCompany(int cno);
	
	//4. 기업수정용 서비스
	int updateCompany(Company c);
	
	//5. 기업삭제용 서비스
	int deleteCompany(int cno);
	
	//6. 이게 뭔줄 아느냐? 바로 기업 테크스택 등록용
	int insertTech(HashMap<String, Object> backMap);
	
	//7. 회사 구성원 수 조회
	int selectMemberCount(int cno);
	
	//7. 기업 소개 수정용
	int updateCompanyProfileInfo(Company c);
	
	
	//8. 산업번호, 산업 이름 알아오기
	ArrayList<Industries> selectCompanyIndus(int cno);
	
	
	//8. 회사 경력테이블 직책들 조회
	ArrayList<String> selectPositionList(int cno);
	
	//9. 구성원 추가
	int addMember(List<Career> memberList);
	//7. 기업검색용 서비스
	ArrayList<Company> searchCompanyList(PageInfo pi, String keyword);
	
	//8. 기업 인기순정렬 서비스
	ArrayList<Company> rankingCompanyList(PageInfo pi);
	
	//7-1. 기업 레코드 갯수
	int countCompany(String keyword);
	
	
}
