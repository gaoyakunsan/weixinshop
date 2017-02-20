package service.impl;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import po.Permission;
import service.PermissionService;
import Mapper.PermissionMapper;
@Transactional
@Service
public class PermissionServiceImpl implements PermissionService {

	private static final Logger logger = LoggerFactory.getLogger(PermissionServiceImpl.class);
	@Autowired
	private PermissionMapper permissionMapper;
	
	public List<Permission> selectPermByAdminId(Integer adminId) {
		Permission permission = new Permission();
		List<Permission> list = new ArrayList<Permission>();
		try {
			permission.setAdminId(adminId);
			list = permissionMapper.selectByExample(permission);
		} catch (Exception e) {
			logger.error("selectPermByAdminId error:" + e);
			return list;
		}
		return list;
	}
	

}
