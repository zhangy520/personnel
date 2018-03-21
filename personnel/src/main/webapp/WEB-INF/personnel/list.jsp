<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<HEAD>
<TITLE>简历列表</TITLE>
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

</style>
</HEAD>
<body>
    <jsp:include page="hearder.jsp" flush="true"/><!--动态包含-->  
  <form id="personnel_list" action="./personnel_list" >
    <input type="hidden" value="false" name="is_all"/>
    <input type="hidden" value="${page_current}" id="current_page" name="page_current"/>
    <input type="hidden" value="${page_count}" id="count_page"/>
    <div class="main">
        <table  class="gridtable">
            <tr>
                <th width="2%">NU</th>  
                <th width="6%">First Name</th>
                <th width="5%">Present City</th>
                <th width="5%">Expected City</th>
                
                <th width="8%">E-mail</th>
                <th width="8%">Mobile</th>
                <th width="8%">Position</th>
                <th width="8%">Current Salary</th>
                <th width="8%">Expected Salary</th>          
                <th width="8%">Company</th>   
                <th width="16%">Eduction</th>       
                <th width="18%">Action</th>
            </tr>
            <c:forEach var="personnel" items="${personnel_list }" varStatus="status">
            <tr id="${personnel.personnel_id}" >
               <td>${ status.index + 1}</td>  
               <td>${personnel.first_name}</td>
               <td>${personnel.persent_city}</td>
               <td>${personnel.expected_city}</td>
               <td>${personnel.email}</td>
               <td>${personnel.mobile}</td>
               <td>${personnel.position}</td>
               <td>${personnel.current_salary}</td>
               <td>${personnel.expected_salary}</td>
               <td>${personnel.company}</td>
               <td title=" ${personnel.education}">
                 <c:if test="${fn:length(personnel.education) > 10}">  
                        ${fn:substring(personnel.education, 0, 10)}...
                 </c:if>  
                 <c:if test="${fn:length(personnel.education) <= 10}">  
                         ${personnel.education}
                 </c:if>  
                 
               </td>
               
             
               
               <td class="action" >
                   <c:forEach var="user_auth_one" items="${user_auth }">
                        <c:if test="${ user_auth_one.auth_code == 'action_delete_personnel'}">
                              <input type="button" value="删除" onClick="deletePersonnel(${personnel.personnel_id})"/>
                        </c:if>
                   </c:forEach>
                   <input type="button" value="更新" onClick="updatePersonnel(${personnel.personnel_id})"/>
                   <input type="button" value="随访" onClick="accessPersonnel(${personnel.personnel_id})"/>
                   <input type="button" value="查看详情" onClick="seePersonnel(${personnel.personnel_id})"/>
               </td>
            </tr>
            </c:forEach>
        </table>
        <div style="margin:10px auto;width:660px;">
            <input type="button" value="首页" onClick="gopage('start_page')"/>
            <input type="button" value="上一页" onClick="gopage('up_page')"/>
            <input type="button" value="下一页" onClick="gopage('down_page')"/>
            <input type="button" value="末页" onClick="gopage('end_page')"/>
            <input type="text" id="gotoPage"/>
            <input type="button" value="go" onClick="gopage('current_page')"/>
            <label style="vertical-align:-6%;">共${page_count}页&nbsp;&nbsp;当前第${page_current}页</label>
        </div>
        
    </div>
  </form>
</body>
<script>
//---删除---
function deletePersonnel(personnel_id){
	
	$.ajax({
		  url:'./personnel_delete',
		  type: 'GET',  
		  data: {"personnel_id":personnel_id},
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
//---更新---
function updatePersonnel(personnel_id){

	window.location.href="./update_jsp?personnel_id="+personnel_id+'&action_type=update';
}
//---随访---
function accessPersonnel(personnel_id){
	
	window.location.href="./update_jsp?personnel_id="+personnel_id+'&action_type=access';
}
//---查看详情---
function seePersonnel(personnel_id){
	
	window.location.href="./update_jsp?personnel_id="+personnel_id+'&action_type=see';
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
	$("#current_page").val(current_page);
	$("#personnel_list").submit();
}


</script>
</html>
