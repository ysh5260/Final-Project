package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.exam.vo.ExamAnswerVO;
import kr.or.ddit.exam.vo.ExamListVO;
import kr.or.ddit.exam.vo.ExamSelectVO;
import kr.or.ddit.exam.vo.ExamVO;
import kr.or.ddit.score.vo.ScoreVO;
import kr.or.ddit.user.vo.UserVO;

public interface ExamMapper {

	// 시험정보에 과목정보 뿌리기
	public List<ExamVO> selectExamSubjectList(String proId);

	// 시험 등록
	public void insertExam(ExamVO examVO);

	// 시험 문제 질문 등록
	public void insertExamQuestions(ExamListVO examListVO);

	// 시험 문제 보기 등록
	public void insertExamMultipleChoice(ExamSelectVO examSelectVO);

	// 한 강의에 해당하는 문제 정보(질문+보기) 가져오기
	public List<ExamVO> selectExamInfo(ExamVO examVO);

	// 시험 문제 질문 수정
	public void updateExamList(ExamListVO listVO);

	// 시험 문제 보기 수정
	public void updateExamSelect(ExamSelectVO selectVO);

	// 시험 문제 보기 삭제
	public void deleteExamSelect(ExamSelectVO selectVO);

	// 시험 문제 보기 수정
	public void deleteExamList(ExamListVO listVO);

	
	public List<ExamVO> examGubunList(Map<String, Object> examSubInfo);

	// 시험 삭제
	public void deleteExam(ExamVO examVO);

	// 내가 수강중인 강의중 미응시한 강의 불러오기 
	public List<ExamAnswerVO> stuExamList(String stuId);

	// 학생이 푸는 시험지 폼, 시험지 내용 불러오기
	public List<ExamVO> stuExamForm(ExamVO examVO);

	// 학생 답안 인서트(학생이 시험지를 푸는거임)
	public int stuExamAnswerInsert(ExamAnswerVO examAnswerVO);

	// 학생이 시험지를 풀고나면 exa_check가 y로
	public void stuExamAnswerUpdate(ExamAnswerVO examAnswerVO);

	// 학생이 제출이 답안이 있으면 
	public int haveAnswer(ExamAnswerVO examAnswerVO);

	// 학생 답안 불러오기 
	public List<ExamAnswerVO> stuAnswerSelect(ExamAnswerVO examAnswerVO);

	// 본인이 시험본 내역의 상태에 따라 결과 제공(ServiceResult)
	public List<ExamAnswerVO> checkExamStatus(ExamAnswerVO examAnswerVO);

	// 학생 시험 시간 초과되서 0점됨
	public int insertZeroScore(ExamAnswerVO answerVO);

	// 교수가 해당과목에 대해 이미 출제한 정보가 있다면 상태 결과 제공
	public List<ExamVO> checkExamSubmitStatus(ExamVO examVO);

	// 시험지 출제하면 성적 테이블에 중간점수, 기말점수 업데이트
	public void stuExamScoreUpdate(ExamAnswerVO examAnswerVO);

	
	// 클래스룸 안 시험 정보(리스트)
	public List<ExamVO> selectExamInfoInClassRoom(String lecCode);




	

}
