package com.devcat.nucacola.posts.model.service;

import java.util.ArrayList;

import com.devcat.nucacola.common.model.vo.PageInfo;
import com.devcat.nucacola.posts.model.vo.Comment;
import com.devcat.nucacola.posts.model.vo.Like;
import com.devcat.nucacola.posts.model.vo.Post;

public interface PostService {
	
	//포스트 조회
	int selectListCount();
	ArrayList<Post> selectPostList(PageInfo pi,int uno);
	
	// 포스트 작성
	int insertPost(Post p);
	
	
	//포스트 수정
	
	int updatePost(Post p);
	
	//포스트 삭제

	int deletePost(int pno);
	
	//포스트 좋아요
	int likePost(Like l);
	
	
	// 댓글 조회
	ArrayList<Comment> selectCommentList(int bno);
	// 댓글 작성
	int insertComment(Comment c);
	
	
}
