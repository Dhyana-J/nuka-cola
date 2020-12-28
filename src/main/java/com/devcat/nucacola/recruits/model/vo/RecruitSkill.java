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

public class RecruitSkill {

	private int recruitNo;
	private int skillNo;
	private String skillName;
	private String createdAt;
	
}
