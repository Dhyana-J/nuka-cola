package com.devcat.nucacola.company.model.service;

import java.util.ArrayList;

import com.devcat.nucacola.company.model.vo.Company;

public interface CompanyService {
	
	//1.  기업 리스트 조회용 서비스
	ArrayList<Company> selectCompanyList();
	
	//2. 기업등록용 서비스
	int insertCompany(Company c);
	
	//3. 기업 상세조회용 서비스
	Company selectCompany(int cno);
	
	//4. 기업수정용 서비스
	int updateCompany(Company c);
	
	//5. 기업삭제용 서비스
	int deleteCompany(int cno);
	
	
	
	
}
