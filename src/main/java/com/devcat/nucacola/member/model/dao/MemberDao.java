package com.devcat.nucacola.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.devcat.nucacola.common.model.vo.Chatrooms;
import com.devcat.nucacola.common.model.vo.PageInfo;
import com.devcat.nucacola.common.model.vo.Skills;
import com.devcat.nucacola.common.model.vo.messages;
import com.devcat.nucacola.company.model.vo.Company;
import com.devcat.nucacola.member.model.vo.Bookmark;
import com.devcat.nucacola.member.model.vo.Career;
import com.devcat.nucacola.member.model.vo.CompSub;
import com.devcat.nucacola.member.model.vo.Connection;
import com.devcat.nucacola.member.model.vo.Member;
import com.devcat.nucacola.member.model.vo.PartnerSearch;
import com.devcat.nucacola.member.model.vo.Project;
import com.devcat.nucacola.member.model.vo.UserFiled;
import com.devcat.nucacola.posts.model.vo.Post;

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


	//프로젝트 추가
	public int insertProject(SqlSessionTemplate sqlSession, Project p) {
		return sqlSession.insert("projectMapper.insertUserProject", p);
		
	}
	// 프로젝트삭제
	public int deleteProject(SqlSessionTemplate sqlSession, Project pj) {
		return sqlSession.delete("projectMapper.deleteProject", pj);
	}
	

	// 학력
	public int insertUserEdu(SqlSessionTemplate sqlSession, Member m) {
		return 0;
	}
	
	
	// 학력 조회
	public String selectUserEdu(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.selectOne("memberMapper.selectUserEdu", userNo);
	}


	public int updateUserEdu(SqlSessionTemplate sqlSession,Member m) {
		
		return sqlSession.update("memberMapper.updateUserEdu", m);

	}

	
	// 경력추가
	public int insertCareer(SqlSessionTemplate sqlSession, Career c) {
		
		return sqlSession.insert("memberMapper.insertCareer", c);
	}

	public int updateCareer(SqlSessionTemplate sqlSession, Career c) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int insertBookmark(SqlSessionTemplate sqlSession, Bookmark b) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	// 북마크 조회
	public int countBookmark(SqlSessionTemplate sqlSession, int uno) {
		return sqlSession.selectOne("memberMapper.countBookmark",uno);
	}
	//북마크 페이징 처리
	public ArrayList<Bookmark> selectBookmark(SqlSessionTemplate sqlSession,int uno,PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.selectBookmark", uno,rowBounds);
	}
	public ArrayList<Bookmark> selectRecruitSkills(SqlSessionTemplate sqlSession,int uno) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectRecruitSkills", uno);
	}

	public int deleteBookmark(SqlSessionTemplate sqlSession, Bookmark bno) {
		return sqlSession.delete("memberMapper.deleteBookmark",bno);
	}

	//기업구독
	public int btnSub(SqlSessionTemplate sqlSession, int userNo, int compNo, int subscribed) {
		
		CompSub compSub = new CompSub();
		compSub.setUserNo(userNo);
		compSub.setCompNo(compNo);
		if(subscribed == 0) {
			return sqlSession.insert("memberMapper.subComp", compSub);
		}else {
			return sqlSession.delete("memberMapper.cancleSubComp", compSub);
		}
		
	}
	// 기업구독 조회
	public int countSubComp(SqlSessionTemplate sqlSession, int uno) {
		return sqlSession.selectOne("memberMapper.countSubComp",uno);
	}
	public ArrayList<CompSub> selectSubComp(SqlSessionTemplate sqlSession, int uno, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.selectSubComp",uno,rowBounds);
	}

	public int deleteSubComp(SqlSessionTemplate sqlSession, CompSub cs) {
		return sqlSession.delete("memberMapper.deleteSubComp", cs);
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
	// 유저 프로젝트 알아오기 
	public ArrayList<Project> selectProjectList(SqlSessionTemplate sqlSession, int userNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("projectMapper.selectProjectList", userNo);
	}
	
	// 경력 알아오기
	public ArrayList<Career> selectCareerList(SqlSessionTemplate sqlSession, int userNo) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectCareerList", userNo);
	}

	public int insertAvatar(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.update("memberMapper.insertAvatar", m);
	}


	
	// 기업식별자 알아오기
	public Company selectCompNo(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("companyMapper.selectCompNo", userNo);
	}
	
	//기업 대표 조회용
	
	public Member selectHead(SqlSessionTemplate sqlSession, int cno) { 
		return sqlSession.selectOne("memberMapper.selectHead",cno); 
	}
	 

	//기업 구성원 리스트 조회용
	public ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession, int cno, PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectMemberList",cno,rowBounds);
	}


	//기업 구성원추가 이메일로 회원찾기용
	//대화상대 검색용
	public ArrayList<Member> searchMemberList(SqlSessionTemplate sqlSession, String keyword) {
		return (ArrayList)sqlSession.selectList("memberMapper.searchMemberList",keyword);
	}

	// 기업 구성원추가시 회사명 업데이트용
	public int updateUserComp(SqlSessionTemplate sqlSession, List<Member> updateList) {
		return sqlSession.update("memberMapper.updateUserComp", updateList);
	}

	
	
	// 파트너검색 연결
	public ArrayList<Member> partnerConnecting(SqlSessionTemplate sqlSession, int userNo){
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectConnections",userNo);
	}
	// 파트너 검색 스킬
	public ArrayList<Skills> partnerSearchSkill(SqlSessionTemplate sqlSession) {
		return  (ArrayList)sqlSession.selectList("memberMapper.partnerSearchSkill");
	}
	// 파트너검색 인기프로필
	public List<Integer> partnerPopularProfile(SqlSessionTemplate sqlSession){
		return (List)sqlSession.selectList("memberMapper.partnerPopularProfile"); 
	}
	
	// 파트너검색 
	public ArrayList<Member> partnerPopularInfo(SqlSessionTemplate sqlSession, List<Integer> popularNo){
		System.out.println("dao"+popularNo);
		ArrayList<Member> popularInfo=new ArrayList<>();
		for(Integer p :popularNo) {
			popularInfo.addAll((ArrayList)sqlSession.selectList("memberMapper.partnerPopularInfo", p));
		}
		return popularInfo;
	}
	//파트너 검색 - 학교명조회
	public ArrayList<Member> searchSchoolName(SqlSessionTemplate sqlSession,String schoolName) {
		return (ArrayList)sqlSession.selectList("memberMapper.searchSchoolName",schoolName);
	}
	//파트너 검색 - 스킬리스트에 연관된 사람들 
	public List<Integer> partnerSearchSkill(SqlSessionTemplate sqlSession,List<Integer> skList) {
		HashMap<String, List<Integer>> h = new HashMap<>();
		h.put("skList", skList);
		return (List)sqlSession.selectList("memberMapper.partnerSkill",h);
	}
	
	// 파트너 검색 - 연결된사람중 검색한 결과 총 명수
	public int partnerSearchCount1(SqlSessionTemplate sqlSession, PartnerSearch p) {
			
		return  sqlSession.selectOne("memberMapper.partnerSearchCount1",p);
	}
	// 파트너 검색 - 연결된사람중 검색한 결과 정보
	public ArrayList<Member> partnerConnResult(SqlSessionTemplate sqlSession, PartnerSearch p, PageInfo pi1) {
		int offset = (pi1.getCurrentPage()-1)*pi1.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi1.getBoardLimit()); 
		return  (ArrayList)sqlSession.selectList("memberMapper.partnerConnResult",p,rowBounds);
	}
	// 파트너 검색 - 그외 사람들중 검색한 결과
	public int partnerSearchCount2(SqlSessionTemplate sqlSession, PartnerSearch p) {
		 return  sqlSession.selectOne("memberMapper.partnerSearchCount2",p);
	}
	
	//파트너 검색 - 그외 사람들중 검색한 결과 정보
	public ArrayList<Member> partnerETCResult(SqlSessionTemplate sqlSession,PartnerSearch p, PageInfo pi2) {
		int offset = (pi2.getCurrentPage()-1)*pi2.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi2.getBoardLimit()); 
		return (ArrayList)sqlSession.selectList("memberMapper.partnerETCResult", p, rowBounds);
	}
	public ArrayList<Member> partnerFollowers(SqlSessionTemplate sqlSession,int userNo) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectFollowings",userNo);
	}

	public ArrayList<Chatrooms> selectChatRoomList(SqlSessionTemplate sqlSession, int userNo) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectChatRoomList", userNo);
	}

	// 프로필 내가 작석한 post 총개수
	public int myPostCount(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("memberMapper.myPostCount", userNo);
	}
	
	// 프로필 내가 작석한 post리스트 조회	
	public ArrayList<Post> myPostList(SqlSessionTemplate sqlSession, int userNo,PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit()); 
		return (ArrayList)sqlSession.selectList("memberMapper.profileMyPost", userNo,rowBounds);
	
	}
	// 좋아요 게시물 조회
	public int countLikePost(SqlSessionTemplate sqlSession, int uno) {
		return sqlSession.selectOne("memberMapper.selectListCount", uno);
	}
	
	public ArrayList<Post> selectLikePost(SqlSessionTemplate sqlSession, PageInfo pi, int uno) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectLikePost", uno, rowBounds);
	}
	
	public int myPostDelete(SqlSessionTemplate sqlSession, int postNo) {
		
		return sqlSession.delete("memberMapper.myPostDelete", postNo);
	}
	
	public int myPostUpdate(SqlSessionTemplate sqlSession, Post p) {
		
		return sqlSession.update("memberMapper.myPostUpdate", p);
	}

	public int insertKakaoUser(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.insert("memberMapper.insertKakoUser", m);
	}

	public ArrayList<messages> selectMsgList(SqlSessionTemplate sqlSession, ArrayList<Integer> noList) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectMsgList",noList);
	}

	public ArrayList<messages> selectLatestMsg(SqlSessionTemplate sqlSession, ArrayList<Integer> noList) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectLatestMsg",noList);
	}
	
	public int sendMsg(SqlSessionTemplate sqlSession, Map<String,Object> msgInfo) {
		return sqlSession.insert("memberMapper.insertMsg",msgInfo);
	}

	public int createChatroom(SqlSessionTemplate sqlSession, Map<String, Object> msgInfo) {
		return sqlSession.insert("memberMapper.createChatroom",msgInfo);
	}

	public String selectChatroomNo(SqlSessionTemplate sqlSession, Map<String, Object> msgInfo) {
		return sqlSession.selectOne("memberMapper.selectChatroomNo",msgInfo);
	}

	
//	 비밀번호 수정요청
//	public int findPass(SqlSessionTemplate sqlSession, String email) {
//
//		return sqlSession.update("memberMapper.findPass", email);
//	}
//	

	
	
	
}

