package kr.co.seaduckene.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.seaduckene.admin.command.AdminVO;
import kr.co.seaduckene.admin.mapper.IAdminMapper;
import kr.co.seaduckene.common.NoticeVO;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class AdminServiceImpl implements IAdminService {
	
	@Autowired
	private IAdminMapper adminMapper;
	
	@Override
	public AdminVO getAdminVo(AdminVO adminVO) {
		log.info(adminVO);
		return adminMapper.getAdminVo(adminVO);
	}
	
	@Override
	public void write(NoticeVO noticeVO) {
		adminMapper.write(noticeVO);
	}
}