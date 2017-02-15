package service;

import java.util.List;
import java.util.Map;

import po.Privilege;

import com.github.pagehelper.PageInfo;

public interface PrivilegeService {
	
	public PageInfo<Privilege> selectPrivilegeByParams(Map<String, Object> map) throws Exception;
	public boolean savePrivilege(Privilege Privilege) throws Exception;
	public Privilege selectByPrivilegeId(Integer roleId) throws Exception;
	public boolean updatePrivilege(Privilege privilege) throws Exception;
	public boolean deletePrivilegeByIds(List<Integer> ids) throws Exception;

}
