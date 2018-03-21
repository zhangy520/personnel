<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<HEAD>
<TITLE>信息录入</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<script src="../js/jquery-3.0.0.js"></script>

<!--<link rel="stylesheet" href="css/init.css" />-->



<style type="text/css">
div{
   padding:0px;
   margin:0px;
}
.main{
   width:475px;
   height:300px;
   margin:180px auto 0;
   
}

.title{
   width:100%;
   text-align: center;
   font-family: 宋体;
   font-weight: 600;
   
}
.content{
   margin-top:20px;
}
.content input{
   width:300px;
   height: 38px;
   background-color: black;
   border:none;
   outline:none;
   color:#fbfbfb;
   font-size:20px;
   padding:8px;
   
}
.content label{
   font-size:34px;top: 7px;position: relative;font-family: 宋体;font-weight: 600;
}
.content div{
   margin-bottom:10px;
}



</style>
</HEAD>
<body style="background:url(../css/login.jpg)  no-repeat fixed ;background-size:100% 100%;">
    
  <form id="login_form" action="./login_aciton" method="post">
 
    <div class="main">
       <input type="hidden" value="${mesg}" id="mesg">
       <div class="title">
           <span style="font-size:40px;letter-spacing:4px" id="title">简历管理系统</span>
       </div>
       <div class="content">
      
           <div>
               <label >账号：</label>
               <input type="text" name="account"/>
           </div>
           <div>
               <label>密码：</label>
               <input id="password" type="password" name="pwd"/>
           </div>
       
       </div>
       <input type="hidden" id="login"/>
       
    </div>
  </form>
</body>
<script>
$(function(){
	$.getJSON('../js/config_login.json', function(data){  
		$("#title").text(data.login_title);
    });  
	
	mesg = $("#mesg").val();
	if (mesg != ''){
		alert(mesg)
	}
})
$("#login").on("click",function(){
	$("#login_form").submit();
})
$('#password').bind('keypress', function (event) { 
   if (event.keyCode == "13") { 
    $("#login").click();
   }
  })


</script>
</html>
