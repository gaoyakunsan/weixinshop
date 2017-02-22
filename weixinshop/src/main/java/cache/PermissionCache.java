package cache;

import java.util.ArrayList;
import java.util.List;

import po.Admin;
import po.Permission;
import service.PermissionService;

public class PermissionCache {
	
	private static List<Permission> permList = new ArrayList<Permission>();
	
	//@Autowired
	//private static PermissionService permissionService;
	
	public static void init(PermissionService permissionService, Admin admin){
		//permList = permissionService.selectPermByAdminId(admin.getAdminId());
	}
	
	public static List<Permission> getPermList(){
		return permList;
	} 

}
