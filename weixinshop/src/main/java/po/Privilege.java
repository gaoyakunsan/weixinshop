package po;

import java.io.Serializable;

import javax.persistence.Id;
import javax.persistence.Table;

@Table(name ="privilege")
public class Privilege implements Serializable{

    private static final long serialVersionUID = -4038295529366581455L;

    private Integer privilegeId;
    private String displayName;
    private String privilegeName;
    private String privilegeCode;
    private String url;
    private Integer parentId;
    private String parentName;
    private Boolean isDeleted;
    private String createdTime;
    private String updatedTime;
     
    @Id
    public Integer getPrivilegeId() {
		return privilegeId;
	}
	public void setPrivilegeId(Integer privilegeId) {
		this.privilegeId = privilegeId;
	}
	public String getDisplayName() {
        return displayName;
    }
    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }
    public String getPrivilegeName() {
        return privilegeName;
    }
    public void setPrivilegeName(String privilegeName) {
        this.privilegeName = privilegeName;
    }
    public String getPrivilegeCode() {
        return privilegeCode;
    }
    public void setPrivilegeCode(String privilegeCode) {
        this.privilegeCode = privilegeCode;
    }
    public String getUrl() {
        return url;
    }
    public void setUrl(String url) {
        this.url = url;
    }
    public Integer getParentId() {
        return parentId;
    }
    public void setParentId(Integer parentId) {
        this.parentId = parentId;
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

    public String getParentName() {
        return parentName;
    }
    public void setParentName(String parentName) {
        this.parentName = parentName;
    }

}
