package com.devcat.nucacola.recruits.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.devcat.nucacola.recruits.model.vo.Apply;

@Repository
public class RecruitDao {

	public ArrayList<Apply> selectApplyList(SqlSessionTemplate sqlSession, int rno) {
		
		return (ArrayList)sqlSession.selectList("applyMapper.selectApplyList", rno);
	}

}
