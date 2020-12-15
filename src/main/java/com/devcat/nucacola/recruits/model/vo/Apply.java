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


public class Apply {
	
	private int applyNo;
	private String applyComment;
	private int applyProg;
	private String createdAt;
	private String updatedAt;
	private String userNo;
	private int recruitNo;
	
}
