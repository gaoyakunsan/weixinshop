package service;

import java.util.List;
import java.util.Map;

import po.Admin;

import com.github.pagehelper.PageInfo;

import dto.AdminSetRoleDTO;

public interface AdminService{
	
	public Admin login(String username,String password) throws Exception;
	
	public PageInfo selectAdminByParams(Map<String, Object> map) throws Exception;
	
	//public void deleteAdminByIds(List<Integer> ids);

	public boolean deleteAdminByIds(List<Integer> ids);
	
	public boolean saveAdmin(Admin admin);
	
	public boolean updateAdmin(Admin admin);
	
	public Admin selectAdminByAdminId(Map<String,Object> map);

	public List<Admin> validateAdmin(String name);
	
	public List<AdminSetRoleDTO> adminSetRole(Integer id);
}
