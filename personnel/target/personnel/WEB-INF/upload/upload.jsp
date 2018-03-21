<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<HEAD>
<TITLE>上传文件</TITLE>
<script src="./js/jquery-3.0.0.js"></script>
<style type="text/css">
/*a  upload */
.a-upload {
    padding: 4px 10px;
    height: 20px;
    line-height: 20px;
    position: relative;
    cursor: pointer;
    color: #888;
    background: #fafafa;
    border: 1px solid #ddd;
    border-radius: 4px;
    overflow: hidden;
    display: inline-block;
    *display: inline;
    *zoom: 1;
    text-decoration: none;
}

.a-upload  input {
    position: absolute;
    font-size: 100px;
    right: 0;
    top: 0;
    opacity: 0;
    filter: alpha(opacity=0);
    cursor: pointer
}

.a-upload:hover {
    color: #444;
    background: #eee;
    border-color: #ccc;
    text-decoration: none
}
.progress{
  position:relative;
  width:90%;
  height:22px;
  margin-left: 4.88888%;
  text-align: center;
  line-height: 22px;
  /*background-color: blue;*/
  border:1px solid #ccc;
}
.upload-text{
  position:absolute;
  z-index: 99999;
  color:red;
}
.uploaded{
  position:absolute;
  left:0;
  z-index: 9999;
  width:0%;
  height:100%;
  background-color: blue;
  color:#FFFFFF;
}
</style>
</HEAD>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<body>
<h1>上传文件</h1>
<form action="./uploads" enctype="multipart/form-data" method="post">
    <input type="file" name="uploadfile" multiple="multiple"/>
    <input type="submit" value="提交"/>
    <div style="width:400px;height:300px;border:1px solid red">
      <h2>文件上传</h2>
      <input type="text"/>
      <label for="testqqq" >
          <input type="button" value="选择文件">
          
      </label>
      <input id="testqqq" type="file" style="position: absolute;font-size: 100px;right: 0;top: 0;opacity: 0;filter: alpha(opacity=0);cursor: pointer" name="uploadfile" multiple="multiple"/>
   
      <a href="javascript:;" class="a-upload">
         <input type="file" name="" id="hahahh">点击这里上传文件
      </a>
      
     
     <div class="progress">
       <span class="upload-text"></span>
       <span class="uploaded"></span>
     </div>
      
    </div>
</form>
</body>
<script>
 $("#hahahh").on("change",function(){
	 alert("11111");
	 alert($("#hahahh")[0].files[0]["name"])
 })
 
 // 模拟进度
function progressBar() {
  var max = 100;
  var init = 0;
  var uploaded;
  var test = setInterval(function() {
    init += 10;
    uploaded = parseInt((init / max * 100)) + '%';
    $uploadTextSpan.text(uploaded).next().css({
width:uploaded
});
if (init === 100) {
clearInterval(test);
$uploadTextSpan.text('上传完成');
$('.confirm-cancel span').css({
 cursor:'pointer'
});
$('.confirm').css({
 backgroundColor:'rgb(111,197,293)'
});
$('.cancel').css({
 backgroundColor:'rgb(175,194,211)'
})
$closeConfirmCancel.on('click',closeConfirmCancel);
} 
else { 
$closeConfirmCancel.off('click',closeConfirmCancel);
$('.upload-close-span').on('click',function(){
 clearInterval(test);
 closeConfirmCancel();
});
$uploadMask.on('click',function() {
        clearInterval(test);
        closeConfirmCancel();
      })
    }
  },1000);
}
</script>
</html>
