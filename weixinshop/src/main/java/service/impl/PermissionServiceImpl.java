package service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import po.Permission;
import service.PermissionService;
import Mapper.PermissionMapper;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Transactional
@Service
public class PermissionServiceImpl implements PermissionService {

	private static final Logger logger = LoggerFactory.getLogger(PermissionServiceImpl.class);
	
	@Autowired
	private PermissionMapper permissionMapper;

	public PageInfo<Permission> selectPermissionByParams(Map<String, Object> map)
			throws Exception {
		PageHelper.startPage((Integer)map.get("pageNo"),(Integer)map.get("rowCount"));
		List<Permission> list = permissionMapper.selectPermissionByParams(map);
	    PageInfo<Permission> page = new PageInfo<Permission>(list);
		return page;
	}

	public boolean savePermission(Permission permission) {
		// TODO Auto-generated method stub
		try {
			permissionMapper.insertSelective(permission);
		} catch (Exception e) {
			logger.error("savePermission error:" + e);
			return false;
		}
		return true;
	}

	public Permission selectPermissionByPermissionId(Integer id) {
		// TODO Auto-generated method stub
		Permission permission = new Permission();
		try {
			permission = permissionMapper.selectByPrimaryKey(id);
		} catch (Exception e) {
			// TODO: handle exception
			logger.error("selectPermissionByPermissionId error:" + e);
		}
		return permission;
	}

	public boolean updatePermission(Permission permission) {
		// TODO Auto-generated method stub
		try {
			permissionMapper.updateByPrimaryKeySelective(permission);
		} catch (Exception e) {
			// TODO: handle exception
			logger.error("updatePermission error:" + e);
			return false;
		}
		return true;
	}
	
	

}
