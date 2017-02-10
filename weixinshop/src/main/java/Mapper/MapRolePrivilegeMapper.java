package Mapper;
import po.MapRolePrivilege;
import po.MapRolePrivilegeKey;

public interface MapRolePrivilegeMapper {
    int deleteByPrimaryKey(MapRolePrivilegeKey key);

    int insert(MapRolePrivilege record);

    int insertSelective(MapRolePrivilege record);

    MapRolePrivilege selectByPrimaryKey(MapRolePrivilegeKey key);

    int updateByPrimaryKeySelective(MapRolePrivilege record);

    int updateByPrimaryKey(MapRolePrivilege record);
}