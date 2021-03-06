package tags;

import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

import cache.PermissionCache;
import po.MapAdminPermission;

public class HasUrlPermissionTag extends BodyTagSupport{
	
	private static final long serialVersionUID = -6621655057673376488L;
	
	private String link;//  acApplication/forMain.do

    @Override
    public int doStartTag() throws JspException { // 在标签开始处出发该方法
        
        //HttpServletRequest request=(HttpServletRequest) pageContext.getRequest();
        //获取session中存放的权限
        
        //判断是否有权限访问
        /*if (PermissionInterceptor.isOperCanAccess(request, link)) {
            //允许访问标签body
            return BodyTagSupport.EVAL_BODY_INCLUDE;// 返回此则执行标签body中内容，SKIP_BODY则不执行
        } else {
            return BodyTagSupport.SKIP_BODY;
        }*/
        //判断是否有权限访问
        
        List<MapAdminPermission> list =  PermissionCache.getPermList();
        if(list != null && list.size() > 0){
        	boolean flag = false;
        	for(MapAdminPermission map: list){
        		if(map.getPermission().getUrl().equals(link)){
        			flag = true;
        			break;
        		}else{
         			flag = false; 
        		}
        	}
        	if(flag){
        		return BodyTagSupport.EVAL_BODY_INCLUDE;// 返回此则执行标签body中内容，SKIP_BODY则不执行
        	}else{
        		return BodyTagSupport.SKIP_BODY;
        	}
        }
        
        return BodyTagSupport.SKIP_BODY;
    }

    @Override
    public int doEndTag() throws JspException {
        return BodyTagSupport.EVAL_BODY_INCLUDE;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }
}
