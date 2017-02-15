package controler.privilege;

import java.util.HashMap;
import java.util.List;
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

import po.Privilege;
import po.ResModel;
import service.PrivilegeService;
import utils.ST;

import com.github.pagehelper.PageInfo;

import controler.base.BaseController;

@Controller
@RequestMapping(value="/privilege")
public class PrivilegeContoler extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(PrivilegeContoler.class);
	
	private String PRIVILEGE_PAGE = "privilege/privilege";

	@Autowired
	private PrivilegeService privilegeService;
	
	@RequestMapping(value="/privilegePage")
	public ModelAndView privilegePage(HttpServletRequest request,HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		mv.setViewName(PRIVILEGE_PAGE);
		return mv;
	}
	
	@RequestMapping(value = "/selectPrivilege")
    @ResponseBody
    public PageInfo<Privilege> selectPrvilegeByParams(HttpServletRequest request, HttpServletResponse response)throws Exception{
	 	String sidx = getParam("sidx");// 排序字段;
        String sord = getParam("sord");// 升序降序;
        PageInfo<Privilege> pageInfo = new PageInfo<Privilege>();
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
            pageInfo= (PageInfo<Privilege>)privilegeService.selectPrivilegeByParams(map);
		} catch (Exception e) {
			logger.error("selectPrvilegeByParams error:" + e);
		}
        return pageInfo;
	}
	
	@RequestMapping(value="/savePrivilege")
	@ResponseBody
	public ResModel savePrivilege(@ModelAttribute Privilege privilege, HttpServletRequest request,HttpServletResponse response){
		ResModel  resModel = new ResModel();
		boolean bl = false;
		try {
			bl = privilegeService.savePrivilege(privilege);
		} catch (Exception e) {
			logger.error("savePrivilege error:" + e);
			resModel.setSuccess(bl);
			return resModel;
		}
		resModel.setSuccess(bl);
		resModel.setMsg("插入成功！");
		return resModel;
	}
	
	@RequestMapping(value="/selectByPrivilegeId")
	@ResponseBody
	public Privilege selectByPrivilegeId(HttpServletRequest request,HttpServletResponse response){
		String privilegeId = getParam("privilegeId");
		Privilege privilege = new Privilege();
		if(ST.isNull(privilegeId)){
			return privilege;
		}
		try {
			privilege = privilegeService.selectByPrivilegeId(Integer.valueOf(privilegeId));
		} catch (Exception e) {
			logger.error("selectByPrivilegeId error:" + e);
		}
		return privilege;
	}
	
	@RequestMapping(value="/updatePrivilege")
	@ResponseBody
	public ResModel updatePrivilege(@ModelAttribute Privilege privilege,
			HttpServletRequest request,HttpServletResponse response){
		ResModel  resModel = new ResModel();
		boolean bl = false;
		try {
			bl = privilegeService.updatePrivilege(privilege);
		} catch (Exception e) {
			logger.error("updatePrivilege error:" + e);
			resModel.setSuccess(bl);
			return resModel;
		}
		resModel.setSuccess(bl);
		return resModel;
	}
	
	@RequestMapping(value="/deletePrivilege")
	@ResponseBody
	public boolean deletePrivilege(HttpServletRequest request,HttpServletResponse response){
		String privilegeIds = getParam("privilegeIds");
		try {
			List<Integer> list = ST.StringToList(privilegeIds);
			privilegeService.deletePrivilegeByIds(list);
		} catch (Exception e) {
			logger.error("deletePrivilege error:" + e);
			return false;
		}
		return true;
	}
	
}
