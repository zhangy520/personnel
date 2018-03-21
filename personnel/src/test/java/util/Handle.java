package util;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import dao.PersonnelDao;
import entity.Personnel;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring-servlet.xml","classpath:spring-mybatis.xml"})
public class Handle {
	@Autowired
	public PersonnelDao personnelDao;	
	@Test
	public void testaaa(){
		String aa = HandleProperties.getValueByKey("111");
		System.out.println(aa);
	}
	
	@Test
	public void insertpersonnel(){
		Personnel personnel = new Personnel();
		for(int i=0;i<100;i++){
			personnel.setFirst_name("name"+i);
			//personnel.setNick_name("name"+i);
			personnelDao.save(personnel);
		}
		System.out.println("结束保存");
		
	}
}
