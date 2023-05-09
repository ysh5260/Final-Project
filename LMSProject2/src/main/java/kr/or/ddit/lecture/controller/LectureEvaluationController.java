package kr.or.ddit.lecture.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.academic.vo.AcademicVO;
import kr.or.ddit.lecture.service.ILectureEvalService;
import kr.or.ddit.lecture.vo.LectureEvalVO;
import kr.or.ddit.score.service.IScoreService;
import kr.or.ddit.user.vo.StudentVO;
import kr.or.ddit.user.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/lecture")
public class LectureEvaluationController {
	
	@Inject
	private ILectureEvalService service;
	
	@Inject 
	private IScoreService sService;
	
	@GetMapping("/eval/{lecCode}")
	public String lecEvalForm(@PathVariable String lecCode) {
		return "lecture/lectureEvaluation";
	}
	
	@PostMapping("/eval/{lecCode}")
	public String evalInsert(@PathVariable String lecCode ,StudentVO studentVO, AcademicVO academicVO ,Map<String, Object> param, HttpServletRequest req, Model model)throws Exception{
		HttpSession session  =  req.getSession();
		UserVO userVO = (UserVO)session.getAttribute("userInfo");
		String stuId = userVO.getUserId();
		 model.addAttribute("stuList", sService.stuList(userVO.getUserId()));
	     model.addAttribute("averageList", sService.averageList(userVO.getUserId()));
	     model.addAttribute("objectionList", sService.objectionList(userVO.getUserId()));
		
		String[] evList = req.getParameterValues("evList");
		String[] evListStringArray = evList[0].split(",");
		int[] evListIntArray = new int[evListStringArray.length];
		for (int i = 0; i < evListStringArray.length; i++) {
		    evListIntArray[i] = Integer.parseInt(evListStringArray[i]);
		    param.put("leiNum", i+1);
		    param.put("leiScore", evListIntArray[i]);
		    param.put("stuId", stuId);
		    param.put("lecCode", lecCode);
		    service.evalInsert(param);
		    log.info("param"+ param);
		}
		service.updateLecEvalStatus(param);
		return "score/studentScoreDetail";
		
	}
	
}
