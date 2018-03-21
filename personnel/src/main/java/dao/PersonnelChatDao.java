package dao;

import java.util.List;

import entity.PersonnelChat;

public interface PersonnelChatDao {
	
   public List<PersonnelChat> findChatByPersionnelId(Integer personnel_id);
   public Integer save(PersonnelChat personnelChat);
   
}
