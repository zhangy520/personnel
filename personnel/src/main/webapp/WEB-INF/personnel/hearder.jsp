<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="hearder">
    <span class="title">简历管理系统</span>
    <div style="float: right;margin-left: 10px;margin-top: 7px;margin-right: 17px;">
    <input type="button" value="退出" style="width: 60px;height: 30px;" onClick="window.location.href='../login/login_out'"/>
    </div>
	<div class="user">
	   <span class="user_key">用户：</span>
	   <div class="name">${user.user_account}</div>
	</div>
	
</div>
<div class="nav" style="position: relative;">
<c:forEach var="user_auth_one" items="${user_auth }">
    <c:if test="${ user_auth_one.auth_http_path != null}">
    <div class="nav_one"><a href="${ user_auth_one.auth_http_path}">${ user_auth_one.auth_name}</a></div>
    </c:if>
</c:forEach>
    
</div>