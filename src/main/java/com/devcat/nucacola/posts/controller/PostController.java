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
		return "/main";
	}
	
	@RequestMapping()
	public String selectPostList() {
		return "/main";
	}
	
	// 포스트 작성
	@RequestMapping()
	public String insertPost() {
		return "/main";
	}
	
	
	// 포스트 수정
	@RequestMapping()
	public String updatePost() {
		return "/main";
	}
	
	//포스트 삭제
	@RequestMapping()
	public String deletePost() {
		return "/main";
	}
	
	//포스트 좋아요
	@RequestMapping()
	public String likePost() {
		return "/main";
	}
	

	// 댓글 조회
	@RequestMapping()
	public String selectCommentList() {
		return "/main";
	}
	
	
	// 댓글 작성
	@RequestMapping()
	public String insertComment() {
		return "/main";
	}
	
}
