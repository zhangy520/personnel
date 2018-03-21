<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<HTML>
<HEAD>
<TITLE>信息录入</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<script src="../js/jquery-3.0.0.js"></script>
<script type="text/javascript" src="../js/laydate/laydate.js"></script>
<script src="../js/city/kuCity.js"></script>
<link rel="stylesheet" href="../js/city/kuCity.css">
<!--<link rel="stylesheet" href="css/init.css" />-->
<link rel="stylesheet" href="../css/hearder.css" />
<link rel="stylesheet" href="../css/navigation.css" />
<link rel="stylesheet" href="../css/personnel_insert.css" />
<link rel="stylesheet" href="../css/upload.css" />
<script src="../js/upload.js"></script>

<style type="text/css">
div{
   padding:0px;
   margin:0px;
}
body{
	margin:0px;padding:0px;width:1366px;
	min-width: 1000px;
}
@media screen and (min-width:1440px){
   body{
   	margin:0px auto;padding:0px;width:1360px;
   	
   }
}
/*定义滚动条宽高及背景，宽高分别对应横竖滚动条的尺寸*/
.scrollbar::-webkit-scrollbar{
    width: 6px;
    height: 16px;
    background-color: #f5f5f5;
}
/*定义滚动条的轨道，内阴影及圆角*/
.scrollbar::-webkit-scrollbar-track{
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);
    border-radius: 10px;
    background-color: #f5f5f5;
}
/*定义滑块，内阴影及圆角*/
.scrollbar::-webkit-scrollbar-thumb{
    /*width: 10px;*/
    height: 20px;
    border-radius: 10px;
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);
    background-color: #8a8989;
}

</style>
<script>
   //页面加载时根据type不同显示不同页面元素
   $(function(){
	   action_type = $("#action_type").val()
	   if (action_type == 'update'){
		  // alert(action_type)
		   //更新简历时 右边只展示上传选项框
		   //step1:将上传选项框选择,调用上传选项卡的点击事件
		   $("#resume_tab").click()
	       
		   //step2:隐藏其他两个选项框
		   $("#history_tab").css('display','none')
		   $("#postion_tab").css('display','none')
	   }else if (action_type == 'access'){
	      //hr填写备注信息，左边信息全部不能修改
	      //设置左侧输入框及下来选项框和多选框都不能操作
	      $('.main_left input,.main_left textarea,select,test1').attr("disabled","disabled")
	      $(".laydate-icon").removeAttr("id");
	      //隐藏保存按钮
		  $("#saveall").css("display","none")
	   }else if (action_type == 'see'){
		  $(".main_right textarea").text("")
		  $(".main_right #history_button").css("display","none")
		  $('.main_left input,textarea,select,test1').attr("disabled","disabled") 
		  //隐藏保存按钮
		  $("#saveall").css("display","none")
		
	   }
	   
   })
</script>
</HEAD>
<BODY >

<jsp:include page="hearder.jsp" flush="true"/><!--动态包含-->  

<div style="position: absolute;top: 70px;left: 1176;width: 170px;">
<input type="button" value="返回" style="width:80px;height:30px;font-size:16px;float: right;margin-right: 5px;" id="goback" onClick="window.history.go(-1)"/>
<input type="button" value="保存" style="width:80px;height:30px;font-size:16px;float: right;margin-right: 5px;" id="saveall"/>
</div>
<div class="main" >
<div class="main_left" >
 <form action="./update_aciton" id="base_info">
    <input type="hidden" name="personnel_id" id="personnel_id" value="${personnel.personnel_id}" />
    <input type="hidden" name="resource_id" id="resource_id"  value="${personnel.resource_id}"/>
    <input type="hidden" id="action_type"  value="${action_type}" />
    <div class="first_line">
        <label>*First Name</label><input id="first_name" type="text" name="first_name" value="${personnel.first_name}"/>
	    <label>*Last Name</label><input id="last_name" type="text" name="last_name" value="${personnel.last_name}"/>
	    <label>*Nick Name</label><input id="nick_name" type="text" name="nick_name" value="${personnel.nick_name}"/>
	    <label>Sex</label><select name="sex">
	                          <option  value="0" <c:if test="${personnel.sex==0}">selected</c:if>>Male</option>
	                          <option  value="1" <c:if test="${personnel.sex==1}">selected</c:if>>Femal</option>
	                      </select>
	    <label>*DOB</label><input id="test1" class="inline laydate-icon dob_date" name="dob" value="<fmt:formatDate value="${personnel.dob}" pattern="yyyy年MM月dd日" />" />
	</div>
	<div class="second_line">
        <label>E-mail</label><input type="text" style="width:290px;" name="email" value="${personnel.email}"/>
	    <label>*Mobile</label><input id="mobile" type="text" style="width:110px;" name="mobile" value="${personnel.mobile}"/>
	    <label>Mobile2</label><input type="text" style="width:110px;" name="mobile2" value="${personnel.mobile2}"/>
	    <label>Home</label><input type="text" style="width:110px;" name="home" value="${personnel.home}"/>
	 
	</div>
	<div class="third_line">
        <label>Company</label><input type="text" style="width:290px;" name="company" value="${personnel.company}"/>
	    <label>Position</label><input type="text" style="width:110px;" name="position" value="${personnel.position}"/>
	    <label>Current Salary</label><input type="text" style="width:110px;" name="current_salary" value="${personnel.current_salary}"/>
	    <label>Expected Salary</label><input type="text" style="width:110px;" name="expected_salary" value="${personnel.expected_salary}"/>
	  
	</div>
	<div class="fourth_line">
        <label>Present City</label><input type="text" class="search3" style="width:290px;margin-right:5px;" name="persent_city" value="${personnel.persent_city}"/>
	    <label>Expected City</label><input type="text" class="search3" name="expected_city" value="${personnel.expected_city}"/>
	    <label>Expected Position</label><input type="text" name="expected_position" value="${personnel.expected_position}"/>
	    
	</div>
	<div class="fifth_line">
	    <div style="float:left">
	        <label style="position:relative;top:-146px">Eduction</label><textarea style="width:290px" name="education" >${personnel.education}</textarea >
		    <label style="position:relative;top:-137px">Working Experience</label><textarea style="width:280px;" name="working_experience">${personnel.working_experience}</textarea >
		</div>
		<div class="fifth_block" style="float:left">
			<div><label>Working YS</label><input type="text" style="width:138px" name="working_ys" value="${personnel.working_ys}"/></div>
			<div><label>English</label><input type="text" style="width:138px" name="english" value="${personnel.english}"/></div>
			<div><label>Japanese</label><input type="text" style="width:138px" name="japanese" value="${personnel.japanese}"/></div>
			<div><label>Korean</label><input type="text" style="width:138px" name="korean" value="${personnel.korean}"/></div>
			<div><label>Academic degree</label><input type="text" style="width:138px" name="academic" value="${personnel.academic}"/></div>
			<div><label>English level</label><input type="text" style="width:138px" name="english_level" value="${personnel.english_level}"/></div>
		</div> 
	</div>
	<div class="sixth_line">
        <div class="ninth_left">
		    <div class="ninth_one"><label>Reminder</label><textarea style="width:290px;" name="reminder">${personnel.reminder}</textarea ></div>
			<div class="ninth_one">
				<label>Skill set</label><div style="width:290px;height:86px;">
				    <div class="skill_set_div">
				        <input type="checkbox" value="SALES" name="skillset" <c:if test="${fn:contains(personnel.skillset,'SALES')}">checked="checked"</c:if>><span class="skill_set_span">SALES</span>
				    </div>
					<div class="skill_set_div">
					    <input type="checkbox" value="HR" name="skillset" <c:if test="${fn:contains(personnel.skillset,'HR')}">checked="checked"</c:if>><span class="skill_set_span">HR</span>
					</div>
					<div class="skill_set_div">
					    <input type="checkbox" value="MARKETING" name="skillset" <c:if test="${fn:contains(personnel.skillset,'MARKETING')}">checked="checked"</c:if>><span class="skill_set_span">MARKETING</span>
					</div>
					<div class="skill_set_div">
					    <input type="checkbox" value="OPERATION" name="skillset" <c:if test="${fn:contains(personnel.skillset,'OPERATION')}">checked="checked"</c:if>><span class="skill_set_span">OPERATION</span>
					</div>
					<div class="skill_set_div">
					    <input type="checkbox" value="IT TECHNICAL" name="skillset" <c:if test="${fn:contains(personnel.skillset,'IT TECHNICAL')}">checked="checked"</c:if>><span class="skill_set_span">IT TECHNICAL</span>
					</div>
					<div class="skill_set_div">
					    <input type="checkbox" value="CONSULTING" name="skillset" <c:if test="${fn:contains(personnel.skillset,'CONSULTING')}">checked="checked"</c:if>><span class="skill_set_span">CONSULTING</span>
					</div>
					<div class="skill_set_div">
					    <input type="checkbox" value="FINANCE" name="skillset" <c:if test="${fn:contains(personnel.skillset,'FINANCE')}">checked="checked"</c:if>><span class="skill_set_span">FINANCE</span>
					</div>
			    </div>
			</div>
			<div class="ninth_one">
			    <label>Industry</label><div style="width:290px;height:86px;">
				    <div class="industry_div">
				         <input type="checkbox" value="'TELECOM'" name="industry" <c:if test="${fn:contains(personnel.industry,'TELECOM')}">checked="checked"</c:if>><span class="industry_span">TELECOM</span>
				    </div>
					<div class="industry_div">
					     <input type="checkbox" value="'MDI'" name="industry" <c:if test="${fn:contains(personnel.industry,'MDI')}">checked="checked"</c:if>><span class="industry_span">MDI</span>
					</div>
					<div class="industry_div">
					     <input type="checkbox" value="'CONSUMER'" name="industry" <c:if test="${fn:contains(personnel.industry,'CONSUMER')}">checked="checked"</c:if>><span class="industry_span">CONSUMER</span>
					</div>
					<div class="industry_div">
					    <input type="checkbox" value="'FSI'" name="industry" <c:if test="${fn:contains(personnel.industry,'FSI')}">checked="checked"</c:if>><span class="industry_span">FSI</span>
					</div>
					<div class="industry_div">
					    <input type="checkbox" value="'RETAIL'" name="industry" <c:if test="${fn:contains(personnel.industry,'RETAIL')}">checked="checked"</c:if>><span class="industry_span">RETAIL</span>
					</div>
					<div class="industry_div">
					    <input type="checkbox" value="'E&U'" name="industry" <c:if test="${fn:contains(personnel.industry,'E&U')}">checked="checked"</c:if>><span class="industry_span">E&U</span>
					</div>
                    <div class="industry_div">
                        <input type="checkbox" value="'T&T'" name="industry" <c:if test="${fn:contains(personnel.industry,'T&T')}">checked="checked"</c:if>><span class="industry_span">T&T</span>
                    </div>
					<div class="industry_div">
					    <input type="checkbox" value="'INTERENT'" name="industry" <c:if test="${fn:contains(personnel.industry,'INTERENT')}">checked="checked"</c:if>><span class="industry_span">INTERENT</span>
					</div>
					<div class="industry_div">
					    <input type="checkbox" value="'PUBLIC'" name="industry" <c:if test="${fn:contains(personnel.industry,'PUBLIC')}">checked="checked"</c:if>><span class="industry_span">PUBLIC</span>
					</div>
					<div class="industry_div" style="width:110px;">
					    <input type="checkbox" value="'COMMERCIAL'" name="industry" <c:if test="${fn:contains(personnel.industry,'COMMERCIAL')}">checked="checked"</c:if>><span class="industry_span">COMMERCIAL</span>
					</div>	
                    <div class="industry_div" style="width:98px;">
                        <input type="checkbox" value="'ECOMMERCE'" name="industry" <c:if test="${fn:contains(personnel.industry,'ECOMMERCE')}">checked="checked"</c:if>><span class="industry_span">ECOMMERCE</span>
                    </div>					
				</div>
			</div>
			
			<div class="ninth_one">
			    <label>Oracle Skill</label><div style="width:290px;height:64px;">
				    <div style="width:100px;font-size:10px;">
				        <input type="checkbox" value="'财务系统'" name=oracle_skill <c:if test="${fn:contains(personnel.oracle_skill,'财务系统')}">checked="checked"</c:if>><span style="color:rgb(110,0,0)">财务系统</span>
				    </div>
					<div style="width:100px;font-size:10px;">
					    <input type="checkbox" value="'PEOPLESOFT'" name="oracle_skill" <c:if test="${fn:contains(personnel.oracle_skill,'PEOPLESOFT')}">checked="checked"</c:if>><span style="color:rgb(110,0,0)">PEOPLESOFT</span>
					</div>
					<div style="width:100px;font-size:10px;">
					    <input type="checkbox" value="'分销系统'" name="oracle_skill" <c:if test="${fn:contains(personnel.oracle_skill,'分销系统')}">checked="checked"</c:if>><span style="color:rgb(110,0,0)">分销系统</span>
					</div>
					<div style="width:100px;font-size:10px;">
					    <input type="checkbox" value="'JDA'" name="oracle_skill" <c:if test="${fn:contains(personnel.oracle_skill,'JDA')}">checked="checked"</c:if>><span style="color:rgb(110,0,0)">JDA</span>
					</div>
					<div style="width:100px;font-size:10px;">
					    <input type="checkbox" value="'制造系统'" name="oracle_skill" <c:if test="${fn:contains(personnel.oracle_skill,'制造系统')}">checked="checked"</c:if>><span style="color:rgb(110,0,0)">制造系统</span>
					</div>
					<div style="width:100px;font-size:10px;">
					    <input type="checkbox" value="'其他'" name="oracle_skill" <c:if test="${fn:contains(personnel.oracle_skill,'其他')}">checked="checked"</c:if>><span style="color:rgb(110,0,0)">其他</span>
					</div>

					
				</div>
			</div>
			
		</div>
		<div class="ninth_left" style=" margin-left: 5px;">
		    <div class="ninth_one_left">
			    <label>Develop</label><div style="width:280px;height:66px;background-color:rgb(208,204,199);">
				    <div style="width:90px;font-size:10px;">
				        <input type="checkbox" value="'JAVA/J2EE'" name="develop" <c:if test="${fn:contains(personnel.develop,'JAVA/J2EE')}">checked="checked"</c:if>><span style="color:rgb(133,0,0)">JAVA/J2EE</span>
				    </div>
					<div style="width:90px;font-size:10px;">
					    <input type="checkbox" value="'SIEBEL'" name="develop" <c:if test="${fn:contains(personnel.develop,'SIEBEL')}">checked="checked"</c:if>><span style="color:rgb(110,0,0)">SIEBEL</span>
					</div>
					<div style="width:90px;font-size:10px;">
					    <input type="checkbox" value="'.NET'" name="develop" <c:if test="${fn:contains(personnel.develop,'.NET')}">checked="checked"</c:if>><span style="color:rgb(110,0,0)">.NET</span>
					</div>
					<div style="width:90px;font-size:10px;">
					    <input type="checkbox" value="'QAD'" name="develop" <c:if test="${fn:contains(personnel.develop,'QAD')}">checked="checked"</c:if>><span style="color:rgb(110,0,0)">QAD</span>
					</div>
					<div style="width:90px;font-size:10px;">
					    <input type="checkbox" value="'C/C++'" name="develop" <c:if test="${fn:contains(personnel.develop,'C/C++')}">checked="checked"</c:if>><span style="color:rgb(110,0,0)">C/C++</span>
					</div>
					<div style="width:90px;font-size:10px;">
					    <input type="checkbox" value="'TESTING'" name="develop" <c:if test="${fn:contains(personnel.develop,'TESTING')}">checked="checked"</c:if>><span style="color:rgb(110,0,0)">TESTING</span>
					</div>
					<div style="width:90px;font-size:10px;">
					    <input type="checkbox" value="'PYTHON'" name="develop" <c:if test="${fn:contains(personnel.develop,'PYTHON')}">checked="checked"</c:if>><span style="color:rgb(110,0,0)">PYTHON</span>
					</div>
				</div>
			</div>
			<div class="ninth_one_left">
			    <label>SQL</label><div style="width:280px;height:30px;background-color:rgb(208,204,199);">
				    <div style="width:90px;font-size:10px;">
				        <input type="checkbox" value="'PL/SQL'" name="personnel_sql" <c:if test="${fn:contains(personnel.personnel_sql,'PL/SQL')}">checked="checked"</c:if>><span style="color:rgb(110,0,0)">PL/SQL</span>
				    </div>
					<div style="width:90px;font-size:10px;">
					    <input type="checkbox" value="'DBA'" name="personnel_sql" <c:if test="${fn:contains(personnel.personnel_sql,'DBA')}">checked="checked"</c:if>><span style="color:rgb(110,0,0)">DBA</span>
					</div>
					<div style="width:90px;font-size:10px;">
					    <input type="checkbox" value="'BIDW'" name="personnel_sql" <c:if test="${fn:contains(personnel.personnel_sql,'BIDW')}">checked="checked"</c:if>><span style="color:rgb(110,0,0)">BIDW</span>
					</div>
				</div>
			</div>
			
			
			<div class="ninth_one_left">
			    <label>IT Service</label><div style="width:280px;height:150px;background-color:rgb(208,204,199);">
				    <div class="it_service_div">
				        <input type="checkbox" value="'SYSTEM'"  name="it_service" <c:if test="${fn:indexOf(personnel.it_service,'SYSTEM')>0}">checked="checked"</c:if>><span class="it_service_span">SYSTEM</span>
				    </div>
					<div class="it_service_div">
					    <input type="checkbox" value="'CLOUD'" name="it_service" <c:if test="${fn:contains(personnel.it_service,'CLOUD')}">checked="checked"</c:if>><span class="it_service_span">CLOUD</span>
					</div>
					<div class="it_service_div">
					    <input type="checkbox" value="'SOA'" name="it_service" <c:if test="${fn:contains(personnel.it_service,'SOA')}">checked="checked"</c:if>><span class="it_service_span">SOA</span>
					</div>
					<div class="it_service_div">
					    <input type="checkbox" value="'BIDM'" name="it_service" <c:if test="${fn:contains(personnel.it_service,'BIDM')}">checked="checked"</c:if>><span class="it_service_span">BIDM</span>
				    </div>
					<div class="it_service_div">
					    <input type="checkbox" value="'ERP'" name="it_service" <c:if test="${fn:contains(personnel.it_service,'ERP')}">checked="checked"</c:if>><span class="it_service_span">ERP</span>
					</div>
					<div class="it_service_div">
					    <input type="checkbox" value="'CRM'" name="it_service" <c:if test="${fn:contains(personnel.it_service,'CRM')}">checked="checked"</c:if>><span class="it_service_span">CRM</span>
					</div>
                    <div class="it_service_div">
                        <input type="checkbox" value="'PORTAL'" name="it_service" <c:if test="${fn:contains(personnel.it_service,'PORTAL')}">checked="checked"</c:if>><span class="it_service_span">PORTAL</span>
                    </div>
					<div class="it_service_div" style="width:150px">
					    <input type="checkbox" value="'SOFTWARE SERVICES'" name="it_service" <c:if test="${fn:contains(personnel.it_service,'SOFTWARE SERVICES')}">checked="checked"</c:if>><span class="it_service_span">SOFTWARE SERVICES</span>
					</div>
					<div class="it_service_div" style="width:110PX">
					    <input type="checkbox" value="'DATACENTER'" name="it_service" <c:if test="${fn:contains(personnel.it_service,'DATACENTER')}">checked="checked"</c:if>><span class="it_service_span">DATACENTER</span>
					</div>
					<div class="it_service_div" style="width:150PX">
					    <input type="checkbox" value="'BIZ CONSULTING'" name="it_service" <c:if test="${fn:contains(personnel.it_service,'BIZ CONSULTING')}">checked="checked"</c:if>><span class="it_service_span">BIZ CONSULTING</span>
					</div>
					<div class="it_service_div" style="width:110px">
					    <input type="checkbox" value="'MAINFRAME'" name="it_service" <c:if test="${fn:contains(personnel.it_service,'MAINFRAME')}">checked="checked"</c:if>><span class="it_service_span">MAINFRAME</span>
                   </div>
					<div class="it_service_div" style="width:110px">
					    <input type="checkbox" value="COREBANKING" name="it_service" <c:if test="${fn:contains(personnel.it_service,'COREBANKING')}">checked="checked"</c:if>><span class="it_service_span">COREBANKING</span>
					</div>	
                    <div class="it_service_div" style="width:150px">
                        <input type="checkbox" value="SOFTWARE PACKAGE" name="it_service" <c:if test="${fn:contains(personnel.it_service,'SOFTWARE PACKAGE')}">checked="checked"</c:if>><span class="it_service_span">SOFTWARE PACKAGE</span>
                     </div>	
				</div>
			</div>
		</div>
	    
	</div>
	
	</form>
</div>


<div class="main_right" >
    <div>
      <div class="tab_button havied" bind="history" id="history_tab">History Remarks</div>
	  <div class="tab_button other" bind="postion" id="postion_tab">Position Applied</div>
	  <div class="tab_button other" bind="resume" id="resume_tab">Resume</div>
	</div>
    <div class="tab">
	   <div class="content">
	       <div class="is_hidden is_block" id="history">
	         <div style="height:420px;overflow-y: auto;word-break: break-all;" class="scrollbar">
	           <c:forEach var="chat" items="${chatList }">
	           <div style="font-size:10px;color:rgb(14, 16, 179);margin-bottom: 10px;">${chat.user.user_account}<fmt:formatDate value="${chat.create_time}" pattern="yyyy-MM-dd HH:mm:ss" />：${chat.content}</div>
	           </c:forEach>
	         </div> 
	         <form action="../personnelchat/save_chat">
	           <input type="hidden" value="${user.user_id}" id="user_id" name="user_id"/>
	           <textarea id="personnelchat_content" style="outline:none;border:1px solid rgb(225,223,218);background-color:rgb(225,223,218);width: 390px;height: 82px;" name="content" placeholder="请输入...."></textarea>
	           <input type="button" value="提交随访信息" id="history_button" />
	         </form>
	         
	       </div>
		   <div class="is_hidden " id="postion"></div>
		   <div class="is_hidden" id="resume">
		       
		       <form id="form1" enctype="multipart/form-data" method="post" action="./uploads">
                   <div class="row" style="margin-top:10px;margin-left:10px;">
                        <label for="fileToUpload" style="font-size: 16px;width: 100px;margin-bottom: 10px;">上传文件</label><br /> 
                        <input type="text" id="fileName" style="position: relative;top: -12px;height: 24px;border: 1px solid #ddd;width:300px;"/>
                        <a href="javascript:;" class="a-upload">
                            <input type="file" name="fileToUpload" id="fileToUpload" onchange="fileSelected();"/>浏览...
                        </a>
                        <!-- 文件详情 -->
                        <div>
                            <div id="self_uploadinfo" style="display:none">
                               <label id="filecontent" style="border-right:1px solid"></label>
                               <label id="fileNameInfo" style="width:280px;margin-bottom: 10px;"></label>
                               <label id="fileSize" style="width:280px;margin-left: 74px;margin-bottom: 10px;"></label>
                               <label id="fileType" style="width:280px;margin-left: 74px;margin-bottom: 10px;line-height:14px;"></label>
                            </div>
                        </div>
                       <!-- 从服务器获取的文件详情 -->
                       <div id="service_uploadinfo">
                       <c:if test="${resourceInfo!=null}">
                            
                               <label style="border-right:1px solid">文件详情</label>
                               <label style="width:248px;margin-bottom: 10px;">${resourceInfo.resource_name }</label>
                               <a style="font-size:10px" href="${resourceInfo.resource_http_path }" download="${resourceInfo.resource_name }">下载</a>
                            
                       </c:if>
                       </div>
                        
                   </div>
                   
                   <!-- 进度条  <span class="container" style="display:none;">
                        <span id="progressBar" class="h-100P bar"></span><span id="mesg"></span>
                   </span>-->
                   
    
                   <div id="fileSize" style="display:none;"></div>
                   <div id="fileType" style="display:none;"></div> 
                   
                  <div class="row">
                       <input type="button" onclick="uploadFile()" value="Upload"  style="display:none;"></div>
                       <div id="progressNumber" style="display:none;">
                  </div>
              </form>
		   </div>
	   </div>
    </div>
</div>
</div>



</BODY>
<script>
  $("#saveall").on('click',function(){
	  //step1:检查必填项有没有填写 前三个字段以及电话号码
	  if ($("#first_name").val() == ""){
		  alert("请填写First Name");
  		  return;
	  }
	  if ($("#last_name").val() == ""){
		  alert("请填写Last Name");
  		  return;
	  }
	  if ($("#nick_name").val() == ""){
		  alert("请填写Nick Name");
  		  return;
	  }
	  if ($("#mobile").val() == ""){
		  alert("请填写Mobile");
  		  return;
	  }
	  test1
	  if ($("#test1").val() == ""){
		  alert("请填写DOB");
  		  return;
	  }
	  
	  //检查是否有新的文件上传，如果有则进行文件上传
	  //判断是否有文件上传
      if (typeof(document.getElementById('fileToUpload').files[0]) != 'undefined'){
    	//step2:上传文件
    	rel = uploadFile();
    	
    	//step3:如果上传文件失败则直接return
    	if ($("#resource_id").val() == 0){
    		alert("文件上传失败，请重新上传");
    		return;
    	}
      }
	  
	  $("#base_info").submit();
	  //if (true){
	  //	 alert($("#resource_id").val());
	  //	 if ($("#resource_id").val()){
	//		 alert($("#resource_id").val());
	//		 $("#base_info").submit();
	//	 }
		 
	//  }
	  
  });
  
  $("#history_button").on('click',function(){
	  personnelchat_content = $("#personnelchat_content").val();
	  user_id = $("#user_id").val();
	  personnel_id = $("#personnel_id").val();
	  $.ajax({
		  url:'../personnelchat/save_chat',
		  type: 'GET',  
		  data: {"content":personnelchat_content,"user_id":user_id,"personnel_id":personnel_id},
		  dataType:'text',
          success: function (returndata) {  
            alert(returndata); 
            window.location.reload();
           },  
           error: function (returndata) {  
            alert(returndata);  
           }  
   });
  })

   
   $('.tab_button').on('click',function(){
       //alert("1111");
	   tab_name = $(this).attr('bind')
	   $(this).addClass('havied')
	   $(this).removeClass('other')
	   $(this).siblings().removeClass('havied');
	   $(this).siblings().addClass('other')
       //alert($(this).attr('bind'));
	   $('#'+tab_name).addClass('is_block');
	   $('#'+tab_name).siblings().removeClass('is_block');
	   
   });
   
   
   
 //自定义日期格式
   laydate({
       elem: '#test1',
       format: 'YYYY年MM月DD日',
       festival: true, //显示节日
       choose: function(datas){ //选择日期完毕的回调
           //alert('得到：'+datas);
       }
   });
  
  $('.search3').kuCity();
</script>


<script>


    $("#updatebutton").on('change',function(){
	    
		var formdata = new FormData();
		
		formdata.append('file',$("#updatebutton")[0].files[0]);
		formdata.append('custom_file_type','version');
		$.ajax({
		  url:'http://192.168.0.77:7000/upload',
		  type: 'POST',  
		  data: formdata,
		  // 告诉jQuery不要去处理发送的数据
          processData : false, 
          // 告诉jQuery不要去设置Content-Type请求头
          contentType : false,
		  dataType:'json',
          success: function (returndata) {  
              alert(returndata); 
			
              alert(returndata.upload_path)			  
			  var json = {"version_code":"版本名称",
			              "version_path":returndata.upload_path,
						  "version_type":"1",
						  "version_md5":returndata["md5"],
						  "version_size":returndata["size"] 
			          }
			  //$.ajax({
			  //  url:'http://192.168.0.77:7000/jescloud/manage_versionInfo',
			  //	type:'PUT',
			//	data: JSON.stringify(json),
			//	success:function(data_return){
			//	   alert(data_return)
			//	}
			//  })
			  
          },  
          error: function (returndata) {  
              alert(returndata);  
          }  
		});
	});
</script>
</HTML>            
