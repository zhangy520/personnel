package controle;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import util.HandleProperties;
import dao.PersonnelChatDao;
import dao.PersonnelDao;
import dao.UserDao;
import entity.Auth;
import entity.Personnel;
import entity.PersonnelChat;
import entity.User;

@Controller
@RequestMapping("/login")
public class LoginControle {
	@Resource
	private UserDao userdao;

	@RequestMapping("/index")
    public ModelAndView index(String mesg){
		ModelAndView model = new ModelAndView("/WEB-INF/login/login.jsp");

		model.addObject("mesg", mesg);
		
    	return model;
    }
	
	
	@RequestMapping(value="/login_aciton",method = RequestMethod.POST)
    public String loginAciton(String account,String pwd,HttpSession session){
	    System.out.println("account-------"+account);
	    System.out.println("pwd-------"+pwd);
	    //根据用户名密码查找数据库有没有对应用户
	    List<User> user_list=userdao.findUserByAccountAndPwd(account,pwd);
	    if (user_list.size() > 0){
	    	List<Auth> auth_list = user_list.get(0).getAuth_list();
	    	if (auth_list != null && auth_list.size() > 0){
	    		String http_path = auth_list.get(0).getAuth_http_path();
	    		session.setAttribute("user", user_list.get(0));
	    		return "redirect:"+http_path;
	    	}else{
	    		String mesg = null;
	    		try {
					mesg = new String("没有权限，请联系管理员！".getBytes("utf-8"),"ISO-8859-1");
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	    		return "redirect:./index"+"?mesg="+mesg;
	    	}
	    	
	    }else{
	    	String mesg = null;
    		try {
				mesg = new String("用户名密码错误！".getBytes("utf-8"),"ISO-8859-1");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	return "redirect:./index"+"?mesg="+mesg;
	    }
    	
    }
	
	//退出登陆
	@RequestMapping(value="/login_out")
    public String loginOut(HttpSession session){
		session.removeAttribute("user");
		return "redirect:./index";
	}
}
