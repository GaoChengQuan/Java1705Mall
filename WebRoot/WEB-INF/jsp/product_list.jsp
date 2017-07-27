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
  
  <body class="gray-bg">
    <div class="wrapper wrapper-content  animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox ">
                    <div class="ibox-content">
                        <div class="jqGrid_wrapper">
                            <table id="table_list_1"></table>
                            <div id="pager_list_1"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- 全局js -->
    <script src="${ctx}/js/jquery.min.js?v=2.1.4"></script>
    <script src="${ctx}/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="${ctx}/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${ctx}/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="${ctx}/js/plugins/layer/layer.min.js"></script>
    
    <!-- jqGrid -->
    <script src="${ctx}/js/plugins/jqgrid/i18n/grid.locale-cn.js?0820"></script>
    <script src="${ctx}/js/plugins/jqgrid/jquery.jqGrid.min.js?0820"></script>

    <!-- 自定义js -->
    <script src="${ctx}/js/hAdmin.js?v=4.1.0"></script>
    <script type="text/javascript" src="${ctx}/js/index.js"></script>

    <!-- 第三方插件 -->
    <script src="${ctx}/js/plugins/pace/pace.min.js"></script>
    
	
	<script type="text/javascript">
		$(function(){
		  pageInit();
		});
		function pageInit(){
			$.jgrid.defaults.styleUI = 'Bootstrap';
		   // Configuration for jqGrid Example 1
            $("#table_list_1").jqGrid({
                url : "${ctx}/product/listJson.action",
                datatype: "json",
                height: 500,
                autowidth: true,
                shrinkToFit: true,
                rowNum: 14,
                rowList: [10, 20, 30],
                colNames: ['id','分类id', '商品名称', '副标题', '主图', '图片地址', '价格', '库存数量','商品状态','创建时间','更新时间'],
                colModel: [
                    {
                        name: 'id',
                        index: 'id',
                        width: 60,
                        sorttype: "int"
                    },
                    {
                        name: 'categoryId',
                        index: 'categoryId',
                        width: 60,
                        sorttype: "int",
                    },
                    {
                        name: 'name',
                        index: 'name',
                        width: 60
                    },
                    {
                        name: 'subtitle',
                        index: 'subtitle',
                        width: 60,
                    },
                    {
                        name: 'mainImage',
                        index: 'mainImage',
                        width: 60,
                    },
                    {
                        name: 'subImages',
                        index: 'subImages',
                        width: 60,
                    },
                    {
                        name: 'price',
                        index: 'price',
                        width: 60,
                    },
                    {
                        name: 'stock',
                        index: 'price',
                        width: 60,
                    },
                    {
                        name: 'status',
                        index: 'price',
                        width: 60,
                    },
                    {
                        name: 'createTime',
                        index: 'createTime',
                        width: 60,
                    },
                    {
                        name: 'updateTime',
                        index: 'updateTime',
                        width: 60,
                    }
                ],
                viewrecords: true,
                hidegrid: false
            });
		}
	</script>
	    
  </body>
</html>
