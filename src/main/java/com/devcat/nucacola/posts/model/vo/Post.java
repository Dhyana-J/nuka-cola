package com.devcat.nucacola.posts.model.vo;

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

public class Post {

	/*
	 * 게시글식별자 
	 * 게시글내용 
	 * 이미지경로 
	 * 게시글생성일 
	 * 최종수정일 
	 * 유저식별자
	 */
	
	private int postNo;
	private String postContent;
	private String postImg;
	private String createdAt;
	private String updatedAt;
	private int userNo;
	private String userName;
	private String userPosi;
	private String userComp;
	
	
}
