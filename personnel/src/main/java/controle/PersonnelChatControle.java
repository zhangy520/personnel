package controle;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import util.HandleProperties;
import dao.PersonnelChatDao;
import dao.PersonnelDao;
import dao.UserDao;
import entity.Personnel;
import entity.PersonnelChat;
import entity.User;

@Controller
@RequestMapping("/personnelchat")
public class PersonnelChatControle {
	@Resource
	private UserDao userdao;
	@Resource
	private PersonnelDao personnelDao;
	@Resource
	private PersonnelChatDao personnelChatDao; 
	
	
	@RequestMapping(value="/save_chat",produces="text/html;charset=UTF-8")
	@ResponseBody()
    public String SaveChat(PersonnelChat personnelChat){
		personnelChat.setCreate_time(new Date());
	    personnelChatDao.save(personnelChat);
    	return "记录成功";
    }
}
