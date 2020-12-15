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



public class Comment {
	/*
	 * 댓글식별자 
	 * 내용 
	 * 유저식별자 
	 * 게시글식별자 
	 * 작성일 
	 * 수정일
	 */
	
	private int commentNo;
	private String commentContent;
	private int userNo;
	private int postNo;
	private String createdAt;
	private String updatedAt;

	
}
