package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.common.vo.CurrentInfoVO;
import kr.or.ddit.lecture.vo.LecRoomScheduleVO;
import kr.or.ddit.lecture.vo.LectureIndexVO;
import kr.or.ddit.lecture.vo.LectureVO;
import kr.or.ddit.subject.vo.SubjectVO;

public interface LectureMapper {

	public List<SubjectVO> subjectList(String deptCode);

	public List<LectureVO> applicationList(String userId);

	public int lecPlanRegister(LectureVO lecturePlan);

	public void lecIdxRegister(LectureIndexVO idx);

	public List<LectureVO> empLecPlanList();

	public void lecPlanRefuse(Map<String, String> refuseMap);

	public List<LecRoomScheduleVO> roomSchedule(String lrCode);

	public int lecPlanOk(Map<String, Object> lecOkMap);

	public int lecRoomScheduleInsert(Map<String, Object> lecOkMap);

	public int classOpen(Map<String, Object> lecOkMap);

	public int evalInsert(Map<String, Object> param);

	public CurrentInfoVO getCurrentInfo();

	public int updateLecEvalStatus(Map<String, Object> param);

	
}
