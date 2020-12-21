package com.devcat.nucacola.posts.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.devcat.nucacola.common.model.vo.PageInfo;
import com.devcat.nucacola.posts.model.vo.Comment;
import com.devcat.nucacola.posts.model.vo.Post;

@Repository
public class PostDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("post-mapper.selectListCount");
	}

	public ArrayList<Post> selectPostList(SqlSessionTemplate sqlSession, PageInfo pi,int uno) {
		// TODO Auto-generated method stub

		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

		return (ArrayList)sqlSession.selectList("post-mapper.selectPostList", uno, rowBounds);
	}

	public int insertPost(SqlSessionTemplate sqlSession, Post p) {
		// TODO Auto-generated method stub
		return sqlSession.insert("post-mapper.insertPost",p);

	}

	public int updatePost(SqlSessionTemplate sqlSession, Post p) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deletePost(SqlSessionTemplate sqlSession, int pno) {
		// TODO Auto-generated method stub
		return 0;
	}

	public ArrayList<Comment> selectCommentList(SqlSessionTemplate sqlSession, int pno) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("post-mapper.selectCommentList", pno);
	}

	public int insertComment(SqlSessionTemplate sqlSession, Comment c) {
		// TODO Auto-generated method stub
		return sqlSession.insert("post-mapper.insertComment",c);
	}

}
