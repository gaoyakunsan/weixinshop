package service.impl;

import org.slf4j.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import po.MapAdminRole;
import service.MapAdminRoleService;
import Mapper.MapAdminRoleMapper;

@Transactional
@Service
public class MapAdminRoleServiceImpl implements MapAdminRoleService {

	private static final Logger logger = LoggerFactory.getLogger(MapAdminRoleServiceImpl.class);
	
	@Autowired
	private MapAdminRoleMapper mapAdminRoleMapper;
	
	public boolean saveMapAdminRole(MapAdminRole mar) {
		try {
			mapAdminRoleMapper.insertSelective(mar);
		} catch (Exception e) {
			logger.error("saveMapAdminRole error:" + e);
			return false;
		}
		return true;
	}

	public boolean deleteMapAdminRole(MapAdminRole mar) {
		try {
			mapAdminRoleMapper.delete(mar);
		} catch (Exception e) {
			logger.error("deleteMapAdminRole error:" + e);
			return false;
		}
		return true;
	}
}
