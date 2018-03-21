package dao;

import java.util.List;

import entity.Personnel;
import entity.SearchPage;

public interface PersonnelDao {
   public List<Personnel> findPersonneAll(SearchPage searchPage);
	
   public Personnel findPersonnelById(Integer personnel_id);
   
   public Integer save(Personnel personnel);
   
   public Integer update(Personnel personnel);
   
   public Integer getPersonnelPageCount(SearchPage searchPage);//获取总页数
   
   public Integer delete(Integer personnel_id);
}
