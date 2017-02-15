package service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import po.Privilege;
import service.PrivilegeService;
import Mapper.PrivilegeMapper;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Transactional
@Service
public class PrivilegeServiceImpl implements PrivilegeService {

	@Autowired
	private PrivilegeMapper privilegeMapper;
	
	public PageInfo<Privilege> selectPrivilegeByParams(Map<String, Object> map) throws Exception {
		PageHelper.startPage((Integer)map.get("pageNo"),(Integer)map.get("rowCount"));
		List<Privilege> list = privilegeMapper.selectPrivilegeByParams(map);
	    PageInfo<Privilege> page = new PageInfo<Privilege>(list);
		return page;
	}

	public boolean savePrivilege(Privilege privilege) throws Exception {
		try {
			privilegeMapper.insertSelective(privilege);
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	public Privilege selectByPrivilegeId(Integer roleId) throws Exception {
		Privilege privilege = new Privilege(); 
		privilege.setPrivilegeId(roleId);
		return privilegeMapper.selectByPrimaryKey(privilege);
	}

	public boolean updatePrivilege(Privilege privilege) throws Exception{
		privilegeMapper.updateByPrimaryKeySelective(privilege);
		return true;
	}
	
	public boolean deletePrivilegeByIds(List<Integer> ids) throws Exception {
		try {
			privilegeMapper.deletePrivilegeByIds(ids);
		} catch (Exception e) {
			return false;
		}
		return true;
	}
}
