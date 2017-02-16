package po;

import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author yakungao
 *
 */
@Table(name = "map_role_privilege")
public class MapRolePrivilege extends BaseEntity {
	
	private static final long serialVersionUID = 3092507639488764854L;

	@Id
	private Integer mapRolePrivilegeId;
	
    private Integer roleId;

    private Integer privilegeId;

    private Boolean isdelete;

    private Date createTime;

    private Date lastModifiedTime;

    
    public Integer getMapRolePrivilegeId() {
        return mapRolePrivilegeId;
    }

    public void setMapRolePrivilegeId(Integer mapRolePrivilegeId) {
        this.mapRolePrivilegeId = mapRolePrivilegeId;
    }
    
    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public Integer getPrivilegeId() {
        return privilegeId;
    }

    public void setPrivilegeId(Integer privilegeId) {
        this.privilegeId = privilegeId;
    }

	public Boolean getIsdelete() {
		return isdelete;
	}

	public void setIsdelete(Boolean isdelete) {
		this.isdelete = isdelete;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getLastModifiedTime() {
		return lastModifiedTime;
	}

	public void setLastModifiedTime(Date lastModifiedTime) {
		this.lastModifiedTime = lastModifiedTime;
	}
    
}