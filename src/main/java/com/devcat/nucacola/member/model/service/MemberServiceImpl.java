package com.devcat.nucacola.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devcat.nucacola.member.model.dao.MemberDao;
import com.devcat.nucacola.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao mDao;

	@Override
	public Member loginMember(Member m) {
		return null;
	}

	@Override
	public int insertMember(Member m) {
		return mDao.insertMember(sqlSession,m);
	}
	
	
	

}
