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
	
	private int applyNo;		// 지원공고식별자
	private String applyComment;// 지원자한마디
	private int applyProg;		// 채용단계
	private String createdAt;	// 지원일
	private String updatedAt;	// 수정일
	private int userNo;			// 지원한 유저 식별자
	private int recruitNo;		// 지원한 채용의 식별자 (채용공고식별자)

	//추가 - 채용공고쪽
	private String recruitTitle;
	private int compNo;

	//추가 - 사람쪽
	private String userName;
	private String userEdu;

	//추가 - 회사쪽
	private int manager1No;
	private int manager2No;

	public Apply(int userNo, int recruitNo) {
		super();
		this.userNo = userNo;
		this.recruitNo = recruitNo;
	}
}
