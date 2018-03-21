package controle;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import util.HandleProperties;
import dao.UserDao;
import entity.Auth;
import entity.User;

@Controller
@RequestMapping("/user")
public class UserControle {
	@Resource
	private UserDao userdao;
	
	@RequestMapping("/list")
    public ModelAndView queryUserList(HttpServletRequest request){
		//判断是否登陆并且拥有该权限
				User user = (User) request.getSession().getAttribute("user");
				if (user == null){
					String mesg = null;
				    try {
						mesg = new String("请登陆".getBytes("utf-8"),"ISO-8859-1");
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					ModelAndView model = new ModelAndView("redirect:../login/index");
					model.addObject("mesg", mesg);
					return model;
				}
				
				//获取用户权限
				
				List<User> user_list=userdao.findUserByAccountAndPwd(user.getUser_account(),user.getPwd());
				List<Auth> user_auth = new ArrayList<>();
				if (user_list.size()>0){
					List<Auth> auth_list = user_list.get(0).getAuth_list();
						if(auth_list.size() > 0){
						    user_auth = auth_list;
						}
									
				}
				
		List<User> user_list_all=userdao.findUserAll();
		ModelAndView model = new ModelAndView("/WEB-INF/user/list.jsp");
		model.addObject("user_list", user_list_all);
		model.addObject("user_auth", user_auth);//权限
		model.addObject("user", user);//用户
		return model;
    }
	
	//保存用户权限
	@RequestMapping("/saveUserAuth")
    public ModelAndView saveUserAuth(HttpServletRequest request,String auth_id,Integer auth_user_id){
		System.out.println(auth_id);
		System.out.println(auth_user_id);
		//根据用户id删除该用户所有拥有的权限 
		userdao.deleteUserAuthByUserId(auth_user_id);
		//根据用户id和权限id绑定用户的权限格式为(user_id,auth_id)注意顺序
		if (auth_id!=null){
			String[] auth_id_array = auth_id.split(",");
			String auth_ids = "";
			for (String auth_id_one:auth_id_array){
				auth_ids = auth_ids + "(" + auth_user_id.toString() + "," + auth_id_one + ") ,";
			}
			auth_ids = auth_ids.substring(0, auth_ids.length()-2);
			System.out.println(auth_ids);
			if (auth_ids!=""){
				userdao.addUserAuthByUserId(auth_ids);
			}
		}
		
		
		
		ModelAndView model = new ModelAndView("redirect:./list");
		
		return model;
    }
	
	@RequestMapping(value="/user_delete",produces="text/html;charset=UTF-8")
	@ResponseBody()
    public String deleteUserAction(Integer user_id){
		userdao.delete(user_id);
		userdao.deleteUserAuthByUserId(user_id);
    	return "成功";
    }
	
	@RequestMapping(value="/user_add",produces="text/html;charset=UTF-8")
	@ResponseBody()
    public String addUserAction(User user){
		if (user.getUser_id()!=0){
			userdao.updateUser(user);
		}else{
			userdao.addUser(user);
		}
		
    	return "成功";
    }
	
}
