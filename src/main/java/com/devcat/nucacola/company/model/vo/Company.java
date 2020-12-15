package  com.devcat.nucacola.company.model.vo;

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
	private int headCount;
	private String compBirth;
	private String createdAt;
	private String updatedAt;
	private int userNo;
	private int compPm;

}
