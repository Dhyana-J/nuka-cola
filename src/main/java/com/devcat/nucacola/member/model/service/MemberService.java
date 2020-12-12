package com.devcat.nucacola.member.model.service;

import com.devcat.nucacola.member.model.vo.Member;

public interface MemberService {
	
	//1. login
	Member loginMember(Member m);
	
	//2. signup
	int insertMember(Member m);

}
