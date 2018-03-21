package controle;


import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import dao.ResourceInfoDao;
import dao.UserDao;
import entity.ResourceInfo;
import util.HandleProperties;

/**
 * 
 * 文件上传处理类
 *
 */
@Controller
public class FileController {
	@Resource
	private ResourceInfoDao resourceInfoDao;
	
   
    //多文件上传
    @RequestMapping(value = "/uploads", method = RequestMethod.POST)
    @ResponseBody()
    public String queryFileDatas(
            @RequestParam("uploadfile") MultipartFile[] files,
            HttpServletRequest request) {
    	Integer resource_id = 0;
        if (files != null) {
            for (int i = 0; i < files.length; i++) {
                String type = files[i].getOriginalFilename().substring(
                        files[i].getOriginalFilename().indexOf("."));// 取文件格式后缀名
                String filename = System.currentTimeMillis() + type;// 取当前时间戳作为文件名
//                String path = request.getSession().getServletContext()
//                        .getRealPath("/upload_resource/" + filename);// 存放位置
                String path = HandleProperties.getValueByKey("upload.diskpath")+ filename;
                
                try {
                	 InputStream in =files[i].getInputStream();
                	 //创建一个缓冲区
                     byte buffer[] = new byte[1024];
                     int len = 0;
                     FileOutputStream out = new FileOutputStream(path);
                	 while((len=in.read(buffer))>0){
                         //使用FileOutputStream输出流将缓冲区的数据写入到指定的目录(savePath + "\\" + filename)当中
                         out.write(buffer, 0, len);
                     }
                	//关闭输入流
                     in.close();
                     //关闭输出流
                     out.close();
                     
                } catch (IOException e) {
                    e.printStackTrace();
                }
                
              //写入数据库信息
              String file_name =files[i].getOriginalFilename();
              ResourceInfo resourceInfo = new ResourceInfo();
              resourceInfo.setResource_name(file_name);
              resourceInfo.setResource_disk_path(path);
              String http_path = HandleProperties.getValueByKey("upload.httppath")+ filename;
              resourceInfo.setResource_http_path(http_path);
              resource_id=resourceInfoDao.save(resourceInfo);
              resource_id=resourceInfo.getResource_id();
              
            }
            
            
        } 
        return resource_id.toString();
    }
    
    
  //多文件上传
    @RequestMapping(value = "/files")
    public String getFile() {
        return "/WEB-INF/upload/upload_process.jsp";

    }

}