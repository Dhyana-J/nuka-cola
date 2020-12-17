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
public class CompSub {
	private int userNo;
	private int compNo;
	private String compName;
	private String compInfo;
	private String compLogo;
	private String compBirth;
	private String compHeadcount;
	private String createdAt;
	
	
}
