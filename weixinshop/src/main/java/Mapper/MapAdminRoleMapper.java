package Mapper;
import po.MapAdminRole;
import po.MapAdminRoleKey;

public interface MapAdminRoleMapper {
    int deleteByPrimaryKey(MapAdminRoleKey key);

    int insert(MapAdminRole record);

    int insertSelective(MapAdminRole record);

    MapAdminRole selectByPrimaryKey(MapAdminRoleKey key);

    int updateByPrimaryKeySelective(MapAdminRole record);

    int updateByPrimaryKey(MapAdminRole record);
}