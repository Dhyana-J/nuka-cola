package  com.devcat.nucacola.company.model.vo;

import java.util.ArrayList;

import com.devcat.nucacola.common.model.vo.Skills;

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
public class Company {
	
	private int compNo;
	private String compName;
	private String compInfo;
	private String compEmail;
	private String compAddress;
	private String compLogo;
	private String headCount;
	private String compBirth;
	private String createdAt;
	private String updatedAt;
	private int userNo;
	private int compPm;
	
	// 여러개의 산업분야
	private ArrayList<Industries> industryList;
	// 여러개의 테크스택
	private ArrayList<Skills> skillList;
	
}
