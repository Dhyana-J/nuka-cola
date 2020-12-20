package com.devcat.nucacola.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.devcat.nucacola.common.model.vo.PageInfo;
import com.devcat.nucacola.common.model.vo.Skills;
import com.devcat.nucacola.member.model.vo.Bookmark;
import com.devcat.nucacola.member.model.vo.Carrer;
import com.devcat.nucacola.member.model.vo.CompSub;
import com.devcat.nucacola.member.model.vo.Connection;
import com.devcat.nucacola.member.model.vo.Member;
import com.devcat.nucacola.member.model.vo.Project;
import com.devcat.nucacola.member.model.vo.UserFiled;

@Repository
public class MemberDao {
	
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember",m);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember",m);
	}
	
	//이메일 인증용 키 삽입
	public int setAuthKey(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.setAuthKey", m);
	}
	
	//이메일 인증값 변경
	public int confirmEmail(SqlSessionTemplate sqlSession,Member m) {
		return sqlSession.update("memberMapper.confirmEmail",m);
	}
	
	//이메일 중복체크
	public String checkEmail(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("memberMapper.checkEmail", email);
	}

	
	
	
	
	//팔로잉 조회
	public ArrayList<Connection> selectFollowingList(SqlSessionTemplate sqlSession, PageInfo pi, int uno) {
		// TODO Auto-generated method stub
		return null;
	}
	
	// 팔로잉 삭제
	public int deleteFollowing(SqlSessionTemplate sqlSession, int followerNo) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	// 팔로워 조회
	public ArrayList<Connection> selectFollowerList(SqlSessionTemplate sqlSession, PageInfo pi, int uno) {
		// TODO Auto-generated method stub
		return null;
	}

	// 팔로워 삭제
	public int deleteFollower(SqlSessionTemplate sqlSession, int followingNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	// 연결 조회
	public ArrayList<Connection> selectConnectionList(SqlSessionTemplate sqlSession, PageInfo pi, int uno) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	//팔로잉수
	public int countFollowing(SqlSessionTemplate sqlSession, int uno) {
		// TODO Auto-generated method stub
		return 0;
	}
	// 팔로워수
	public int countFollower(SqlSessionTemplate sqlSession, int uno) {
		// TODO Auto-generated method stub
		return 0;
	}
	// 연결 수
	public int countConnection(SqlSessionTemplate sqlSession, int uno) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	// 한줄 소개
	public int updateUserInfo(SqlSessionTemplate sqlSession,Member m) {
		return sqlSession.update("memberMapper.updateUserInfo",m);
	}

	
	//활동 분야, 기술
	public ArrayList<Skills> checkSkill(SqlSessionTemplate sqlSession, String skillName) {

		return (ArrayList)sqlSession.selectList("memberMapper.checkSkill",skillName);
	}

	public int insertUserFiled(SqlSessionTemplate sqlSession, HashMap<String,Object> hm) {
		
		return sqlSession.insert("memberMapper.insertUserFiled", hm);
		
	}

	public int deleteUserFiled(SqlSessionTemplate sqlSession,UserFiled uf ) {
		// TODO Auto-generated method stub
		return sqlSession.delete("memberMapper.deleteUserField",uf);
	}
	
	
	
	
	// 업무분야
	public int insertUserPosi(SqlSessionTemplate sqlSession, String userPosi) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updateUserPosi(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.update("memberMapper.updateUserPosi",m);
	}
	
	
	//프로젝트
	public int insertProject(SqlSessionTemplate sqlSession, Project p) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updateProject(SqlSessionTemplate sqlSession, Project p) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	// 학력
	public int insertUserEdu(SqlSessionTemplate sqlSession, String userEdu) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updateUserEdu(SqlSessionTemplate sqlSession, String userEdu) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	// 경력
	public int insertCarrer(SqlSessionTemplate sqlSession, Carrer c) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updateCarrer(SqlSessionTemplate sqlSession, Carrer c) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int insertBookmark(SqlSessionTemplate sqlSession, Bookmark b) {
		// TODO Auto-generated method stub
		return 0;
	}

	public ArrayList<Bookmark> selectBookmark(SqlSessionTemplate sqlSession, PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	public int deleteBookmark(SqlSessionTemplate sqlSession, int bno) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int insertSubComp(SqlSessionTemplate sqlSession, CompSub cs) {
		// TODO Auto-generated method stub
		return 0;
	}

	public ArrayList<CompSub> selectSubComp(SqlSessionTemplate sqlSession, PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	public int deleteSubComp(SqlSessionTemplate sqlSession, CompSub cs) {
		// TODO Auto-generated method stub
		return 0;
	}

	public String selectUserInfo(SqlSessionTemplate sqlSession, int userNo) {

		return sqlSession.selectOne("memberMapper.selectUserInfo", userNo);
	}

	public ArrayList<Skills> getSkillNo(SqlSessionTemplate sqlSession, String[] arr) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.getSkillNo",arr);
	}

	public Member selectUserProfile(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.selectOne("memberMapper.selectUserProfile", userNo);
	}

	public ArrayList<Skills> selectUserSkill(SqlSessionTemplate sqlSession, int userNo) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectUserSkill", userNo);
	}


	
	
	
	
	
	
	
}
