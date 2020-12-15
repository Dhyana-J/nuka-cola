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
public class Project {

	private int projectId;
	private String projectName;
	private String prjectPosition;
	private int userNo;
	private String projectStart;
	private String projectEnd;
}
