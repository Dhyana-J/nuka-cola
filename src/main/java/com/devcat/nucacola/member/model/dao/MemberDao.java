package com.devcat.nucacola.member.model.dao;

import java.util.ArrayList;

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
	
	// 북마크 조회
	public ArrayList<Bookmark> selectBookmark(SqlSessionTemplate sqlSession,int uno) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectBookmark", uno);
	}

	public int deleteBookmark(SqlSessionTemplate sqlSession, Bookmark bno) {
		return sqlSession.delete("memberMapper.deleteBookmark",bno);
	}

	//기업구독
	public int insertSubComp(SqlSessionTemplate sqlSession, CompSub cs) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	// 기업구독 조회
	public ArrayList<CompSub> selectSubComp(SqlSessionTemplate sqlSession, int uno) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectSubComp",uno);
	}

	public int deleteSubComp(SqlSessionTemplate sqlSession, CompSub cs) {
		return sqlSession.delete("memberMapper.deleteSubComp", cs);
	}
	
	
	
	
	
	
	
	
}
