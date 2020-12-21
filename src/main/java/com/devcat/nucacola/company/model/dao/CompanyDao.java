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
		sqlSession.insert("companymapper.insertCompany", c);
		//	int compNo = 위에서 등록된 회사 조회
		//		서비스 분야를 블 forEach( v
		//		[1,3] 이 배열을 반복시켜서
		//   	반복문 척 순회시 mapper로  1, compNo
		//		반복문 두번째 순회시 mapper로  3, compNo
		// 			v ,comNo 두개를
		// )

	}
}
