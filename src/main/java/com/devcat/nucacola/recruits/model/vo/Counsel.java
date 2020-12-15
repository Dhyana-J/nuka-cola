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

public class Counsel {

	private int counselNo;
	private String counselContent;
	private int counselUser;
	private int applyNo;
	private int counselState;
	private String createdAt;
	
}
