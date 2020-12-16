package com.devcat.nucacola.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.devcat.nucacola.common.model.vo.PageInfo;
import com.devcat.nucacola.member.model.vo.Bookmark;
import com.devcat.nucacola.member.model.vo.Carrer;
import com.devcat.nucacola.member.model.vo.CompSub;
import com.devcat.nucacola.member.model.vo.Connection;
import com.devcat.nucacola.member.model.vo.Member;
import com.devcat.nucacola.member.model.vo.Project;

public interface MemberService {
	
	//1. login
	Member loginMember(Member m);
	
	//2. signup
	int insertMember(Member m);
	
	
	//3. 카카오 로그인
	String getAccessToken(String code);
	
	//4.유저정보 가져오기
	HashMap<String, Object> getUserInfo (String access_Token);
	
	//5. 이메일 중복체크
	String checkEmail(String email);
	
	//팔로워(나를팔로우하는사람)조회
	ArrayList<Member> selectFollowers(int userNo, PageInfo pi);
	//팔로잉(내가팔로우하는사람)조회
	ArrayList<Member> selectFollowings(int userNo, PageInfo pi);
	//연결된사람(맞팔)조회
	ArrayList<Member> selectConnections(int userNo, PageInfo pi);
	
	// 팔로잉 취소
	int deleteFollowing(int followerNo);
	
	// 팔로잉 수 조회
	int countFollowings(int uno);
	
	
	// 팔로우 취소
	int deleteFollower(int followingNo);
	
	// 팔로워 수 조회
	int countFollowers(int uno);
	
	// 연결 수 조회
	int countConnections(int uno);

	// 연결 취소는?
	// 트리거로 알아서 되게끔 구현
	
	
	// 한줄 소개 입력
	int insertUserInfo(String UserInfo);
	
	// 한줄 소개 수정
	int updateUserInfo(String UserInfo);
	
	
	// 기술 유무 체크 => count로 체크하는건 어떄?
	
	int checkSkill(String skillName);
	
	
	// 활동 분야 입력
	int insertUserFiled(int skillNo);
	
	
	// 활동 분야 수정
	int updateUserFiled(int skillNo);
	
	
	// 업무 분야 입력
	int insertUserPosi(String userPosi);
	// 업무 분야 수정
	int updateUserPosi(String userPosi);
	
	// 프로젝트 입력
	int insertProject(Project p);
	// 프로젝트 수정
	int updateProject(Project p);
	
	// 최종학력 입력
	int insertUserEdu(String uerEdu);
	// 최종학력 수정
	int updateUserEdu(String userEdu);
	
	
	// 경력 입력
	int insertCarrer(Carrer c);
	// 경력 수정
	int updateCarrer(Carrer c);
	
	
	
	
	
	// 북마크 추가

	int insertBookmark(Bookmark b);
	
	// 북마크 조회
	
	ArrayList<Bookmark> selectBookmark(PageInfo pi);
	
	// 북마크 취소
	
	int deleteBookmark(int bno);
	
	// 기업 구독 추가	
	
	int insertSubComp(CompSub cs);

	// 기업 구독 조회
	ArrayList<CompSub> selectSubComp(PageInfo pi);
	
	// 기업 구독 취소	
	int deleteSubComp(CompSub cs);
	
	
	
	
	
	
	
}
