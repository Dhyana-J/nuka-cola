package com.devcat.nucacola.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Member {
	
	private int userNo;
	private String loginType;
	private String email;
	private String userPwd;
	private String userName;
	private String userBirth;
	private String userPosi;
	private int status;
	private String userInfo;
	private String userEdu;
	private String userAvatar;
	private String createdAt;
	private String updatedAt;
	private String accessToken;
	private String certifyQues;
	private String certifyAns;
	private String emailAuth;
	private String userComp;
	private int compNo;
	
	private String careerPosi; //검색 시 필요
	private String compName; //검색 시 필요
	private String keyword;
	
	//이메일 인증용 생성자
	public Member(String email, String emailAuth) {
		super();
		this.email = email;
		this.emailAuth = emailAuth;
	}


	//기업 구성원 회사 업데이트용 생성자
	public Member(int userNo, String userComp) {
		super();
		this.userNo = userNo;
		this.userComp = userComp;
	}


	
	

}
