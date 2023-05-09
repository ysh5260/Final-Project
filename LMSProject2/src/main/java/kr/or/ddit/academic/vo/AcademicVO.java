package kr.or.ddit.academic.vo;

import java.util.Date;

import lombok.Data;

@Data
public class AcademicVO {
	private String stuId;
	private String deptCode;
	private String deptName;
	private String proId;
	private	Date admiDate;	// 입학일자
	private Date gradDate;	// 졸업일자
	private String acaMajor;	// 전공명
	private String acaMinor;	// 부전공명
	private String acaDmajor;	// 복수전공명
	private String acaStatus;	// 학적상태
	private int acaGrade;		// 현재 학년
	private int acaSemester;	// 현재 학기
	private int acaAvgCredit;	// 학점 평균
	private int acaMaj1Score;	// 전공필수 이수한 학점
	private int acaMaj2Score;	// 전공선택 이수한 학점
	private int acaCul1Score;	// 교양필수 이수한 학점
	private int acaCul2Score;	// 교양선택 이수한 학점
	private String collName; 	// 단과대 이름
	private String collCode; 	// 단과대 코드
	private String acStatus;	// 학적변동상태
}
