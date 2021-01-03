package com.devcat.nucacola.recruits.model.dao;


import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.devcat.nucacola.common.model.vo.PageInfo;
import com.devcat.nucacola.common.model.vo.Skills;
import com.devcat.nucacola.recruits.model.vo.Apply;
import com.devcat.nucacola.recruits.model.vo.Declare;
import com.devcat.nucacola.recruits.model.vo.Recruit;
import com.devcat.nucacola.recruits.model.vo.RecruitDetail;
import com.devcat.nucacola.recruits.model.vo.RecruitSkill;

@Repository
public class RecruitDao {

	public ArrayList<Apply> selectApplyList(SqlSessionTemplate sqlSession, int rno) {
		
		return (ArrayList)sqlSession.selectList("apply-Mapper.selectApplyList", rno);
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
    
    public int selectApplyCount(SqlSessionTemplate sqlSession, int rno) {
    	return sqlSession.selectOne("apply-mapper.selectApplyCount",rno);
    }

	public int selectCompCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("recruit-mapper.selectCompCount");
	}

	public ArrayList<String> selectCnoList(SqlSessionTemplate sqlSession,PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("recruit-mapper.selectCnoList",null,rowBounds);
	}

	public ArrayList<Recruit> selectRecruitList(SqlSessionTemplate sqlSession, int cno) {
		return (ArrayList)sqlSession.selectList("recruit-mapper.selectRecruitList",cno);
	}

	public ArrayList<Skills> selectSkillList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("recruit-mapper.selectSkillList");
	}
}
