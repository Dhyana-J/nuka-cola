package com.devcat.nucacola.company.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.devcat.nucacola.common.model.vo.PageInfo;
import com.devcat.nucacola.company.model.vo.Company;
import com.devcat.nucacola.company.model.vo.Industries;

public interface CompanyService {
	
	//1.  기업 리스트 조회용 서비스
	int selectListCount();
	ArrayList<Company> selectCompanyList(PageInfo pi);
	
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
	
	
	//7. 기업 소개 수정용
	int updateCompanyProfileInfo(Company c);
	
	
	//8. 산업번호, 산업 이름 알아오기
	ArrayList<Industries> selectCompanyIndus(int cno);
	
	
	
	
}
