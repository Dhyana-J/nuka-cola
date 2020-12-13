package com.devcat.nucacola.member.model.service;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.devcat.nucacola.member.model.dao.MemberDao;
import com.devcat.nucacola.member.model.vo.Member;
import com.devcat.nucacola.member.model.vo.TempKey;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private MemberDao mDao;

	
	//-------------이메일 인증용---------------
	
	@Autowired
	private JavaMailSender mailSender; //회원가입 메일인증


	// 회원가입 발송 이메일(인증키 발송)
	public int mailSendWithUserKey(Member m, HttpServletRequest request) {

		//DB에 이메일 인증용 키 삽입(랜덤문자열 생성해서)
		m.setEmailAuth(new TempKey().getKey(false, 20));
		int result = mDao.setAuthKey(sqlSession,m); 
		
		if(result>0) {
			MimeMessage mail = mailSender.createMimeMessage();
			String htmlStr = "<h2>안녕하세요 Nuka-Cola 입니다!</h2><br><br>" 
					+ "<h3>" + m.getUserName() + "님</h3>" + "<p>인증하기 버튼을 누르시면 로그인을 하실 수 있습니다 : " 
					+ "<a href='http://localhost:8888" + request.getContextPath() + "/confirmEmail.me?email="+m.getEmail()+"&emailAuth="+m.getEmailAuth()+"'>인증하기</a></p>"
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

	//-------------이메일 인증용 끝---------------




	@Override
	public Member loginMember(Member m) {
		return mDao.loginMember(sqlSession, m);
	}

	@Override
	public int insertMember(Member m) {
		return mDao.insertMember(sqlSession,m);
	}




}
