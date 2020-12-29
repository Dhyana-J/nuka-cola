package com.devcat.nucacola.recruits.model.vo;

import java.util.ArrayList;

import com.devcat.nucacola.common.model.vo.Skills;

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



public class Recruit {
	/*
	 * 채용공고식별자
	 * 잡타이틀
	 * 채용상세
	 * 상태 
	 * 주요업무 
	 * 업무분야 
	 * 이미지(소개) 
	 * 최소연봉 최대연봉 
	 * 채용조건 
	 * 마감일 
	 * 조회수 
	 * 기업식별자 
	 * 등록일
	 */
	private int recruitNo;			
	private String recruitTitle;
	private String recruitInfo;
	private int recruitState;
	private String recruitMain;
	private int recruitPosi;
	private String recruitImg;
	private int recruitMinSal;
	private int recruitMaxSal;
	private int recruitRequ;
	private String recruitDl;
	private int recruitCount;
	private int compNo;
	private String createdAt;
	private String skillName;
	private String compName;
    
	
	// 여러개의 기술
	private ArrayList<Skills> skillList;

}
