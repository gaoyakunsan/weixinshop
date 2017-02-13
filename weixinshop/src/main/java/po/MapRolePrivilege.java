package po;

import java.util.Date;

public class MapRolePrivilege extends BaseEntity {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 3092507639488764854L;

	private Integer mapRolePrivilegeId;
	
    private Integer roleId;

    private Integer privilegeId;

    private Byte isDeleted;

    private Date createdTime;

    private Date updatedTime;

    
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

    public Byte getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Byte isDeleted) {
        this.isDeleted = isDeleted;
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public Date getUpdatedTime() {
        return updatedTime;
    }

    public void setUpdatedTime(Date updatedTime) {
        this.updatedTime = updatedTime;
    }
}