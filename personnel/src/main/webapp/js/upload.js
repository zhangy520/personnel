
	var xhr;
    function fileSelected() {
      var file = document.getElementById('fileToUpload').files[0];
      if (file) {
        var fileSize = 0;
        if (file.size > 1024 * 1024)
          fileSize = (Math.round(file.size * 100 / (1024 * 1024)) / 100).toString() + 'MB';
        else
          fileSize = (Math.round(file.size * 100 / 1024) / 100).toString() + 'KB';
        
        document.getElementById('service_uploadinfo').style.display="none";
        document.getElementById('self_uploadinfo').style.display="block";
        document.getElementById('filecontent').innerHTML = '文件详情: ';
        document.getElementById('fileNameInfo').innerHTML = 'Name: ' + file.name;
        document.getElementById('fileName').value = 'Name: ' + file.name;
        document.getElementById('fileSize').innerText = 'Size: ' + fileSize;
        document.getElementById('fileType').innerText = 'Type: ' + file.type;
      }
    }

    function uploadFile() {
      //判断是否有文件上传
      if (typeof(document.getElementById('fileToUpload').files[0]) == 'undefined'){
    	  //alert("请选择文件！")
    	  return false;
    	  
      }
      
    	
      var fd = new FormData();
      fd.append("uploadfile", document.getElementById('fileToUpload').files[0]);
      xhr = new XMLHttpRequest();
    
      xhr.upload.addEventListener("progress", uploadProgress, false);
      xhr.addEventListener("load", uploadComplete, false);
      xhr.addEventListener("error", uploadFailed, false);
      xhr.addEventListener("abort", uploadCanceled, false);
    //2.设置回调函数      
      xhr.onreadystatechange = zswFun;  
         
      xhr.open("POST", "../uploads",false);
      xhr.send(fd);
      
      return true;
    }
    
    //回调函数      
    function zswFun(){      
        if(xhr.readyState == 4 && xhr.status == 200){      
            var b = xhr.responseText;  
            //将得到的resource_id缓存至页面
            //alert("33333333333333333"+b)
            //alert(xhr.responseText)
            $("#resource_id").val(xhr.responseText);
            //alert($("#resource_id").val())
            //alert("end")
                       
        }      
    }    

    function uploadProgress(evt) {
      if (evt.lengthComputable) {
        var percentComplete = Math.round(evt.loaded * 100 / evt.total);
        document.getElementById('progressNumber').innerHTML = percentComplete.toString() + '%';
        //aciton_process(percentComplete.toString() + '%');
      }
      else {
        document.getElementById('progressNumber').innerHTML = '无法计算';
      }
    }

    function uploadComplete(evt) {
      /* 当服务器响应后，这个事件就会被触发 */
      //alert(evt.target.responseText);
      //alert("上传成功");
    }

    function uploadFailed(evt) {
      alert("上传文件发生了错误尝试");
    }

    function uploadCanceled(evt) {
      alert("上传被用户取消或者浏览器断开连接");
    }
    
    
    function aciton_process(percentage){
    	//alert(percentage)
    	percentage_int = parseInt(percentage)
    	//alert(percentage_int)
    	$(".container").css("display","block");
    	var interval = setInterval(function () {
            if (percentage_int <100) {
                //percentage++;
                //var widthTemp = (percentage / 100).toFixed(1) + '%';
                $('#progressBar').css('width', percentage);
                $('#progressBar').text(percentage);
                
          
                
            } else if   (percentage_int == 100){
            	$('#progressBar').css('width', percentage);
                $('#progressBar').text(percentage);
                $("#mesg").text("上传成功！")
                clearInterval(interval);
               
                setTimeout(function () {
                    alert("上传成功！")
                }, 1000);
            }
        }, 10);
    	
    }
