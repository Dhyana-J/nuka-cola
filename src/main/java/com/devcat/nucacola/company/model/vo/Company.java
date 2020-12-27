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
	private int indusNo;   //산업분야 radio 추가 

	private String keyword; // 기업검색
	
	
	// 여러개의 산업분야
	private ArrayList<Industries> industryList;
	
	// 여러개의 기술
	private ArrayList<Skills> skillList;
	// 여러개의 테크스택 
	//private ArrayList<TechStack> teckstackList;
	// 여러개의 회사의 산업분야 
	//private ArrayList<CompIndus> compindusList;
	
}
