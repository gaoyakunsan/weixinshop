package service;

import java.util.List;

import po.Permission;


public interface PermissionService {
	
	public List<Permission> selectPermByAdminId(Integer adminId);
	
}
