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

    private Byte isdelete;

    private Date createTime;

    private Date lastModifiedTime;

    
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

	public Byte getIsdelete() {
		return isdelete;
	}

	public void setIsdelete(Byte isdelete) {
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