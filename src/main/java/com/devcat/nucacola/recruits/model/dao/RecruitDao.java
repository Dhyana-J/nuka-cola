package com.devcat.nucacola.recruits.model.dao;


import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.devcat.nucacola.recruits.model.vo.Apply;
import com.devcat.nucacola.recruits.model.vo.ApplyList;
import com.devcat.nucacola.recruits.model.vo.ApplyProg;
import com.devcat.nucacola.recruits.model.vo.Declare;
import com.devcat.nucacola.recruits.model.vo.Recruit;
import com.devcat.nucacola.recruits.model.vo.RecruitDetail;
import com.devcat.nucacola.recruits.model.vo.RecruitManage;
import com.devcat.nucacola.recruits.model.vo.RecruitSkill;

@Repository
public class RecruitDao {

	public ArrayList<ApplyList> selectApplyList(SqlSessionTemplate sqlSession, int userNo) {
		
		return (ArrayList)sqlSession.selectList("apply-mapper.selectApplyList", userNo);
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
    // 내가 지원한 내역 수 조회
    public int selectApplyCount(SqlSessionTemplate sqlSession, int userNo) {
    	return sqlSession.selectOne("apply-mapper.selectApplyCount",userNo);
    }
    // 지원취소
	public int deleteApplyList(SqlSessionTemplate sqlSession, Apply ap) {
		return sqlSession.delete("apply-mapper.deleteApplyList",ap);
	}
	// 지원자 조회
	public ArrayList<RecruitManage> selectRecruitManageDetail(SqlSessionTemplate sqlSession, int rno) {
		return (ArrayList)sqlSession.selectList("recruit-mapper.selectRecruitManageDetail", rno);
	}
	
	public int selectBookmarkCount(SqlSessionTemplate sqlSession, int rno) {
		return sqlSession.selectOne("recruit-mapper.selectBookmarkCount", rno);
	}

	
}
