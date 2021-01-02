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
	
	private String recruitTitle;
	private int recruitRequ;
	private String createdAt;
	private String appliedAt;
	private String recruitDl;
	private int applyProg;
	private int applyNo;
	private int userNo;
	private int recruitNo;
	
}
