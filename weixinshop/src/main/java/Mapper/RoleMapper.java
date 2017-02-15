package Mapper;
import java.util.List;
import java.util.Map;

import po.Role;
import tk.mybatis.mapper.common.Mapper;

public interface RoleMapper extends Mapper<Role> {
    /*int deleteByPrimaryKey(RoleKey key);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(RoleKey key);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);*/
	
	List<Role> selectRoleByParams(Map<String, Object> map);
	void deleteRoleByIds(List<Integer> ids);
}