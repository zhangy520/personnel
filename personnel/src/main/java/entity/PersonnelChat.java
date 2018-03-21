package entity;

import java.util.Date;

/**
 * @author ellen-zhangyu
 *
 */
public class PersonnelChat {
   private Integer chat_id;
   private Integer user_id;
   private String content;
   private Date create_time;
   private Integer personnel_id;
   private User user;
   
public Integer getChat_id() {
	return chat_id;
}
public void setChat_id(Integer chat_id) {
	this.chat_id = chat_id;
}
public Integer getUser_id() {
	return user_id;
}
public void setUser_id(Integer user_id) {
	this.user_id = user_id;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public Date getCreate_time() {
	return create_time;
}
public void setCreate_time(Date create_time) {
	this.create_time = create_time;
}
public Integer getPersonnel_id() {
	return personnel_id;
}
public void setPersonnel_id(Integer personnel_id) {
	this.personnel_id = personnel_id;
}
public User getUser() {
	return user;
}
public void setUser(User user) {
	this.user = user;
}
   
   
   
   
}
