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
	@RequestMapping("list.cou")
	public String selectListCount() {
		return "/main";
	}
	
	@RequestMapping("list.pos")
	public String selectPostList() {
		return "/main";
	}
	
	// 포스트 작성
	@RequestMapping("insert.pos")
	public String insertPost() {
		return "/main";
	}
	
	
	// 포스트 수정
	@RequestMapping("update.pos")
	public String updatePost() {
		return "/main";
	}
	
	//포스트 삭제
	@RequestMapping("delete.pos")
	public String deletePost() {
		return "/main";
	}
	
	//포스트 좋아요
	@RequestMapping("like.pos")
	public String likePost() {
		return "/main";
	}
	

	// 댓글 조회
	@RequestMapping("list.com")
	public String selectCommentList() {
		return "/main";
	}
	
	
	// 댓글 작성
	@RequestMapping("insert.com")
	public String insertComment() {
		return "/main";
	}
	
}
