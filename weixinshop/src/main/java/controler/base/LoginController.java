/**
 *
 * @author geloin
 * @date 2012-5-5 涓婂崍9:31:52
 */
package controler.base;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import po.Admin;
import service.AdminService;
import service.PermissionService;
import utils.MD5Util;
import utils.ST;
import cache.PermissionCache;

/**
 *
 * @author chenzhangsheng
 * @date 2016-12-7 18:31:52
 */

@Controller
@RequestMapping("/CoreServlet")
public class LoginController extends BaseController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
    @Autowired
    private AdminService adminService;
    
    @Autowired
	private PermissionService permissionService;

    private final String LOGIN_JSP = "login";
    private final String INDEX_JSP = "index";
    
    @RequestMapping(value = "/login")
    public ModelAndView formnoticedetail1(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
    	ModelAndView mv = new ModelAndView();
    	Admin admin=null;
    	String msg=null;
    	String username = getParam("user");//用户名
        String password = getParam("psd");//密码
       if(ST.isNull(username) || ST.isNull(password)){
        	mv.addObject("msg", "用户名或密码不能为空");
        	mv.setViewName(LOGIN_JSP);
        	return mv;
        }
        String passwordMd5 = MD5Util.getMD5(password);
        try{
        admin=(Admin)adminService.login(username, passwordMd5);
        }catch(Exception e){
        	logger.info("login.error="+e);
        	e.printStackTrace();
        	msg = "服务器繁忙，请稍后重试";
            mv.setViewName(LOGIN_JSP);
            mv.addObject("msg", msg);
            return mv;
        }
        if(null==admin){
        	msg = "用户名或密码错误";
            mv.setViewName(LOGIN_JSP);
            mv.addObject("msg", msg);
            return mv;
        }
        if (admin.getIsdelete()) {
            msg = "当前用户已被禁用,请检查用户是否正常";
            mv.addObject("msg", msg);
            mv.setViewName(LOGIN_JSP);
            return mv;
        }
        session.setAttribute("SESSION_USER", admin);
        //初始化此用户的权限并放入缓存中
        try {
        	PermissionCache.init(permissionService, admin);
		} catch (Exception e) {
			logger.error("init PermissionCache error:" + e);
		}
        
        
        mv.setViewName(INDEX_JSP);
        mv.addObject("userName", admin.getUsername()); 
        
        return mv;
    }
    @RequestMapping(value = "/loginjsp", method = RequestMethod.GET)
    public ModelAndView loginJsp(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
    	ModelAndView mv = new ModelAndView();
    	mv.setViewName(LOGIN_JSP);
    	return mv;
    }
}