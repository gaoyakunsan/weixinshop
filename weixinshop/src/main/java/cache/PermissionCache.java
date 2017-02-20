package cache;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import po.Permission;
import service.PermissionService;

public class PermissionCache {
	
	private static List<Permission> permList = new ArrayList<Permission>();
	
	@Autowired
	private PermissionService permissionService;
	
	public void init(){
		
	}

}
