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
	
	//private ArrayList<Project> projectList;
}
