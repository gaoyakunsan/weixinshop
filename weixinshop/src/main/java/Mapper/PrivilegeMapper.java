package Mapper;
import java.util.List;
import java.util.Map;

import po.Privilege;
import tk.mybatis.mapper.common.Mapper;

public interface PrivilegeMapper extends Mapper<Privilege>{
    /*int deleteByPrimaryKey(PrivilegeKey key);

    int insert(Privilege record);

    int insertSelective(Privilege record);

    Privilege selectByPrimaryKey(PrivilegeKey key);

    int updateByPrimaryKeySelective(Privilege record);

    int updateByPrimaryKey(Privilege record);*/
	
	List<Privilege> selectPrivilegeByParams(Map<String, Object> map);
	void deletePrivilegeByIds(List<Integer> ids);
}