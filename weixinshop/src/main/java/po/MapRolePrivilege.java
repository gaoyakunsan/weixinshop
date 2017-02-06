package po;

import java.io.Serializable;

public class MapRolePrivilege implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = -2321717860611927120L;

    private Integer mapRolePrivilegeId;
    private Integer roleId;
    private Integer privilegeId;
    private Boolean isDeleted;
    private String createdTime;
    private String updatedTime;
    
    
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
    public Boolean getIsDeleted() {
        return isDeleted;
    }
    public void setIsDeleted(Boolean isDeleted) {
        this.isDeleted = isDeleted;
    }

    public String getCreatedTime() {
        return createdTime;
    }
    public void setCreatedTime(String createdTime) {
        this.createdTime = createdTime;
    }
    public String getUpdatedTime() {
        return updatedTime;
    }
    public void setUpdatedTime(String updatedTime) {
        this.updatedTime = updatedTime;
    }

}
