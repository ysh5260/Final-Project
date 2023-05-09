package kr.or.ddit.lecture.service.impl;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.lecture.service.ILectureEvalService;
import kr.or.ddit.mapper.LectureMapper;

@Service
public class LectureEvalServiceImpl implements ILectureEvalService {

	@Inject
	private LectureMapper mapper;
	
	@Override
	public int evalInsert(Map<String, Object> param) {
		return mapper.evalInsert(param);
	}

	@Override
	public int updateLecEvalStatus(Map<String, Object> param) {
		return mapper.updateLecEvalStatus(param);
	}

}
