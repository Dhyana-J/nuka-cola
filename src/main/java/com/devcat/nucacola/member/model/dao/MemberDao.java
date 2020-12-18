package com.devcat.nucacola.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.devcat.nucacola.common.model.vo.PageInfo;
import com.devcat.nucacola.member.model.vo.Bookmark;
import com.devcat.nucacola.member.model.vo.Carrer;
import com.devcat.nucacola.member.model.vo.CompSub;
import com.devcat.nucacola.member.model.vo.Connection;
import com.devcat.nucacola.member.model.vo.Member;
import com.devcat.nucacola.member.model.vo.Project;

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

	
	
	
	


	
	// 한줄 소개
	public int insertUserInfo(SqlSessionTemplate sqlSession, String userInfo) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updateUserInfo(SqlSessionTemplate sqlSession, String userInfo) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	
	//활동 분야, 기술
	public int checkSkill(SqlSessionTemplate sqlSession, String skillName) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int insertUserFiled(SqlSessionTemplate sqlSession, int skillNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updateUserFiled(SqlSessionTemplate sqlSession, int skillNo) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	
	// 업무분야
	public int insertUserPosi(SqlSessionTemplate sqlSession, String userPosi) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updateUserPosi(SqlSessionTemplate sqlSession, String userPosi) {
		// TODO Auto-generated method stub
		return 0;
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
	
	//인맥 (팔로워, 팔로잉, 연결)
	
	//팔로워(나를팔로우하는사람)
	public ArrayList<Member> selectFollowers(SqlSessionTemplate sqlSession, int userNo, PageInfo pi){
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectFollowers",userNo,rowBounds);
		
	}
	
	public int countFollowers(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.selectOne("memberMapper.countFollowers",userNo);
		
	}
	
	
	
	//팔로잉(내가팔로우하는사람)
	public ArrayList<Member> selectFollowings(SqlSessionTemplate sqlSession, int userNo, PageInfo pi){
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectFollowings",userNo,rowBounds);
		
	}
	
	public int countFollowings(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.selectOne("memberMapper.countFollowings",userNo);
		
	}
	
	//연결된사람(맞팔)
	public ArrayList<Member> selectConnections(SqlSessionTemplate sqlSession, int userNo, PageInfo pi){
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectConnections", userNo,rowBounds);
		
	}
	
	public int countConnections(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.selectOne("memberMapper.countConnections",userNo);
		
	}
	
	
	//팔로잉 추가(내가 다른 사람 팔로우)
	public int addFollowing(SqlSessionTemplate sqlSession, Connection conn) {
		return sqlSession.insert("memberMapper.addFollowing",conn);
	}
	//팔로우 취소
	public int cancelFollowing(SqlSessionTemplate sqlSession, Connection conn) {
		return sqlSession.delete("memberMapper.cancelFollowing",conn);
	}

	
	
	
	
	
	
	
}
