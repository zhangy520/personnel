package util;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class HandleProperties {
	
   //根据key获取配置文件中的值	
   
   public static String getValueByKey(String key){
	   Properties pro = new Properties();
	   InputStream in = null;
	   String value = "";
	   
	   try {
		   in = HandleProperties.class.getClassLoader().getResourceAsStream("/config.properties");
		   
		   //return HandleProperties.class.getClassLoader().getResource("").toString();
		   pro.load(in);
		   value = pro.getProperty(key);
		
	   } catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	   }finally{
		
		try {
			in.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	   
	   return value;
   }
   
   public static String hahah(){
       return "44444444444";
   }
}
