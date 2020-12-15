package com.devcat.nucacola.posts.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.devcat.nucacola.posts.model.service.PostService;

@Controller
public class PostController {

	@Autowired
	private PostService pService;
	
	
	// 포스트 조회
	@RequestMapping()
	public String selectListCount() {
		
	}
	
	@RequestMapping()
	public String selectPostList() {
		
	}
	
	// 포스트 작성
	@RequestMapping()
	public String insertPost() {
		
	}
	
	
	// 포스트 수정
	@RequestMapping()
	public String updatePost() {
		
	}
	
	//포스트 삭제
	@RequestMapping()
	public String deletePost() {
		
	}
	
	//포스트 좋아요
	@RequestMapping()
	public String likePost() {
		
	}
	

	// 댓글 조회
	@RequestMapping()
	public String selectCommentList() {
		
	}
	
	
	// 댓글 작성
	@RequestMapping()
	public String insertComment() {
		
	}
	
}
