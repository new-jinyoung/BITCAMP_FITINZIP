package com.spring.FitInZip.back.cls.clsStatusService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.FitInZip.back.cls.clsStatus.Criteria;
import com.spring.FitInZip.back.cls.dao.ClsStatusDAO;
import com.spring.FitInZip.back.cls.vo.ClsVO;

@Service
public class ClsStatusServiceImpl implements ClsStatusService {
	@Autowired
	private ClsStatusDAO dao;
	
	@Override
	public List<ClsVO> getList(Criteria crt){
		List<ClsVO> list = dao.getListWithPaging(crt);
		return list;
	}
	
	@Override
	public void register(ClsVO cls) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ClsVO getClass(String cno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateClass(ClsVO cls) {
		// TODO Auto-generated method stub
		
	}
	
}