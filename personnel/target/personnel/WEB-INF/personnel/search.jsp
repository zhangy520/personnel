<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<HEAD>
<TITLE>搜索简历</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<script src="../js/jquery-3.0.0.js"></script>

<!--<link rel="stylesheet" href="css/init.css" />-->
<link rel="stylesheet" href="../css/hearder.css" />
<link rel="stylesheet" href="../css/navigation.css" />
<script src="../js/city/kuCity.js"></script>
<link rel="stylesheet" href="../js/city/kuCity.css">


<style type="text/css">
*{
   padding:0px;
   margin:0px;
}
.main{
   margin-top:10px;
}
.search label{
    font-size: 26px;
    font-family: 宋体;
    width: 126px;
    display: inline-block;
    font-weight: 500;
}
.search div{
    margin-top:6px;
}
.search input[type='text']{
    font-size: 20px;
    font-family: 宋体;
    font-weight: 500;
    width:800px;
    height:40px;border: 2px solid black;
}
#box {  
           position: relative;  
           display: inline-block;
           margin-top: 0px;
}  
  
#selectBox {  
      display:none;
      width:800px;
      position: absolute;  
      background-color: #f1f1f3;
      top: 36px;  
       }  
  
       ul {  
           list-style: none;  
       }  

</style>
</HEAD>
<body>
    <jsp:include page="hearder.jsp" flush="true"/><!--动态包含-->
    
    <div style="position: absolute;top: 70px;left: 1240;">
        <input type="button" value="搜索" style="width:80px;height:30px;font-size:16px;" id="search"/>
    </div>
  <form id="search_form" action="./personnel_list">  
    <input type="hidden" name="page_current" value="1">
    <div class="main search">
       <div>
           <label>关键字</label>
           <input type="hidden" name="search_data[0].value_name" value="all_filed"/>
           <input id="all_filed_like" type="hidden" name="search_data[0].value_value"/>
           <input id="all_filed" type="text" />
       </div>
       <div>
           <label>职位名称</label>
           <input type="hidden" name="search_data[1].value_name" value="position"/>
           <input id="position_like" type="hidden" name="search_data[1].value_value"/>
           <input id="position" type="text"/>
       </div>
       <div>
           <label>公司名称</label>
           <input type="hidden" name="search_data[2].value_name" value="company"/>
           <input id="company_like" type="hidden" name="search_data[2].value_value"/>
           <input id="company" type="text"/>
       </div>
       <div >
          
           <label>所在行业</label>
           <div id="box" >
           <select id="select_industry" style="width: 800px;height: 40px;border: 2px solid black;">111111</select>  
           <div id="selectBox">  
               <ul>  
                   <li><input type="checkbox" value="%TELECOM%">TELECOM</li>  
                   <li><input type="checkbox" value="%MDI%">MDI</li>  
                   <li><input type="checkbox" value="%CONSUMER%">CONSUMER</li>  
                   <li><input type="checkbox" value="%FSI%">FSI</li>  
                   
                   <li><input type="checkbox" value="%RETAIL%">RETAIL</li>  
                   <li><input type="checkbox" value="%E&U%">E&U</li>  
                   <li><input type="checkbox" value="%T&T%">T&T</li>  
                   <li><input type="checkbox" value="%INTERENT%">INTERENT</li>  
                   
                   <li><input type="checkbox" value="%PUBLIC%">PUBLIC</li>  
                   <li><input type="checkbox" value="%COMMERCIAL%">COMMERCIAL</li>  
                   <li><input type="checkbox" value="%ECOMMERCE%">ECOMMERCE</li>  
                   
               </ul>  
               <input type="button" value="确定" id="submit_industry" />
           </div> 
           </div>
           <input type="hidden" name="search_data[3].value_name" value="industry"/>
           <input type="hidden" name="search_data[3].value_value" id="industry_value"/>
          
          
       </div>
       <div>
           <label>期望城市</label>
           <input type="hidden" name="search_data[4].value_name" value="expected_city"/>
           <input type="text" name="search_data[4].value_value" class="search3"/>
          
       </div>
       <div>
           <label>现在城市</label>
           <input type="hidden" name="search_data[5].value_name" value="persent_city"/>
           <input type="text" name="search_data[5].value_value" class="search3"/>
       </div>
       
    </div>  
  </form>
  
</body>
<script>

var arr = [];//定义一个数组用来接收多选框的值  
var arr_text = [];//定义一个数组用来接收多选框的值  
//初始化让下拉列表不显示  
$(function () {  
   // $('#selectBox').hide();  
})  
//单击下拉列表时显示/隐藏下拉列表  
$('#select_industry').click(function () {  
    $('#selectBox').toggle();  
})  
//监听checkbox的value值 改变则执行下列操作  
$("input").change(function () {  
    if ($(this).prop("checked")) {  
        arr.push($(this).val());//将选中的选项添加到数组中  
        arr_text.push($(this).parent().text())
    } else {  
        var index = getIndex(arr, $(this).val())//找到没有选中的选项在数组中的索引  
        var index_text = getIndex(arr_text, $(this).text())//找到没有选中的选项在数组中的索引
        arr.splice(index, 1);//在数组中删除该选项  
        arr_text.splice(index, 1);//在数组中删除该选项  
    }  
})  
//这个函数用于获取指定值在数组中的索引  
function getIndex(arr, value) {  
    for (var i = 0; i < arr.length; i++) {  
        if (arr[i] == value) {  
            return i  
        }  
    }  
}  
//点击按钮是弹出数组  
$('#submit_industry').click(function () {  
    //alert(arr);
    $("#industry_value").val(arr)
    $("#select_industry").html('<option style="display:none" value="'+arr+'">'+arr_text+'</option>')
    $('#selectBox').hide();
})  

$("#search").on('click',function(){
	  if ($("#all_filed").val() != ''){
		  $("#all_filed_like").val('%'+$("#all_filed").val()+'%')
	  }
	  if ($("#position").val() != ''){
		  $("#position_like").val('%'+$("#position").val()+'%')
	  }
	  if ($("#company").val() != ''){
		  $("#company_like").val('%'+$("#company").val()+'%')
	  }
	  $("#search_form").submit();
	  
})
$('.search3').kuCity();
</script>
</html>
