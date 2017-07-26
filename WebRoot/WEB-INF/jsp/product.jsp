<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'product.jsp' starting page</title>
    
	<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
    <link rel="shortcut icon" href="favicon.ico"> <link href="${ctx}/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${ctx}/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="${ctx}/css/animate.css" rel="stylesheet">
    <link href="${ctx}/css/style.css?v=4.1.0" rel="stylesheet">
  </head>
  
  <body>
  	<div class="container" >
       <div align="center">
           <h2 style="display: inline" >学生信息管理系统</h2> 欢迎您：${student.getName()} <a href="${pageContext.request.contextPath}/loginFilter?method=loginOut">退出</a>
       </div>
       <hr/>
       
       <form id="mainForm" action="" method="post">
           <table class="table table-bordered table-hover table-striped">
               <tr>
                  <td>
                      <input type="checkbox" id="selectAll" onClick="selectAlls();"/>
                  </td>
                  <td>商品id</td>
                  <td>分类id</td>
                  <td>商品名称</td>
                  <td>商品副标题</td>
                  <td>产品主图,url相对地址</td>
                  <td>图片地址</td>
                  <!-- <td>商品详情</td> -->
                  <td>价格</td>
                  <td>库存数量</td>
                  <td>商品状态</td>
                  <td>创建时间</td>
                  <td>更新时间</td>
                  <td>删除</td>
                  <td>修改</td>
               </tr>
               <c:forEach items="${list}" var="product">
                  <tr>
                      <td>
                          <input type="checkbox" name="selectIds""/>
                      </td>
                      <td>${product.id}</td>
                      <td>${product.categoryId}</td>
                      <td>${product.name}</td>
                      <td>${product.subtitle}</td>
                      <td>${product.mainImage}</td>
                      <td>${product.subImages}</td>
                      <%-- <td>${product.detail}</td> --%>
                      <td>${product.price}</td>
                      <td>${product.stock}</td>
                      <td>${product.status}</td>
                      <td>${product.createTime}</td>
                      <td>${product.updateTime}</td>
                      <td><a href="javascript:void(0);"
                          onclick="delStudent('${student.getId()}')">删除</a>
                      </td>
                      <td><a
                          href="${ctx}/student?method=toUpdate&id=${student.getId()}">修改</a>
                      </td>
                  </tr>
               </c:forEach>
           </table>
       </form>
    </div>
    
    <!-- 全局js -->
    <script src="${ctx}/js/jquery.min.js?v=2.1.4"></script>
    <script src="${ctx}/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="${ctx}/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${ctx}/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="${ctx}/js/plugins/layer/layer.min.js"></script>

    <!-- 自定义js -->
    <script src="${ctx}/js/hAdmin.js?v=4.1.0"></script>
    <script type="text/javascript" src="${ctx}/js/index.js"></script>

    <!-- 第三方插件 -->
    <script src="${ctx}/js/plugins/pace/pace.min.js"></script>
  </body>
</html>
