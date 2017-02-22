package po;

import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Table;
@Table(name ="admin")
public class MapAdminPermission extends BaseEntity{
	
	private static final long serialVersionUID = -2519699610968036301L;

	@Id
	private Integer mapAdminPermId;

    private Integer adminId;

    private Integer permissionId;

    private Byte isdelete;

    private Date createTime;

    private Date lastModifiedTime;

    public Integer getMapAdminPermId() {
        return mapAdminPermId;
    }

    public void setMapAdminPermId(Integer mapAdminPermId) {
        this.mapAdminPermId = mapAdminPermId;
    }
    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    public Integer getPermissionId() {
        return permissionId;
    }

    public void setPermissionId(Integer permissionId) {
        this.permissionId = permissionId;
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