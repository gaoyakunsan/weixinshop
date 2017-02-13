package po;

import java.util.Date;

public class MapAdminRole extends BaseEntity {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8932097570910475983L;

	private Integer mapAdminRoleId;
	 
    private Integer userId;

    private Integer roleId;

    private Byte isDeleted;

    private Date createdTime;

    private Date updatedTime;

    
    public Integer getMapAdminRoleId() {
        return mapAdminRoleId;
    }

    public void setMapAdminRoleId(Integer mapAdminRoleId) {
        this.mapAdminRoleId = mapAdminRoleId;
    }
    
    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
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