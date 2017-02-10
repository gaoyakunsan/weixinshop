package Mapper;
import po.Role;
import po.RoleKey;

public interface RoleMapper {
    int deleteByPrimaryKey(RoleKey key);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(RoleKey key);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);
}