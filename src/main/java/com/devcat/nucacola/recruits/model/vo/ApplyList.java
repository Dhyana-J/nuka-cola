package com.devcat.nucacola.recruits.model.vo;

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

public class ApplyList {
	
	private String recruitTitle; // 채용공고제목
	private int recruitRequ;	 // 채용조건
	private String createdAt;	 // 채용공고게시일
	private String appliedAt;	 // 지원일
	private String recruitDl;	 // 채용공고마감일
	private int applyProg;		 // 채용단게
	private int applyNo;		 // 지원식별자
	private int userNo;			 // 유저식별자
	private int recruitNo;		 // 채용공고식별자
	
}
