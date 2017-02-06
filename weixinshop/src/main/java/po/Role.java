package po;

import javax.persistence.Id;
import javax.persistence.Table;

@Table(name ="role")
public class Role extends BaseEntity {

    private static final long serialVersionUID = 8437635446037343558L;
    private Integer roleId;
    private String displayName;
    private String roleCode;
    private String roleName;
    private Boolean isDeleted = false;
    private String createdTime;
    private String updatedTime;

    @Id
    public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
    
    public String getRoleCode() {
        return roleCode;
    }

	public void setRoleCode(String roleCode) {
        this.roleCode = roleCode;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
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

    public String getDisplayName() {
        return displayName;
    }

    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }


}
