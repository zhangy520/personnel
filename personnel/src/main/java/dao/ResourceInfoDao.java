package dao;

import entity.ResourceInfo;


public interface ResourceInfoDao {
   public ResourceInfo findResourceById(Integer resource_id);
   
   public Integer save(ResourceInfo resourceInfo);
   
   
}
