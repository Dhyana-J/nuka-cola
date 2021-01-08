package com.devcat.nucacola.member.model.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.devcat.nucacola.common.model.vo.Chatrooms;
import com.devcat.nucacola.common.model.vo.PageInfo;
import com.devcat.nucacola.common.model.vo.Skills;
import com.devcat.nucacola.company.model.vo.Company;
import com.devcat.nucacola.member.model.dao.MemberDao;
import com.devcat.nucacola.member.model.vo.Bookmark;
import com.devcat.nucacola.member.model.vo.Career;
import com.devcat.nucacola.member.model.vo.CompSub;
import com.devcat.nucacola.member.model.vo.Connection;
import com.devcat.nucacola.member.model.vo.Member;
import com.devcat.nucacola.member.model.vo.PartnerSearch;
import com.devcat.nucacola.member.model.vo.Project;
import com.devcat.nucacola.member.model.vo.TempKey;
import com.devcat.nucacola.member.model.vo.UserFiled;
import com.devcat.nucacola.posts.model.vo.Post;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private MemberDao mDao;

	// -------------이메일 인증용---------------

	@Autowired
	private JavaMailSender mailSender; // 회원가입 메일인증

	// 회원가입 발송 이메일(인증키 발송)
	public int mailSendWithUserKey(Member m, HttpServletRequest request) {

		// DB에 이메일 인증용 키 삽입(랜덤문자열 생성해서)
		m.setEmailAuth(new TempKey().getKey(false, 20));
		int result = mDao.setAuthKey(sqlSession, m);

		if (result > 0) {
			MimeMessage mail = mailSender.createMimeMessage();
			String htmlStr = "<h2>안녕하세요 Nuka-Cola 입니다!</h2><br><br>" + "<h3>" + m.getUserName() + "님</h3>"
					+ "<p>인증하기 버튼을 누르시면 로그인을 하실 수 있습니다 : " + "<a href='http://localhost:8888" + request.getContextPath()
					+ "/confirmEmail.me?email=" + m.getEmail() + "&emailAuth=" + m.getEmailAuth() + "'>인증하기</a></p>"
					+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
			try {
				mail.setSubject("[본인인증] Nuka-Cola의 인증메일입니다", "utf-8");
				mail.setText(htmlStr, "utf-8", "html");
				mail.addRecipient(RecipientType.TO, new InternetAddress(m.getEmail()));
				mailSender.send(mail);
			} catch (MessagingException e) {
				e.printStackTrace();
			}
		}

		return result;

	}

	public int confirmEmail(Member m) {
		return mDao.confirmEmail(sqlSession, m);
	}

	// -------------이메일 인증용 끝---------------

	@Override
	public Member loginMember(Member m) {
		return mDao.loginMember(sqlSession, m);
	}

	@Override
	public int insertMember(Member m) {
		return mDao.insertMember(sqlSession, m);
	}

	@Override
	public String getAccessToken(String authorize_code) {
		
		String access_Token = "";
		String refresh_Token = "";
		String reqUrl ="https://kauth.kakao.com/oauth/token";
		
		
		try {
			URL url = new URL(reqUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			
			// POST요청을 위해서 기본값이 false setDoOutput을 true로!
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			
			// POST요청에 피룡한 파라미터 스트림을 통해 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=9cbaf3231e03e46ca8f9be8ce62f4866");
			sb.append("&redirect_uri=http://localhost:8888/nukacola/kakaologin.me");

			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();
			
			
			//결과코드가 200이라면 성공!
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			
			//요청을 통해 얻은 JSON타입 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			String line = "";
			String result = "";
			
			while((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
			
			//Gson 라이브러리에 포함된 클래스로 JSON 객체 생성
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			
			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
			
			
			System.out.println("access_Token : " + access_Token);
			System.out.println("refresh_Token : " + refresh_Token);
			
			br.close();
			bw.close();
			
		} catch (MalformedURLException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
		
		return access_Token;
		
	}

	public HashMap<String, Object> getUserInfo (String access_Token) {
	    
	    //    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
	    HashMap<String, Object> userInfo = new HashMap<>();
	    String reqURL = "https://kapi.kakao.com/v2/user/me";
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        
	        //    요청에 필요한 Header에 포함될 내용
	        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
	        
	        int responseCode = conn.getResponseCode();
	        System.out.println("responseCode : " + responseCode);
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        String line = "";
	        String result = "";
	        
	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	        System.out.println("response body : " + result);
	        
	        JsonParser parser = new JsonParser();
	        JsonElement element = parser.parse(result);
	        
	        JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
	        JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
	        
	        String nickname = properties.getAsJsonObject().get("nickname").getAsString();
	        String email = kakao_account.getAsJsonObject().get("email").getAsString();
	        
	        userInfo.put("nickname", nickname);
	        userInfo.put("email", email);
	        
	    } catch (IOException e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
	    }
	    
	    return userInfo;
	}

	
	
	public void kakaoLogout(String access_Token) {
		
		String reqURL = "https://kapi.kakao.com/v1/user/logout";
		
		try {
			URL url = new URL(reqURL);
			
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "Bearer" + access_Token);
			
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " +responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			String result = "";
			String line = "";
			
			while((line = br.readLine()) != null) {
				result += line;
			}
			
			System.out.println(result);
			
		} catch (MalformedURLException e) {
		
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	//이메일 중복체크
	@Override
	public String checkEmail(String email) {
		return mDao.checkEmail(sqlSession, email);
	}

	
	
	
	// 연결
	//팔로잉 추가(내가 다른사람 팔로우)
	public int addFollowing(Connection conn) {
		return mDao.addFollowing(sqlSession,  conn);
	}
	//팔로우 취소
	public int cancelFollowing(Connection conn) {
		return mDao.cancelFollowing(sqlSession,  conn);
	}
	



	
	
	/// 프로필
	@Override
	public Member selectUserProfile(int userNo) {
		
		return mDao.selectUserProfile(sqlSession, userNo);
	
	}
	
	//팔로워(나를팔로우하는사람)
	@Override
	public ArrayList<Member> selectFollowers(int userNo, PageInfo pi){
		return mDao.selectFollowers(sqlSession, userNo,pi);
	}
	//팔로잉(내가팔로우하는사람)
	@Override
	public ArrayList<Member> selectFollowings(int userNo, PageInfo pi){
		return mDao.selectFollowings(sqlSession, userNo,pi);
	}
	//연결된사람(맞팔)
	@Override
	public ArrayList<Member> selectConnections(int userNo, PageInfo pi){
		return mDao.selectConnections(sqlSession, userNo, pi);
	}
	
	//팔로잉 수 조회
	@Override
	public ArrayList<Skills> selectUserSkill(int userNo) {
		
		return mDao.selectUserSkill(sqlSession, userNo);
	}
	
	@Override
	public int countFollowings(int userNo) {
		// TODO Auto-generated method stub
		return mDao.countFollowings(sqlSession,userNo);
	}


	//연결된 사람 수 조회
	@Override
	public int countFollowers(int userNo) {
		// TODO Auto-generated method stub
		return mDao.countFollowers(sqlSession,userNo);

	}

	@Override
	public int countConnections(int userNo) {
		// TODO Auto-generated method stub
		return mDao.countConnections(sqlSession,userNo);
	}

	@Override
	public int updateUserInfo(Member m) {
		// TODO Auto-generated method stub
		return mDao.updateUserInfo(sqlSession,m);
	}
	

	

	@Override
	public ArrayList<Skills> checkSkill(String skillName) {
		// TODO Auto-generated method stub
		return mDao.checkSkill(sqlSession,skillName);
	}
	
	@Override
	public ArrayList<Skills> getSkillNo(String[] arr) {
		return mDao.getSkillNo(sqlSession,arr);
	}
	

	@Override
	public int insertUserFiled(HashMap<String,Object> hm) {
		// TODO Auto-generated method stub
		return mDao.insertUserFiled(sqlSession,hm);
	}

	@Override
	public int deleteUserFiled(UserFiled uf) {
		// TODO Auto-generated method stub
		return mDao.deleteUserFiled(sqlSession,uf);
	}


	
	@Override
	public int updateUserPosi(Member m) {
		// TODO Auto-generated method stub
		return mDao.updateUserPosi(sqlSession,m);
	}
	// 프로젝트 입력
	@Override
	public int insertProject(Project p) {
		// TODO Auto-generated method stub
		return mDao.insertProject(sqlSession,p);
	}
	// 프로젝트 삭제 요청
		@Override
		public int deleteProject(Project pj) {
			return mDao.deleteProject(sqlSession, pj);
		}

	// 최종학력 조회
	@Override
	public String selectUserEdu(int userNo) {

		return mDao.selectUserEdu(sqlSession, userNo);
	}
	
	// 최종학력 추가
	@Override
	public int insertUserEdu(Member m) {
		return mDao.insertUserEdu(sqlSession,m);
	}
	
	// 최종학력 수정
	@Override
	public int updateUserEdu(Member m) {
		
		return mDao.updateUserEdu(sqlSession,m);
	}

	// 경력 입력
	@Override
	public int insertCareer(Career c) {
		// TODO Auto-generated method stub
		return mDao.insertCareer(sqlSession,c);
	}

	@Override
	public int updateCareer(Career c) {
		// TODO Auto-generated method stub
		return mDao.updateCareer(sqlSession,c);
	}



	
	
	
	// 기업구독 및 북마크
	
	
	@Override
	public int insertBookmark(Bookmark b) {
		return mDao.insertBookmark(sqlSession, b);
	}
	
	@Override
	public int countBookmark(int uno) {
		return mDao.countBookmark(sqlSession, uno);
	}
	
	@Override
	public ArrayList<Bookmark> selectBookmark(int uno,PageInfo pi) {
		return mDao.selectBookmark(sqlSession,uno,pi);
	}
	@Override
	public ArrayList<Bookmark> selectRecruitSkills(int uno) {
		return mDao.selectRecruitSkills(sqlSession,uno);
	}
	@Override
	public int deleteBookmark(Bookmark bm) {
		return mDao.deleteBookmark(sqlSession, bm);
		
	}

	@Override
	public int deleteSubComp(CompSub cs) {
		return mDao.deleteSubComp(sqlSession, cs);
	}

	@Override
	public int countSubComp(int uno) {
		// TODO Auto-generated method stub
		return mDao.countSubComp(sqlSession, uno);
	}

	@Override
	public ArrayList<CompSub> selectSubComp(int uno, PageInfo pi) {
		// TODO Auto-generated method stub
		return mDao.selectSubComp(sqlSession, uno, pi);
	}

	@Override
	public int insertAvatar(Member m) {
		return mDao.insertAvatar(sqlSession, m);
	}

	public ArrayList<Project> selectProjectList(int userNo) {
		// TODO Auto-generated method stub
		return mDao.selectProjectList(sqlSession, userNo);
	}

	@Override
	public ArrayList<Career> selectCareerList(int userNo) {
		return mDao.selectCareerList(sqlSession, userNo);
	}

	@Override
	public Company selectComNo(int userNo) {
		return null;
	}

	//기업 대표 조회용
	@Override
	public Member selectHead(int cno) {
		return mDao.selectHead(sqlSession, cno);
	}
	@Override
	public int btnSub(int userNo, int compNo, int subscribed) {
		return mDao.btnSub(sqlSession, userNo, compNo, subscribed);
	}


	//기업 구성원 리스트 조회용
	@Override
	public ArrayList<Member> selectMemberList(int cno, PageInfo pi) {
		return mDao.selectMemberList(sqlSession, cno, pi);
	}

	//기업 구성원추가 이메일로 회원찾기용
	@Override
	public ArrayList<Member> searchMemberList(String email) {
		return mDao.searchMemberList(sqlSession, email);
	}

	//기업 구성원 추가시 유저 회사명 업데이트용
	public int updateUserComp(List<Member> updateList) {
		return mDao.updateUserComp(sqlSession,updateList);
	}
	
	
	// 파트너 검색 - 연결
	@Override
	public ArrayList<Member> partnerConnecting(int userNo) {
		return mDao.partnerConnecting(sqlSession, userNo);
	}
	//파트너 검색 - 스킬
	@Override
	public ArrayList<Skills> partnerSearchSkill() {
		return  mDao.partnerSearchSkill(sqlSession);
	}
	//파트너 검색 - 인기프로필 
	@Override
	public List<Integer> partnerPopularProfile(){
		return mDao.partnerPopularProfile(sqlSession);
	}
	//파트너 검색 - 인기프로필 정보
	@Override
	public ArrayList<Member> partnerPopularInfo(List<Integer> popularNo) {
		return mDao.partnerPopularInfo(sqlSession, popularNo);
	}
	//파트너 검색 - 학교명조회
	@Override
	public ArrayList<Member> searchSchoolName(String schoolName) {
		return mDao.searchSchoolName(sqlSession,schoolName);
	}
	
	//파트너 검색 - 스킬리스트에 연관된 사람들 
	@Override
	public List<Integer> partnerSearchSkill(List<Integer> skList) {
		return mDao.partnerSearchSkill(sqlSession,skList);
	}
	//파트너 검색 - 연결된 사람들중 검색결과 총수
	@Override
	public int partnerSearchCount1(PartnerSearch p) {
		return  mDao.partnerSearchCount1(sqlSession,p);
	}
	//파트너 검색 - 연결된 사람들 중 검색결과 인원정보
	@Override
	public ArrayList<Member> partnerConnResult(PartnerSearch p, PageInfo pi1) {
		return mDao.partnerConnResult(sqlSession, p, pi1);
	}
	//파트너 검색 - 그외 사람들중 검색 결과 총수
	@Override
	public int partnerSearchCount2(PartnerSearch p) {
		return mDao.partnerSearchCount2(sqlSession,p);
	}
	//그외 사람들중 검색 결과 인원정보
	@Override
	public ArrayList<Member> partnerETCResult(PartnerSearch p, PageInfo pi2) {
		return mDao.partnerETCResult(sqlSession, p, pi2);
	}

	@Override
	public ArrayList<Member> partnerFollowers(int userNo) {
		return mDao.partnerFollowers(sqlSession, userNo);
	}
	public ArrayList<Chatrooms> selectChatRoomList(int userNo) {
		
		return mDao.selectChatRoomList(sqlSession, userNo);
	}

	@Override
	public int countLikePost(int uno) {
		return mDao.countLikePost(sqlSession, uno);
	}

	@Override
	public ArrayList<Post> selectLikePost(PageInfo pi, int uno) {
		return mDao.selectLikePost(sqlSession, pi, uno);
	}
	
	// 프로필 내가 작석한 post총 개수
	@Override
	public int myPostCount(int userNo) {
		return mDao.myPostCount(sqlSession, userNo);
	}

	// 프로필 내가 작석한 post리스트 조회
	@Override
	public ArrayList<Post> myPostList(int userNo,PageInfo pi) {
		return mDao.myPostList(sqlSession, userNo, pi);
	}
    
	// 프로필 작성한 post삭제
	@Override
	public int myPostDelete(int postNo) {
		return mDao.myPostDelete(sqlSession, postNo);
	}

	




	
	

	

}
