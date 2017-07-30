<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport"
			content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
		<link href="${ctx}/static/assets/css/bootstrap.min.css"
			rel="stylesheet" />
		<link rel="stylesheet" href="${ctx}/static/css/style.css" />
		<link rel="stylesheet" href="${ctx}/static/assets/css/ace.min.css" />
		<link rel="stylesheet"
			href="${ctx}/static/assets/css/font-awesome.min.css" />
		<link rel="stylesheet"
			href="${ctx}/static/Widget/zTree/css/zTreeStyle/zTreeStyle.css"
			type="text/css">
			<link href="${ctx}/static/Widget/icheck/icheck.css" rel="stylesheet"
				type="text/css" />
			<title>产品列表</title>
			
</head>
<body>
	<div class=" page-content clearfix">
		<div id="products_style">
			<div class="search_style">
				<form id="searchForm" action="${ctx}/product/findPageBeanByCondition.action" method="post">
					<ul class="search_content clearfix">
						<input type="hidden" name="pageIndex" value="1" id="pageIndex"/>
						<li>
							<label class="l_f">产品名称</label>
							<input name="name" type="text" value="${condition.name}"
							class="text_add" placeholder="输入品牌名称" style=" width:250px" /></li>
						<!-- <li><label class="l_f">添加时间</label><input
							class="inline laydate-icon" id="start" style=" margin-left:10px;">
						</li> -->
						<li style="width:90px;"><button type="submit" 
								class="btn_search">
								<i class="icon-search"></i>查询
							</button></li>
					</ul>
				<form/>
			</div>
			<div class="border clearfix">
				<span class="l_f"> <a href="picture-add.html" title="添加商品"
					class="btn btn-warning Order_form"><i class="icon-plus"></i>添加商品</a>
					<a href="javascript:ovid()" class="btn btn-danger"><i
						class="icon-trash"></i>批量删除</a> </span> <span class="r_f">共：<b>${pageBean.totalCount}</b>件商品</span>
			</div>
			<div class="table_menu_list" id="testIframe">
				<table class="table table-striped table-bordered table-hover"
					id="product-list-table">
					<thead>
						<tr>
							<th width="25px"><label><input type="checkbox"
									class="ace"><span class="lbl"></span>
							</label></th>
							<th width="80px">产品编号</th>
							<th width="250px">产品名称</th>
							<th width="100px">主图</th>
							<th width="100px">价格</th>
							<th width="100px">库存</th>
							<th width="100px">状态</th>
							<th width="70px">状态</th>
							<th width="200px">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${pageBean.list}" var="product">
							<tr>
								<td width="25px"><label><input type="checkbox"
										class="ace"><span class="lbl"></span>
								</label></td>
								<td width="80px">${product.id}</td>
								<td width="250px"><u style="cursor:pointer"
									class="text-primary" onclick="">${product.name}</u></td>
								<td width="100px">${product.mainImage}</td>
								<td width="100px">${product.price}</td>
								<td width="100px">${product.stock}</td>
								<td class="text-l">${product.status}</td>
								<td class="td-status"><span
									class="label label-success radius">已启用</span></td>
								<td class="td-manage"><a
									onClick="member_stop(this,'10001')" href="javascript:;"
									title="停用" class="btn btn-xs btn-success"><i
										class="icon-ok bigger-120"></i> </a> <a title="编辑"
									onclick="member_edit('编辑','member-add.html','4','','510')"
									href="javascript:;" class="btn btn-xs btn-info"><i
										class="icon-edit bigger-120"></i> </a> <a title="删除"
									href="javascript:;" onclick="member_del(this,${product.id})"
									class="btn btn-xs btn-warning"><i
										class="icon-trash  bigger-120"></i> </a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<!-- 分页开始 -->
				<nav aria-label="Page navigation" align="center">
				  <ul class="pagination">
				  	<!-- 上一页 -->
				  	<!-- 判断是否是第一页，是第一页就让一个li设置class=disable -->
				  	 <c:if test="${pageBean.pageIndex==1}">
					  	 <li class="disabled">
					      <a href="javascript:void(0);">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
				  	 </c:if>
				  	<c:if test="${pageBean.pageIndex!=1}">
					    <li>
					      <a href="javascript:goPage('${pageBean.pageIndex-1}');" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
				    </c:if>
				    
				    <c:forEach begin="1" end="${pageBean.totalPage}" var="page">
				    	<c:if test="${pageBean.pageIndex==page}">
					    	<li class="active"><a href="javascript:void(0);">${page}</a></li>
				    	</c:if>
				    	<c:if test="${pageBean.pageIndex!=page}">
					    	<li><a href="javascript:goPage('${page}');">${page}</a></li>
				    	</c:if>
				    </c:forEach>
				    
				    
				    <!-- 上一页 -->
				  	<!-- 判断是否是第一页，是第一页就让一个li设置class=disable -->
				  	 <c:if test="${pageBean.pageIndex==pageBean.totalPage}">
					  	 <li class="disabled">
					      <a href="javascript:void(0);">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
				  	 </c:if>
				  	<c:if test="${pageBean.pageIndex!=pageBean.totalPage}">
					    <li>
					      <a href="javascript:goPage('${pageBean.pageIndex+1}');" aria-label="Previous">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
				    </c:if>
				  </ul>
				</nav>
				<!-- 分页结束 -->
			</div>
		</div>
	</div>
	</div>
</body>
</html>

<script src="${ctx}/static/js/jquery-1.9.1.min.js"></script>
<script src="${ctx}/static/assets/js/bootstrap.min.js"></script>
<script src="${ctx}/static/assets/js/typeahead-bs2.min.js"></script>
<!-- page specific plugin scripts -->
<script src="${ctx}/static/assets/js/jquery.dataTables.min.js"></script>
<script src="${ctx}/static/assets/js/jquery.dataTables.bootstrap.js"></script>
<script type="text/javascript" src="${ctx}/static/js/H-ui.js"></script>
<script type="text/javascript" src="${ctx}/static/js/H-ui.admin.js"></script>
<script src="${ctx}/static/assets/layer/layer.js"
	type="text/javascript"></script>
<script src="${ctx}/static/assets/laydate/laydate.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="${ctx}/static/Widget/zTree/js/jquery.ztree.all-3.5.min.js"></script>
<script src="${ctx}/static/js/lrtk.js" type="text/javascript"></script>

<script>
	function goPage(pageIndex) {
		$("#pageIndex").val(pageIndex);
		$("#searchForm").submit();
	}
</script>

<script>
	jQuery(function($) {
		//API: https://datatables.net/reference/option/ajax
		var oTable1 = $('#sample-table').dataTable({
			"url" : "${ctx}/product/findAllJson",
			"dataSrc" : "list",
			"aaSorting" : [ [ 1, "desc" ] ],//默认第几个排序
			"bStateSave" : true,//状态保存
			"pagingType" : "full_numbers",
			"aoColumnDefs" : [
			//{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
			{
				"orderable" : false,
				"aTargets" : [ 0, 2, 3, 4, 5, 8, 9 ]
			} // 制定列不参与排序
			]
		});

		$('table th input:checkbox').on(
				'click',
				function() {
					var that = this;
					$(this).closest('table').find(
							'tr > td:first-child input:checkbox').each(
							function() {
								this.checked = that.checked;
								$(this).closest('tr').toggleClass('selected');
							});

				});

		$('[data-rel="tooltip"]').tooltip({
			placement : tooltip_placement
		});
		function tooltip_placement(context, source) {
			var $source = $(source);
			var $parent = $source.closest('table')
			var off1 = $parent.offset();
			var w1 = $parent.width();

			var off2 = $source.offset();
			var w2 = $source.width();

			if (parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2))
				return 'right';
			return 'left';
		}
	});
	laydate({
		elem : '#start',
		event : 'focus'
	});
	$(function() {
		$("#products_style").fix({
			float : 'left',
			//minStatue : true,
			skin : 'green',
			durationTime : false,
			spacingw : 30,//设置隐藏时的距离
			spacingh : 260,//设置显示时间距
		});
	});
</script>
<script type="text/javascript">
	/*产品-停用*/
	function member_stop(obj, id) {
		layer
				.confirm(
						'确认要停用吗？',
						function(index) {
							$(obj)
									.parents("tr")
									.find(".td-manage")
									.prepend(
											'<a style="text-decoration:none" class="btn btn-xs " onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="icon-ok bigger-120"></i></a>');
							$(obj)
									.parents("tr")
									.find(".td-status")
									.html(
											'<span class="label label-defaunt radius">已停用</span>');
							$(obj).remove();
							layer.msg('已停用!', {
								icon : 5,
								time : 1000
							});
						});
	}

	/*产品-启用*/
	function member_start(obj, id) {
		layer
				.confirm(
						'确认要启用吗？',
						function(index) {
							$(obj)
									.parents("tr")
									.find(".td-manage")
									.prepend(
											'<a style="text-decoration:none" class="btn btn-xs btn-success" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="icon-ok bigger-120"></i></a>');
							$(obj)
									.parents("tr")
									.find(".td-status")
									.html(
											'<span class="label label-success radius">已启用</span>');
							$(obj).remove();
							layer.msg('已启用!', {
								icon : 6,
								time : 1000
							});
						});
	}
	/*产品-编辑*/
	function member_edit(title, url, id, w, h) {
		layer_show(title, url, w, h);
	}

	/*产品-删除*/
	function member_del(obj, id) {
		layer.confirm('确认要删除吗？', function(index) {
			//$(obj).parents("tr").remove();
			location.href = "${ctx}/product/deleteById.action?id="+ id; 
			/* layer.msg('已删除!', {
				icon : 1,
				time : 1000
			}); */
		});
	}
	//面包屑返回值
	var index = parent.layer.getFrameIndex(window.name);
	parent.layer.iframeAuto(index);
	$('.Order_form').on('click', function() {
		var cname = $(this).attr("title");
		var chref = $(this).attr("href");
		var cnames = parent.$('.Current_page').html();
		var herf = parent.$("#iframe").attr("src");
		parent.$('#parentIframe').html(cname);
		parent.$('#iframe').attr("src", chref).ready();
		;
		parent.$('#parentIframe').css("display", "inline-block");
		parent.$('.Current_page').attr({
			"name" : herf,
			"href" : "javascript:void(0)"
		}).css({
			"color" : "#4c8fbd",
			"cursor" : "pointer"
		});
		//parent.$('.Current_page').html("<a href='javascript:void(0)' name="+herf+" class='iframeurl'>" + cnames + "</a>");
		parent.layer.close(index);

	})};
</script>
