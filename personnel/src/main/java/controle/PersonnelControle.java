package controle;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import util.HandleProperties;
import dao.PersonnelChatDao;
import dao.PersonnelDao;
import dao.ResourceInfoDao;
import dao.UserDao;
import entity.Auth;
import entity.Personnel;
import entity.PersonnelChat;
import entity.ResourceInfo;
import entity.SearchPage;
import entity.SearchPage.SearchValue;
import entity.User;


@Controller
@RequestMapping("/personnel")
public class PersonnelControle {
	@Resource
	private UserDao userdao;
	@Resource
	private PersonnelDao personnelDao;
	@Resource
	private PersonnelChatDao personnelChatDao; 
	
	@Resource
	private ResourceInfoDao resourceInfoDao;
	
	
	
	@RequestMapping("/personnel_list")
    public ModelAndView queryPersonnelList(SearchPage searchPage,HttpServletRequest request,String is_all){
		//写入seesion
		HttpSession session = request.getSession();
		//判断当前获取的是否为全部简历，如果是则重新写入session 如果不是则只改变传入的页数
		if(is_all != null){
			//此时不为搜索全部简历
			Integer page_current = searchPage.getPage_current();
			searchPage =(SearchPage) session.getAttribute("search_data");
			searchPage.setPage_current(page_current);
		}
		session.setAttribute("search_data", searchPage);
				
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
		
		if (searchPage == null){
			searchPage = new SearchPage();
		}
		Integer page_current = searchPage.getPage_current();
		if (page_current == null){
			page_current = 1;
			searchPage.setPage_current(1);
		}
		//拆分所在行业
		String industry_value = null;
		if (searchPage.getSearch_data()!=null && searchPage.getSearch_data().size()>0){
			
			for(SearchValue one :searchPage.getSearch_data()){
				if (one.getValue_name().equals("industry")){
					industry_value = one.getValue_value();
					one.setValue_name("");
					one.setValue_value("");
				}
			}
			
		}
		if (industry_value != null){
			
			String[] industry_value_array=industry_value.split(",");
			for (String one_industry_value:industry_value_array){
				SearchValue one_search = new SearchValue();
				one_search.setValue_name("industry");
				one_search.setValue_value(one_industry_value);
				searchPage.getSearch_data().add(one_search);
			}
		}
		
		List<Personnel> personnel_list=personnelDao.findPersonneAll(searchPage);
		
		Integer page_count = personnelDao.getPersonnelPageCount(searchPage);
		
		ModelAndView model = new ModelAndView("/WEB-INF/personnel/list.jsp");
		model.addObject("personnel_list", personnel_list);
		model.addObject("page_count", page_count/14+(page_count%14==0?0:1));//总页数
		model.addObject("page_current", page_current);//当前页
		model.addObject("page_size", searchPage.getPage_size());//当前页
		
		
		//获取用户权限
		
		List<User> user_list=userdao.findUserByAccountAndPwd(user.getUser_account(),user.getPwd());
		List<Auth> user_auth = new ArrayList<>();
		if (user_list.size()>0){
			List<Auth> auth_list = user_list.get(0).getAuth_list();
			if(auth_list.size() > 0){
				user_auth = auth_list;
			}
			
		}
		model.addObject("user_auth", user_auth);//权限
		model.addObject("user", user);//用户
		
		
    	return model;
    }
	
	@RequestMapping("/update_jsp")
    public ModelAndView UpdateJsp(Integer personnel_id,String action_type,HttpServletRequest request){
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
		
		if (personnel_id==null){
			ModelAndView model = new ModelAndView("/WEB-INF/personnel/update.jsp");
			model.addObject("user_auth", user_auth);//权限
			model.addObject("action_type", "update");
			return model;
		}
	    Personnel personnel=personnelDao.findPersonnelById(personnel_id);
	    //根据resource_id获取上传文件的详细信息
	    ResourceInfo resourceInfo = null;
	    if (personnel.getResource_id() != null){
	    	resourceInfo=resourceInfoDao.findResourceById(personnel.getResource_id());
	    	
	    }
	    List<PersonnelChat> chatList=personnelChatDao.findChatByPersionnelId(personnel.getPersonnel_id());
		ModelAndView model = new ModelAndView("/WEB-INF/personnel/update.jsp");
		model.addObject("personnel", personnel);
		model.addObject("chatList", chatList);
		
		model.addObject("action_type", action_type);
	
		model.addObject("user_auth", user_auth);//权限
		model.addObject("user", user);//用户
		
		model.addObject("resourceInfo", resourceInfo);//文件详情
		
		
		System.out.println(personnel.getFirst_name());
		
    	return model;
    }
	
	@RequestMapping("/update_aciton")
    public String  UpdateAciton(Personnel personnel,HttpSession session,RedirectAttributes attr) {
	    System.out.println("保存的简历姓名"+personnel.getFirst_name());
	    
	    if (personnel.getPersonnel_id() != null){
	    	 personnelDao.update(personnel);
	    }else{
	    	 personnelDao.save(personnel);
	    	 return "redirect:./personnel_list";
	    }
	    SearchPage search_data=(SearchPage) session.getAttribute("search_data");
	    System.out.println(search_data);
	    if (search_data != null){
	    	if(search_data.getSearch_data() != null && search_data.getSearch_data().size() >0){
	    		for(int i=0;i<search_data.getSearch_data().size();i++){
	    			
	    			String value_value = "";
			 		try {
			 			value_value = new String(search_data.getSearch_data().get(i).getValue_value().getBytes("utf-8"),"ISO-8859-1");
			 		} catch (UnsupportedEncodingException e) {
			 			// TODO Auto-generated catch block
			 			e.printStackTrace();
			 		}
			 	    attr.addAttribute("search_data["+i+"].value_value", value_value );
			 	    attr.addAttribute("search_data["+i+"].value_name",search_data.getSearch_data().get(i).getValue_name() );
	    		}
	    	}
	    	
	    	//分页信息
	    	if (search_data.getPage_current() != null){
	    		attr.addAttribute("page_current", search_data.getPage_current());
	    	}
	    	
	    }
	    
	   
	   	return "redirect:./personnel_list";
    }
	
	
	@RequestMapping("/personnel_search")
    public ModelAndView searchPersonnelPage(Integer page_current,HttpServletRequest request){
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
		ModelAndView model = new ModelAndView("/WEB-INF/personnel/search.jsp");
		//获取用户权限
		
		List<User> user_list=userdao.findUserByAccountAndPwd(user.getUser_account(),user.getPwd());
		List<Auth> user_auth = new ArrayList<>();
		if (user_list.size()>0){
			List<Auth> auth_list = user_list.get(0).getAuth_list();
			if(auth_list.size() > 0){
				user_auth = auth_list;
			}
					
		}
		model.addObject("user_auth", user_auth);//权限
		model.addObject("user", user);//用户
	
    	return model;
    }
	
	@RequestMapping(value="/personnel_delete",produces="text/html;charset=UTF-8")
	@ResponseBody()
    public String deletePersonnelAction(Integer personnel_id){
		personnelDao.delete(personnel_id);
		
    	return "成功";
    }
	
	
}
