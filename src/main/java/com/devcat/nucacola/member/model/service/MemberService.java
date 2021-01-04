package com.devcat.nucacola.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.devcat.nucacola.common.model.vo.PageInfo;
import com.devcat.nucacola.common.model.vo.Skills;
import com.devcat.nucacola.company.model.vo.Company;
import com.devcat.nucacola.member.model.vo.Bookmark;
import com.devcat.nucacola.member.model.vo.Career;
import com.devcat.nucacola.member.model.vo.CompSub;
import com.devcat.nucacola.member.model.vo.Connection;
import com.devcat.nucacola.member.model.vo.Member;
import com.devcat.nucacola.member.model.vo.PartnerSearch;
import com.devcat.nucacola.member.model.vo.Project;
import com.devcat.nucacola.member.model.vo.UserFiled;

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
	
	// 팔로워 수 조회
	int countFollowers(int uno);
	// 팔로잉 수 조회
	int countFollowings(int uno);
	// 연결 수 조회
	int countConnections(int uno);

	//팔로우 추가(내가 다른사람 팔로우)
	int addFollowing(Connection conn);
	//팔로우 취소
	int cancelFollowing(Connection conn);
	
	// 연결 취소는?
	// 트리거로 알아서 되게끔 구현
	
	
	
	// 한줄 소개 수정
	int updateUserInfo(Member m);
	

	
	
	// 스킬 검색목록 불러오기
	ArrayList<Skills> checkSkill(String skillName);
	
	// 스킬 번호 알아오기
	ArrayList<Skills> getSkillNo(String[] arr);
	
	
	// 활동 분야 입력
	int insertUserFiled(HashMap<String, Object> hm);
	
	
	// 활동 분야 수정
	int deleteUserFiled(UserFiled uf);
	
	

	// 업무 분야 수정
	int updateUserPosi(Member m);
	
	
	
	
	// 프로젝트 조회
	ArrayList<Project> selectProjectList(int userNo);
	// 프로젝트 입력
	int insertProject(Project p);
	// 프로젝트 수정
	int updateProject(Project p);

	// 최종학력 입력
	int insertUserEdu(Member m);
	
	// 최종학력 수정
	int updateUserEdu(Member m);
	
	// 최종학력 조회
	String selectUserEdu(int userNo);

	// 경력 입력
	int insertCareer(Career c);
	// 경력 수정
	int updateCareer(Career c);

	
	// 경력 조회
	ArrayList<Career> selectCareerList(int userNo);
	
	// 북마크 추가

	int insertBookmark(Bookmark b);
	
	// 북마크 조회
	int  countBookmark(int uno);
	ArrayList<Bookmark> selectBookmark(int uno, PageInfo pi);
	ArrayList<Bookmark> selectRecruitSkills(int uno);

	// 북마크 취소
	int deleteBookmark(Bookmark bm);
	
	// 기업 구독 추가	

	int btnSub(int userNo, int compNo, int subscribed);
	
	// 기업 구독 조회
	int  countSubComp(int uno);
	ArrayList<CompSub> selectSubComp(int uno, PageInfo pi);
	
	// 기업 구독 취소	
	int deleteSubComp(CompSub cs);

	// 유저 프로필 가져오기
	Member selectUserProfile(int userNo);
	
	// 유저 프로필용 기술 가져오기
	ArrayList<Skills> selectUserSkill(int userNo);
	
	// 기업식별자 가져오기
	Company selectComNo(int userNo);
	
	//기업 대표 조회용
	Member selectHead(int cno);

	//기업 구성원리스트 조회용
	ArrayList<Member> selectMemberList(int cno, PageInfo pi);

	//기업 구성원추가 이메일로 회원찾기용
	ArrayList<Member> searchMemberList(String email);
	
	//기업 구성원 추가시 유저 회사명 업데이트용
	public int updateUserComp(List<Member> updateList);
	
	int insertAvatar(Member m);
	
	//파트너 검색 연결된 사람
	ArrayList<Member>partnerConnecting(int userNo);
	
	//파트너 검색 스킬
	ArrayList<Skills> partnerSearchSkill();
	
	//파트너인기프로필 사람조회
	List<Integer> partnerPopularProfile();
	
	//파트너인기프로필 정보조회
	ArrayList<Member> partnerPopularInfo(List<Integer> popularNo);
	
	//파트너 검색(학교명 검색)
	ArrayList<Member> searchSchoolName(String schoolName);
	
	//파트너 검색 - 스킬리스트에 연관된 사람들 
	List<Integer> partnerSearchSkill(List<Integer> skList);
	//연결된 사람들중 검색결과 총수
	int partnerSearchCount1(PartnerSearch p);
	//연결된 사람들중 검색결과 인원 정보
	ArrayList<Member> partnerConnResult(PartnerSearch p, PageInfo pi1);
	//그외 사람들중 검색 결과 총수
	int partnerSearchCount2(PartnerSearch p);
	//그외 사람들중 검색 결과 인원정보
	ArrayList<Member> partnerETCResult(PartnerSearch p, PageInfo pi2);
	
	

}
