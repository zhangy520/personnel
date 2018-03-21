package entity;

import java.util.List;

public class User {
   private Integer user_id;
   private String user_account;
   private String pwd;
   private String user_name;
   private List<Auth> auth_list;
   
   
   
   public Integer getUser_id() {
	return user_id;
   }
   public void setUser_id(Integer user_id) {
	this.user_id = user_id;
   }
   public String getUser_account() {
	return user_account;
   }
   public void setUser_account(String user_account) {
	this.user_account = user_account;
   }
public String getPwd() {
	return pwd;
}
public void setPwd(String pwd) {
	this.pwd = pwd;
}
public List<Auth> getAuth_list() {
	return auth_list;
}
public void setAuth_list(List<Auth> auth_list) {
	this.auth_list = auth_list;
}
public String getUser_name() {
	return user_name;
}
public void setUser_name(String user_name) {
	this.user_name = user_name;
}
   
   
   
}
