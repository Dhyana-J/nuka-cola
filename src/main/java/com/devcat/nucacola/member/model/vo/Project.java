package com.devcat.nucacola.member.model.vo;
import java.util.ArrayList;

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
	private String projectPosition;
	private int userNo;
	private String projectStart;
	private String projectEnd;
	
	// 프로젝트 삭제요청시 필요한 vo
	public Project(int userNo, int projectId) {
		super();
		this.userNo = userNo;
		this.projectId = projectId; 
	}
	
	//private ArrayList<Project> projectList;
}
