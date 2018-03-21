<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<HEAD>
<TITLE>用户列表</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<script src="../js/jquery-3.0.0.js"></script>

<!--<link rel="stylesheet" href="css/init.css" />-->
<link rel="stylesheet" href="../css/hearder.css" />
<link rel="stylesheet" href="../css/navigation.css" />


<style type="text/css">
div{
   padding:0px;
   margin:0px;
}
table.gridtable {
	font-family: verdana,arial,sans-serif;
	font-size:11px;
	color:#333333;
	border-width: 1px;
	border-color: #666666;
	border-collapse: collapse;
	width: 100%;
}
table.gridtable th {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #666666;
	background-color: #dedede;
}
table.gridtable td {
	border-width: 1px;
	padding: 4px;
	border-style: solid;
	border-color: #666666;
	background-color: #ffffff;
}
.main{
    width:1300px;
    margin:10px auto;
}
.action input{
    display:inline-block;
}
/*灰色遮罩层*/
.fade{
    width:100%;
    height:100%;
    background:rgba(0, 0, 0, 0.5);
    position: fixed;
    left: 0;
    top: 0;
    z-index: 99;
    display:none;
}
/*弹出层*/ 
.succ-pop{
    width: 400px;
    height: 250px;
    background: #fff;
    position: fixed;
    left: 50%;
    top: 50%;
    margin-left: -200px;
    margin-top: -150px;
    z-index: 999;
    border-radius: 5px;
    display:none;
}   
.succ-pop span.title{
    text-align: center;
    font-size: 22px;
    color: #ce002c;
}

</style>
</HEAD>
<body>
    <jsp:include page="../personnel/hearder.jsp" flush="true"/><!--动态包含-->  
    <div style="position: absolute;top: 70px;left: 1250;">
        <input type="button" value="新建用户" style="width:80px;height:30px;font-size:16px;"  onClick="updateUser(0)"/>
    </div>
  <form id="personnel_list" action="./personnel_list" >
    <input type="hidden" value="${page_current}" id="current_page" name="page_current"/>
    <input type="hidden" value="${page_count}" id="count_page"/>
    <div class="main">
        <table  class="gridtable">
            <tr>
                <th>Account</th>
                <th>Auth</th>
                <th>Action</th>
            </tr>
            <c:forEach var="user" items="${user_list }">
            
            <tr id="${user.user_id}" >
               
               <td width="20%" >${user.user_account}</td>
               <td width="40%">
                  <c:forEach var="auth_user_one" items="${user.auth_list }">
                       <label>${auth_user_one.auth_name }</label>
                  </c:forEach>
               </td>
              
               <td class="action" width="40%">
                   <input type="button" value="删除" onClick="deleteUser(${user.user_id})"/>
                   <input type="button" value="更新" onClick="updateUser(this)" id="${user.user_id}" pwd="${user.pwd}" user_account="${user.user_account}" user_name="${user.user_name}"/>
                   <input type="button" value="分配权限" onClick="updateAuth(this)" id="${user.user_id}"/>
                   <div class="auth_user" style="display:inline;border:1px solid red;display:none" >
                     <c:forEach var="auth_user_one" items="${user.auth_list }">
                       <label>${auth_user_one.auth_id }</label>
                     </c:forEach>
                   </div>
               </td>
            </tr>
            </c:forEach>
        </table>
        <!--  <div style="margin:10px auto;width:500px;">
            <input type="button" value="首页" onClick="gopage('start_page')"/>
            <input type="button" value="上一页" onClick="gopage('up_page')"/>
            <input type="button" value="下一页" onClick="gopage('down_page')"/>
            <input type="button" value="末页" onClick="gopage('end_page')"/>
            <input type="text" id="gotoPage"/>
            <input type="button" value="go" onClick="gopage('current_page')"/>
            <label>共${page_count}页</label>
        </div> -->
       
        
    </div>
  </form>
<div class="fade"></div>
<div class="succ-pop" id="auth_check">
  
    <div style="width:100%;height:40px;padding-top: 5px;padding-left: 34px;width: 365px;border-bottom: 2px solid;">
       <span class="title">请选择权限</span>
    </div>
    <form action="./saveUserAuth" id="savaUserAuth">
    <div>
      
       <input type="hidden" id="auth_user_id" name="auth_user_id">
       <ul class="auth">
          
          <li style="list-style-type:none;font-size:20px"><input type="checkbox"  name="auth_id" value="1" style="width:18px;height:18px;margin-right: 10px;"/>全部简历</li>
          <li style="list-style-type:none;font-size:20px"><input type="checkbox"  name="auth_id" value="2" style="width:18px;height:18px;margin-right: 10px;"/>搜索简历</li>
          <li style="list-style-type:none;font-size:20px"><input type="checkbox" name="auth_id" value="3" style="width:18px;height:18px;margin-right: 10px;"/>录入简历</li>
          <li style="list-style-type:none;font-size:20px"><input type="checkbox"  name="auth_id" value="4" style="width:18px;height:18px;margin-right: 10px;"/>用户管理</li>
          <li style="list-style-type:none;font-size:20px"><input type="checkbox"  name="auth_id" value="5" style="width:18px;height:18px;margin-right: 10px;"/>删除简历</li>
       </ul>
       
    </div>
    </form>
    <div style="padding-left: 198px;">
       <input type="button" style="width: 80px;height: 30px;" value="确认" onClick="saveUserAuth()"/>
       <input type="button" style="width: 80px;height: 30px;" value="取消" onClick="cancel()"/>
    </div>
</div>

<!-- 新建更新用户 -->
<div class="succ-pop" id="updateUser">
  
    <div style="width:100%;height:40px;padding-top: 5px;padding-left: 34px;width: 365px;border-bottom: 2px solid;">
       <span class="title">管理用户</span>
    </div>
    
    <div>
       <input type="hidden" id="user_id_add"/>
       <ul class="addUser">
          
          <li style="list-style-type:none;font-size:20px;margin-bottom: 10px;">账号：<input type="text" id="user_account_add" style="width: 250px;height: 30px;border: 1px solid black;"/></li>
          <li style="list-style-type:none;font-size:20px;margin-bottom: 10px;">密码：<input type="password" id="pwd_add" style="width: 250px;height: 30px;border: 1px solid black;"/></li>
          <!--<li style="list-style-type:none;font-size:20px">用户名：<input type="text" id="user_name_add" style="width: 250px;height: 30px;border: 1px solid black;"/></li>  -->
         
       </ul>
       
    </div>
   
    <div style="padding-left: 198px;">
       <input type="button" value="确认" style="width: 80px;height: 30px;" onClick="updateUserSubmit()"/>
       <input type="button" value="取消" style="width: 80px;height: 30px;" onClick="cancelUser()"/>
    </div>
</div>


</body>
<script>
//---新增，更新用户---
function updateUser(obj_update){
	
	 $(".fade").css("display","block");
	 $(".succ-pop#updateUser").css("display","block");
	 $("#user_id_add").val(obj_update);
	 if (obj_update!=0){
		 $("#user_account_add").val($(obj_update).attr("user_account"));
		 $("#pwd_add").val($(obj_update).attr("pwd"));
		 $("#user_name_add").val($(obj_update).attr("user_name"));
		 $("#user_id_add").val($(obj_update).attr("id"));
	 }
}
//确认更新或新增
function updateUserSubmit(){
	
    if (!/^(\d|[a-zA-Z])+$/.test($("#user_account_add").val())){
    	alert("账号只能是数组和字母的组合！")
    	return true;
    }
       
	 user_id_add = $("#user_id_add").val();
	 user_account_add = $("#user_account_add").val();
	 pwd_add = $("#pwd_add").val();
	 user_name_add = $("#user_name_add").val();
	 $.ajax({
		  url:'./user_add',
		  type: 'GET',  
		  data: {"user_id":user_id_add,"user_account":user_account_add,"pwd":pwd_add,"user_name":user_name_add},
		  dataType:'text',
        success: function (returndata) {  
          alert(returndata); 
          location.reload();  
         },  
         error: function (returndata) {  
          alert(returndata);  
         }  
 });
}



//---删除用户---
function deleteUser(user_id){
	
	$.ajax({
		  url:'./user_delete',
		  type: 'GET',  
		  data: {"user_id":user_id},
		  dataType:'text',
          success: function (returndata) {  
            alert(returndata); 
            location.reload();  
           },  
           error: function (returndata) {  
            alert(returndata);  
           }  
   });
}
//---分配权限---
function updateAuth(obj){
    $(".fade").css("display","block");
    $(".succ-pop#auth_check").css("display","block");
    auth_user = []
    $(obj).next("div").children("label").each(function(){
        auth_user.push($(this).text())
        
    });
    $(".auth").parent().children("input").val($(obj).attr("id"))
    for (i=0;i<auth_user.length;i++){
    	$(".auth li").each(function(){
        	if (auth_user[i] == $(this).children("input").val()){
        		
        		$(this).children("input").attr("checked","checked")
        	}
        });
        
    }
    
}
//---取消---
function cancel(){
	$(".fade").css("display","none");
    $(".succ-pop#auth_check").css("display","none");
    $(".auth").children("li").children("input").removeAttr("checked");
}
//---取消新建或更新用户---
function cancelUser(){
	$(".fade").css("display","none");
    $(".succ-pop#updateUser").css("display","none");
    $(".addUser").children("li").children("input").val("");
}
//---确认分配权限---
function saveUserAuth(){
	//提交表单
	$("#savaUserAuth").submit();
}

//---分页---
function gopage(type){
	current_page = 1;
	
	if (type=='start_page'){
		current_page = 1;
	}else if (type=='up_page'){
		if ($("#current_page").val() == 1){
			alert("已经是第一页了！");
			return ;
		}
		current_page =parseInt($("#current_page").val())-1;
	}else if (type=='down_page'){
		if ($("#current_page").val() == $("#count_page").val()){
			alert("已经是最后一页了！");
			return ;
		}
		current_page = parseInt($("#current_page").val())+1;
	}else if (type=='end_page'){
		current_page = $("#count_page").val();
	}else if (type=='current_page'){
		if (0 <$("#gotoPage").val() && $("#gotoPage").val()<= $("#count_page").val()){
			current_page = $("#gotoPage").val();
		}else{
			alert("没有该页！");
			return ;
		}
		
	}
	alert(current_page);
	$("#current_page").val(current_page);
	$("#personnel_list").submit();
}


</script>
</html>
