package com.devcat.nucacola.member.model.vo;

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
public class Bookmark {

	private int userNo;//유저 고유번호
	private int recruitNo;//공고고유번호
	private String recruitTitle;//공고제목
	private int recruitRequ;//공고채용조건
	private String compName;//공고등록회사
	private String createdAt;//공고마감일
	
	
	public Bookmark(int userNo, int recruitNo) {
		super();
		this.userNo = userNo;
		this.recruitNo = recruitNo;
	}

}


