package com.devcat.nucacola.member.model.service;

import java.util.HashMap;

import com.devcat.nucacola.member.model.vo.Member;

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
	
}
