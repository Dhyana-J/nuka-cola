package com.devcat.nucacola.posts.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devcat.nucacola.common.model.vo.PageInfo;
import com.devcat.nucacola.posts.model.dao.PostDao;
import com.devcat.nucacola.posts.model.vo.Comment;
import com.devcat.nucacola.posts.model.vo.Like;
import com.devcat.nucacola.posts.model.vo.Post;

@Service
public class PostServiceImpl implements PostService {

	@Autowired
	private PostDao pDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return pDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Post> selectPostList(PageInfo pi,int uno) {
		// TODO Auto-generated method stub
		return pDao.selectPostList(sqlSession, pi,uno);
	}

	@Override
	public int insertPost(Post p) {
		// TODO Auto-generated method stub
		return pDao.insertPost(sqlSession, p);
	}

	@Override
	public int updatePost(Post p) {
		// TODO Auto-generated method stub
		return pDao.updatePost(sqlSession, p);
	}

	@Override
	public int deletePost(int pno) {
		// TODO Auto-generated method stub
		return pDao.deletePost(sqlSession, pno);
	}

	@Override
	public int likePost(Like l) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public ArrayList<Comment> selectCommentList(int pno) {
		// TODO Auto-generated method stub
		return pDao.selectCommentList(sqlSession, pno);
	}

	@Override
	public int insertComment(Comment c) {
		// TODO Auto-generated method stub
		return pDao.insertComment(sqlSession,c);

	}

	@Override
	public int toggleLike(int userNo, int postNo, int islike){
		return pDao.toggleLike(sqlSession, userNo, postNo,islike);
	}

}