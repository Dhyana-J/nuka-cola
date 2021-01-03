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

	//추가 - 채용공고쪽
	private String recruitTitle;
	private int compNo;

	//추가 - 사람쪽
	private String userName;
	private String userEdu;

	//추가 - 회사쪽
	private int manager1No;
	private int manager2No;
}
