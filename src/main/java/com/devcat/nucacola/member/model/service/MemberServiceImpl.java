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

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.devcat.nucacola.common.model.vo.PageInfo;
import com.devcat.nucacola.common.model.vo.Skills;
import com.devcat.nucacola.member.model.dao.MemberDao;
import com.devcat.nucacola.member.model.vo.Bookmark;
import com.devcat.nucacola.member.model.vo.Carrer;
import com.devcat.nucacola.member.model.vo.CompSub;
import com.devcat.nucacola.member.model.vo.Connection;
import com.devcat.nucacola.member.model.vo.Member;
import com.devcat.nucacola.member.model.vo.Project;
import com.devcat.nucacola.member.model.vo.TempKey;
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
			sb.append("&redirect_uri=http://localhost:2020/nucacola/kakaologin.me");
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
	
	
	
	@Override
	public ArrayList<Connection> selectFollowingList(PageInfo pi, int uno) {
		// TODO Auto-generated method stub
		return mDao.selectFollowingList(sqlSession,pi,uno);
	}

	@Override
	public int deleteFollowing(int followerNo) {
		// TODO Auto-generated method stub
		return mDao.deleteFollowing(sqlSession,followerNo);
	}

	@Override
	public ArrayList<Connection> selectFollowerList(PageInfo pi, int uno) {
		// TODO Auto-generated method stub
		return mDao.selectFollowerList(sqlSession,pi,uno);
	}

	@Override
	public int deleteFollower(int followingNo) {
		// TODO Auto-generated method stub
		return mDao.deleteFollower(sqlSession,followingNo);
	}

	@Override
	public ArrayList<Connection> selectConnectionList(PageInfo pi, int uno) {
		// TODO Auto-generated method stub
		return mDao.selectConnectionList(sqlSession,pi,uno);
	}

	
	
	/// 프로필
	@Override
	public Member selectUserProfile(int userNo) {
		
		return mDao.selectUserProfile(sqlSession, userNo);
	}
	
	@Override
	public ArrayList<Skills> selectUserSkill(int userNo) {
		
		return mDao.selectUserSkill(sqlSession, userNo);
	}
	
	@Override
	public int countFollowing(int userNo) {
		// TODO Auto-generated method stub
		return mDao.countFollowing(sqlSession,userNo);
	}

	@Override
	public int countFollower(int userNo) {
		// TODO Auto-generated method stub
		return mDao.countFollower(sqlSession,userNo);
	}

	@Override
	public int countConnection(int userNo) {
		// TODO Auto-generated method stub
		return mDao.countConnection(sqlSession,userNo);
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
	public int updateUserFiled(int skillNo) {
		// TODO Auto-generated method stub
		return mDao.updateUserFiled(sqlSession,skillNo);
	}



	@Override
	public int updateUserPosi(Member m) {
		// TODO Auto-generated method stub
		return mDao.updateUserPosi(sqlSession,m);
	}

	@Override
	public int insertProject(Project p) {
		// TODO Auto-generated method stub
		return mDao.insertProject(sqlSession,p);
	}

	@Override
	public int updateProject(Project p) {
		// TODO Auto-generated method stub
		return mDao.updateProject(sqlSession,p);
	}

	@Override
	public int insertUserEdu(String userEdu) {
		// TODO Auto-generated method stub
		return mDao.insertUserEdu(sqlSession,userEdu);
	}

	@Override
	public int updateUserEdu(String userEdu) {
		// TODO Auto-generated method stub
		return mDao.updateUserEdu(sqlSession,userEdu);
	}

	@Override
	public int insertCarrer(Carrer c) {
		// TODO Auto-generated method stub
		return mDao.insertCarrer(sqlSession,c);
	}

	@Override
	public int updateCarrer(Carrer c) {
		// TODO Auto-generated method stub
		return mDao.updateCarrer(sqlSession,c);
	}



	
	
	
	// 기업구독 및 좋아요
	
	@Override
	public int insertBookmark(Bookmark b) {
		return mDao.insertBookmark(sqlSession, b);
	}
	
	
	@Override
	public ArrayList<Bookmark> selectBookmark(PageInfo pi) {
		return mDao.selectBookmark(sqlSession, pi);
	}

	@Override
	public int deleteBookmark(int bno) {
		return mDao.deleteBookmark(sqlSession, bno);
	}

	@Override
	public int insertSubComp(CompSub cs) {
		return mDao.insertSubComp(sqlSession, cs);
	}

	@Override
	public ArrayList<CompSub> selectSubComp(PageInfo pi) {
		return mDao.selectSubComp(sqlSession, pi);
	}

	@Override
	public int deleteSubComp(CompSub cs) {
		return mDao.deleteSubComp(sqlSession, cs);
	}






	

}
