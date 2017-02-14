package service;

import java.util.Map;

import po.Role;

import com.github.pagehelper.PageInfo;

public interface RoleService {
	
	public PageInfo selectRoleByParams(Map<String, Object> map) throws Exception;
	public boolean saveRole(Role role) throws Exception;

}
