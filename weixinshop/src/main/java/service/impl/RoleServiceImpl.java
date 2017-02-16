package service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import Mapper.RoleMapper;
import po.Role;
import service.RoleService;
@Transactional
@Service
public class RoleServiceImpl implements RoleService {
	
	@Autowired
	private RoleMapper roleMapper;

	public PageInfo<Role> selectRoleByParams(Map<String, Object> map) throws Exception {
		PageHelper.startPage((Integer)map.get("pageNo"),(Integer)map.get("rowCount"));
		List<Role> list = roleMapper.selectRoleByParams(map);
	    PageInfo<Role> page = new PageInfo<Role>(list);
		return page;
	}
	
	public boolean saveRole(Role role) throws Exception{
		try {
			roleMapper.insertSelective(role);
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	public Role selectRoleByRoleId(Integer roleId) throws Exception {
		Role role = new Role();
		role.setRoleId(roleId);
		return roleMapper.selectOne(role);
	}

	public boolean updateRole(Role role) throws Exception {
		try {
			roleMapper.updateByPrimaryKeySelective(role);
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	public boolean deleteRoleByIds(List<Integer> ids) throws Exception {
		try {
			roleMapper.deleteRoleByIds(ids);
		} catch (Exception e) {
			return false;
		}
		return true;
	}

}