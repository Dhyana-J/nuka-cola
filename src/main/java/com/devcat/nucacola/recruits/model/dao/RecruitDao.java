package com.devcat.nucacola.recruits.model.dao;


import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.devcat.nucacola.common.model.vo.PageInfo;
import com.devcat.nucacola.common.model.vo.Skills;
import com.devcat.nucacola.recruits.model.vo.Apply;
import com.devcat.nucacola.recruits.model.vo.ApplyList;
import com.devcat.nucacola.recruits.model.vo.ApplyProg;
import com.devcat.nucacola.recruits.model.vo.Declare;
import com.devcat.nucacola.recruits.model.vo.Recruit;
import com.devcat.nucacola.recruits.model.vo.RecruitDetail;
import com.devcat.nucacola.recruits.model.vo.RecruitManage;
import com.devcat.nucacola.recruits.model.vo.RecruitSkill;

import com.devcat.nucacola.recruits.model.vo.*;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

	public int selectCompCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("recruit-mapper.selectCompCount");
	}
	
	public int selectCompCount(SqlSessionTemplate sqlSession, Map<String, ArrayList<String>> keywordList) {
		return sqlSession.selectOne("recruit-mapper.selectCompCountWithKey",keywordList);
	}

	public ArrayList<String> selectCnoList(SqlSessionTemplate sqlSession,PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("recruit-mapper.selectCnoList",null,rowBounds);
	}
	
	public ArrayList<String> selectCnoList(SqlSessionTemplate sqlSession, PageInfo pi,
			Map<String, ArrayList<String>> keywordList) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("recruit-mapper.selectCnoListWithKey",keywordList,rowBounds);
	}

	public ArrayList<Recruit> selectRecruitList(SqlSessionTemplate sqlSession, int cno) {
		return (ArrayList)sqlSession.selectList("recruit-mapper.selectRecruitList",cno);
	}
	
	public ArrayList<Recruit> selectRecruitList(SqlSessionTemplate sqlSession,
			Map<String, ArrayList<String>> keywordList) {
		return (ArrayList)sqlSession.selectList("recruit-mapper.selectRecruitListWithKey",keywordList);
	}

	public ArrayList<Skills> selectSkillList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("recruit-mapper.selectSkillList");
	}

	public ArrayList<String> selectLocationList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("recruit-mapper.selectLocationList");
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

	
    public Apply selectApplyDetail(SqlSessionTemplate sqlSession, int ano) {
	    return sqlSession.selectOne("recruit-mapper.selectApplyDetail",ano);
    }

    public ArrayList<RecruitSkill> selectUserSkills(SqlSessionTemplate sqlSession, int uno) {
	    return (ArrayList) sqlSession.selectList("recruit-mapper.selectUserSkills",uno);
    }

    public ArrayList<UserCareer> selectCareers(SqlSessionTemplate sqlSession, int uno) {
        return (ArrayList) sqlSession.selectList("recruit-mapper.selectCareers",uno);
    }

    public int changeProgress(SqlSessionTemplate sqlSession, RecruitSkill rp) {
	    return sqlSession.update("recruit-mapper.changeProgress",rp);
    }

	public int isManager(SqlSessionTemplate sqlSession, int uno) {
		return sqlSession.selectOne("recruit-mapper.checkRecruitManager",uno);
	}

	

	
}
