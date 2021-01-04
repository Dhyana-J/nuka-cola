package com.devcat.nucacola.recruits.model.vo;
import java.util.Date;

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
public class RecruitManage {
	
	private int recruitNo;
	private String recruitTitle;
	private String recruitDl;
	private int applyNo;
	private int applyProg;
	private String appliedAt;
	private int userNo;
	private String userName;
	private String userAvatar;
	private int compNo;
	
	
	
}
