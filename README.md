# Java1705Mall
## 在线商城项目

## 在线商城项目## 在线商城项目## 在线商城项目## 在线商城项目

``` js
$.ajax({
  url:"${pageContext.request.contextPath}/province/selectProvinces",
  dataType:"json",
  success:function(data,textStatus,ajax){
    alert(ajax.responseText);
    //append_template(data, "province");
    var html = "<option>-请选择-</option>";
    for(var i=0;i<data.length;i++){
      html +="<option value='"+data[i].id+"'>"+data[i].province+"</option>";
    }
    $("#province").html(html);
  }
});
```
