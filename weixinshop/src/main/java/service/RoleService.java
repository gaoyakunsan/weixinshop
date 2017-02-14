package service;

import java.util.Map;

import com.github.pagehelper.PageInfo;

import po.Role;

public interface RoleService {
	
	public PageInfo selectRoleByParams(Map<String, Object> map) throws Exception;
	public boolean saveRole(Role role) throws Exception;
	public Role selectRoleByRoleId(Integer roleId) throws Exception;
	public boolean updateRole(Role role) throws Exception;

}
