package kr.or.ddit.classRoom.attendance.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.classRoom.attendance.service.IAtdInsertService;
import kr.or.ddit.classRoom.attendance.vo.AtdVO;
import kr.or.ddit.common.ServiceResult;
import kr.or.ddit.mapper.AttendanceMapper;

@Service
public class AtdInsertServiceImpl implements IAtdInsertService {

	@Inject
	private AttendanceMapper mapper;
	
	@Override
	public List<AtdVO> selectAtdList(String letCode) {
		return mapper.selectAtdList(letCode);
	}

	@Override
	public ServiceResult updateAtd(Map<String, Object> atdMap) {

			int cnt = mapper.updateAtd(atdMap);
			
				ServiceResult result = null;
				
				if(cnt > 0) {
					result = ServiceResult.OK;
				} else {
					result = ServiceResult.FAILED;
				}
				return result;
	}

	@Override
	public String selectSubName(String lecCode) {
		// TODO Auto-generated method stub
		return mapper.selectSubName(lecCode);
	}

	@Override
	public AtdVO selectOneAtd(AtdVO atdVO) {
		return mapper.selectOneAtd(atdVO);
	}

	@Override
	public ServiceResult scoreUpdate(Map<String, Object> atdMap) {
		int cnt = mapper.scoreUpdate(atdMap);
		
		ServiceResult result = null;
		
		if(cnt > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

}
