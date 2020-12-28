package com.devcat.nucacola.recruits.model.dao;


import com.devcat.nucacola.recruits.model.vo.Apply;
import com.devcat.nucacola.recruits.model.vo.Declare;
import com.devcat.nucacola.recruits.model.vo.RecruitDetail;
import com.devcat.nucacola.recruits.model.vo.RecruitSkill;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashMap;

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
}
