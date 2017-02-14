package controler.role;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;

import controler.base.BaseController;
import po.Admin;
import po.ResModel;
import po.Role;
import service.RoleService;
import utils.ST;

@Controller
@RequestMapping(value="/role")
public class RoleControler extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(RoleControler.class);

	private String ROLE_PAGE = "role/role";
	
	@Autowired
	private RoleService roleService;
	
	@RequestMapping(value="/rolePage")
	public ModelAndView rolePage(HttpServletRequest request,HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		mv.setViewName(ROLE_PAGE);
		return mv;
	}
	
	@RequestMapping(value = "/selectRole")
    @ResponseBody
    public PageInfo selectAdminByParams(HttpServletRequest request, HttpServletResponse response)throws Exception{
	 	String sidx = getParam("sidx");// 排序字段;
        String sord = getParam("sord");// 升序降序;
        PageInfo pageInfo = new PageInfo();
        try {
        	int oneRecord = Integer.valueOf(getParam("rows"));// 一页几行
            int pageNo = Integer.valueOf(getParam("page"));// 第几页
            String displayName = getParam("displayName");
            String beginTime = getParam("beginTime");
            String endTime = getParam("endTime");
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("sidx", sidx);// 排序字段
            map.put("sord", sord);// 升序降序
            map.put("rowCount", oneRecord);//一页几行
            map.put("pageNo", pageNo);
            if(!ST.isNull(beginTime)){
            	map.put("beginTime", beginTime + " 00:00:00");
            }
            if(!ST.isNull(endTime)){
            	map.put("endTime", endTime + " 59:59:59");
            }
            map.put("displayName", displayName);
            pageInfo= (PageInfo)roleService.selectRoleByParams(map);
		} catch (Exception e) {
			logger.error("selectAdmin error:" + e);
		}
        return pageInfo;
	}
	
	@RequestMapping(value="/saveRole")
	@ResponseBody
	public ResModel saveRole(@ModelAttribute Role role, HttpServletRequest request,HttpServletResponse response){
		ResModel  resModel = new ResModel();
		boolean bl = false;
		try {
			bl = roleService.saveRole(role);
		} catch (Exception e) {
			logger.error("saveRole error:" + e);
			resModel.setSuccess(bl);
			return resModel;
		}
		resModel.setSuccess(bl);
		resModel.setMsg("插入成功！");
		return resModel;
	}
	
	@RequestMapping(value="/selectRoleByRoleId")
	@ResponseBody
	public Role selectRoleByRoleId(HttpServletRequest request,HttpServletResponse response){
		String roleId = getParam("roleId");
		Role role = new Role();
		if(ST.isNull(roleId)){
			return role;
		}
		try {
			role = roleService.selectRoleByRoleId(Integer.valueOf(roleId));
		} catch (Exception e) {
			logger.error("selectRoleByRoleId error:" + e);
		}
		return role;
	}
	
	@RequestMapping(value="/updateRole")
	@ResponseBody
	public ResModel updateRole(@ModelAttribute Role role,
			HttpServletRequest request,HttpServletResponse response){
		ResModel  resModel = new ResModel();
		boolean bl = false;
		try {
			bl = roleService.updateRole(role);
		} catch (Exception e) {
			logger.error("updateRole error:" + e);
			resModel.setSuccess(bl);
			return resModel;
		}
		resModel.setSuccess(bl);
		return resModel;
	}
}
