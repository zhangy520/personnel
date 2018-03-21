package entity;

import java.util.List;
import java.util.Map;

public class SearchPage {
	
   public static  class SearchValue{
	   private String value_name;//查询字段名称
	   private String value_type; //搜索类型  精确查询  还是模糊查询
	   private String value_value; //查询内容
	   
	   public SearchValue(){
		   
	   }
	   
	   public SearchValue(String value_name,String value_type,String value_value){
		   this.value_name = value_name;
		   this.value_type = value_type;
		   this.value_value = value_value;
	   }
	   
	public String getValue_name() {
		return value_name;
	}
	public void setValue_name(String value_name) {
		this.value_name = value_name;
	}
	public String getValue_type() {
		return value_type;
	}
	public void setValue_type(String value_type) {
		this.value_type = value_type;
	}
	public String getValue_value() {
		return value_value;
	}
	public void setValue_value(String value_value) {
		this.value_value = value_value;
	}
	   
	   
   }
   private Integer page_size=14;//每页显示行数
   private Integer page_current;//显示第几页
   private Integer page_start;//从第几条开始
   private Integer page_end;//从第几条结束
   private List<SearchValue> search_data;//搜索条件 第一个参数字段名称  第二个字段一个getValue_name对象
   private Map<String,String> sort_data;//排序条件 第一个参数参数名称 ；第二个参数 升序或者降序
public Integer getPage_size() {
	return page_size;
}
public void setPage_size(Integer page_size) {
	this.page_size = page_size;
}
public Integer getPage_current() {
	return page_current;
}
public void setPage_current(Integer page_current) {
	this.page_current = page_current;
}

public Map<String, String> getSort_data() {
	return sort_data;
}
public void setSort_data(Map<String, String> sort_data) {
	this.sort_data = sort_data;
}


public Integer getPage_start() {
	page_start = (getPage_current()-1)*getPage_size();
	return page_start;
}

public Integer getPage_end() {
	page_end = getPage_current()*getPage_size();
	return page_end;
}
public List<SearchValue> getSearch_data() {
	return search_data;
}
public void setSearch_data(List<SearchValue> search_data) {
	this.search_data = search_data;
}

   
   
   
   
  
   
   
}
