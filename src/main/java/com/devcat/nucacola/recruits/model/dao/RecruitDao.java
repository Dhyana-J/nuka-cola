package com.devcat.nucacola.recruits.model.dao;


import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.devcat.nucacola.recruits.model.vo.Apply;
import com.devcat.nucacola.recruits.model.vo.Declare;
import com.devcat.nucacola.recruits.model.vo.Recruit;
import com.devcat.nucacola.recruits.model.vo.RecruitDetail;
import com.devcat.nucacola.recruits.model.vo.RecruitSkill;

@Repository
public class RecruitDao {

	public ArrayList<Apply> selectApplyList(SqlSessionTemplate sqlSession, int rno) {
		
		return (ArrayList)sqlSession.selectList("applyMapper.selectApplyList", rno);
	}

    public RecruitDetail selectRecruitDetail(SqlSessionTemplate sqlSession, int rno) {
        return  sqlSession.selectOne("recruit-mapper.selectRecruitDetail",rno);
    }

    public ArrayList<RecruitSkill> selectRecruitSkill(SqlSessionTemplate sqlSession, int rno) {
        return (ArrayList) sqlSession.selectList("recruit-mapper.selectDetailSkills",rno);
    }

    public int selectAppliesCount(SqlSessionTemplate sqlSession, int rno) {
        return sqlSession.selectOne("recruit-mapper.selectAppliesCount",rno);
    }

    public int insertDeclare(SqlSessionTemplate sqlSession, Declare d) {
        return sqlSession.insert("recruit-mapper.insertDeclare",d);
    }

	public int insertRecruit(SqlSessionTemplate sqlSession,Recruit re) {
		return sqlSession.insert("recruit-mapper.insertRecruit",re);
	}

	public int selectCompNo(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.selectOne("recruit-mapper.selectCompNo", userNo);
	}
}
