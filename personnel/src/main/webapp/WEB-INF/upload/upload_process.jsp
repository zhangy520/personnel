<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="./js/jquery-3.0.0.js"></script>
<link rel="stylesheet" href="./css/upload.css" />
<script src="./js/upload.js"></script>
<head>
    <META http-equiv=Content-Type content="text/html; charset=utf-8">
    <title>上传文件带进度条</title>
</head>
<body>
  <form id="form1" enctype="multipart/form-data" method="post" action="./uploads">
    <div class="row">
      <label for="fileToUpload">上传文件</label><br /> 
      <input type="text" id="fileName" style="position: relative;top: -12px;height: 20px;border: 1px solid #ddd;"/>
      <a href="javascript:;" class="a-upload">
         <input type="file" name="fileToUpload" id="fileToUpload" onchange="fileSelected();"/>浏览...
      </a>
    </div>
    
    <span class="container" style="display:none;">
         <span id="progressBar" class="h-100P bar"></span><span id="mesg"></span>
    </span>
    
    <div id="fileSize" style="display:none;"></div>
    <div id="fileType" style="display:none;"></div> 
    <div class="row">
      <input type="button" onclick="uploadFile()" value="Upload"  ></div>
      <div id="progressNumber" style="display:none;"></div>
  </form>
</body>

</html>