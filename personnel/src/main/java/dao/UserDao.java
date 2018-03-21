package dao;

import java.util.List;

import entity.User;

public interface UserDao {
	
   public List<User> findUserAll();
   
   public List<User> findUserByAccountAndPwd(String account,String pwd);
   
   //根据用户id删除该用户所有拥有的权限 
   public void deleteUserAuthByUserId(Integer user_id);
   //根据用户id和权限id绑定用户的权限格式为(user_id,auth_id)注意顺序
   public void addUserAuthByUserId(String auth_ids);

   public Integer delete(Integer user_id);
   
   public Integer addUser(User user);
   
   public Integer updateUser(User user);
}
