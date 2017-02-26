<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="cc" uri="/WEB-INF/tlds/havePerm.tld" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>DNA健康后台管理系统</title>

<meta name="description" content="overview &amp; stats" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<link rel="icon" href="<%=path%>/assets/img/favicon.ico"
	type="image/x-icon" />
<link rel="shortcut icon" href="<%=path%>/assets/img/favicon.ico"
	type="image/x-icon" />
<!-- bootstrap & fontawesome -->
<link rel="stylesheet" href="<%=path%>/assets/css/bootstrap.css" />

<%--  正式发布时,使用压缩后的css
		<link rel="stylesheet" href="<%=path%>/assets/css/mam-bootstrap.css" />
		<link rel="stylesheet" href="<%=path%>/assets/css/mam-jquery.css" />
		<link rel="stylesheet" href="<%=path%>/assets/css/mam-plugins.css" />
		--%>
<link rel="stylesheet"
	href="<%=path%>/assets/css/bootstrap-datetimepicker.css" />
<link rel="stylesheet"
	href="<%=path%>/assets/css/bootstrap-editable.css" />
<link rel="stylesheet"
	href="<%=path%>/assets/css/bootstrap-multiselect.css" />

<%-- <link rel="stylesheet" href="<%=path%>/assets/css/loaders.css" /> --%>
<!-- page specific plugin styles -->
<link rel="stylesheet" href="<%=path%>/assets/css/datepicker.css" />
<link rel="stylesheet" href="<%=path%>/assets/css/ui.jqgrid.css" />
<link rel="stylesheet" href="<%=path%>/assets/css/chosen.css" />
<link rel="stylesheet" href="<%=path%>/assets/css/dropzone.css" />
<link rel="stylesheet" href="<%=path%>/assets/css/colorbox.css" />
<link rel="stylesheet" href="<%=path%>/assets/css/select2.css" />

<link rel="stylesheet" href="<%=path%>/assets/css/jquery-ui.css" />
<link rel="stylesheet" href="<%=path%>/assets/css/jquery-ui.custom.css" />
<link rel="stylesheet" href="<%=path%>/assets/css/jquery.gritter.css" />

<!-- jquery plugin styles -->
<link rel="stylesheet" href="<%=path%>/plugins/css/jquery.marquee.css"
	type="text/css" />
<link rel="stylesheet"
	href="<%=path%>/plugins/css/jquery-jcrop/jquery.Jcrop.css" />
<link rel="stylesheet"
	href="<%=path%>/plugins/css/autocomplete/jquery.autocomplete.css" />
<link rel="stylesheet" href="<%=path%>/plugins/css/css.css" />
<link rel="stylesheet" href="<%=path%>/plugins/css/lobibox.css" />
<link rel="stylesheet" href="<%=path%>/plugins/css/autoSearchText.css" />
<link rel="stylesheet" href="<%=path%>/plugins/css/zyFile/zyUpload.css" />
<!-- Ztree -->
<link rel="stylesheet" href="<%=path%>/plugins/css/ztree/demo.css" />
<link rel="stylesheet" href="<%=path%>/plugins/css/ztree/zTreeStyle.css" />

<link rel="stylesheet" href="<%=path%>/assets/css/font-awesome.css" />
<link rel="stylesheet" href="<%=path%>/assets/css/ace-fonts.css" />

<!-- ace styles -->
<link rel="stylesheet" href="<%=path%>/assets/css/ace.css"
	class="ace-main-stylesheet" id="main-ace-style" />
<!-- <link rel="stylesheet" href="<%=path%>/assets/css/ace-skins.css"/> -->

<%-- <link rel="stylesheet" href="<%=path%>/pages/live/css/bootstrap-growl.css"/> --%>

<!-- mam comon css -->
<link rel="stylesheet" href="<%=path%>/assets/css/ace-ext.css" />
<link rel="stylesheet" href="<%=path%>/common/mam.css?v=1.0.7" />

<!--video标签的样式 -->
<link rel="stylesheet" href="<%=path%>/plugins/css/video/video-js.css" />

<!-- help page style -->
<!-- <link rel="stylesheet" href="<%=path%>/assets/css/ace.onpage-help.css" />
		<link rel="stylesheet" href="<%=path%>/docs/assets/js/themes/sunburst.css" /> -->
<!--[if lte IE 9]>
		<link rel="stylesheet" href="<%=path%>/assets/css/ace-part2.css" class="ace-main-stylesheet" />
		<![endif]-->

<!--[if lte IE 9]>
		 <link rel="stylesheet" href="<%=path%>/assets/css/ace-ie.css" />
		<![endif]-->

<!-- inline styles related to this page -->

<!-- ace settings handler -->
<script src="<%=path%>/assets/js/ace-extra.js"></script>

<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

<!--[if lte IE 8]>
		<script src="<%=path%>/assets/js/html5shiv.js"></script>
		<script src="<%=path%>/assets/js/respond.js"></script>
		<![endif]-->
<!--[if !IE]> -->
<script type="text/javascript">
			window.jQuery || document.write("<script src='<%=path%>/assets/js/jquery.js'>"+"<"+"/script>");
		</script>
<!--  <![endif]-->

<!--[if IE]>
		<script type="text/javascript">
			window.jQuery || document.write("<script src='<%=path%>/assets/js/jquery1x.js'>"+"<"+"/script>");
		</script>
		<![endif]-->

</head>

<body class="no-skin">
	<!-- #section:basics/navbar.layout -->
	<input type="hidden" id="webroot" value="<%=basePath%>" />
	<button style="display: none;" class="btn btn-md" id="alertButton"></button>
	<!-- 提示信息要用到 -->
	<div id="navbar" class="navbar navbar-default">
		<script type="text/javascript">
				try{ace.settings.check('navbar' , 'fixed')}catch(e){}
			</script>

		<div class="navbar-container" id="navbar-container">
			<!-- #section:basics/sidebar.mobile.toggle -->
			<button type="button" class="navbar-toggle menu-toggler pull-left"
				id="menu-toggler" data-target="#sidebar">
				<span class="sr-only">Toggle sidebar</span> <span class="icon-bar"></span>

				<span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>

			<!-- /section:basics/sidebar.mobile.toggle -->
			<div class="navbar-header pull-left">
				<!-- #section:basics/navbar.layout.brand -->
				<a href="#" class="navbar-brand"> <small> <i
						class="fa fa-leaf"></i> 基因商城后台管理
				</small>
				</a>

				<!-- /section:basics/navbar.layout.brand -->

				<!-- #section:basics/navbar.toggle -->

				<!-- /section:basics/navbar.toggle -->
			</div>

			<!-- #section:basics/navbar.dropdown -->
			<div class="navbar-buttons navbar-header pull-right"
				role="navigation">
				<ul class="nav ace-nav">
					<!-- #section:basics/navbar.user_menu -->
					<li class="light-blue pull-right"><a data-toggle="dropdown"
						href="#" class="dropdown-toggle"> <img class="nav-user-photo"
							src="<%=path%>/assets/avatars/user.jpg" alt="Jason's Photo" /> <span
							class="user-info"> <small>Welcome,</small> ${userName }
						</span> <i class="ace-icon fa fa-caret-down"></i>
					</a>

						<ul
							class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">

							<li><a href="<%=path%>/exit.do"> <i
									class="ace-icon fa fa-power-off"></i> Logout
							</a></li>
						</ul></li>

					<!-- /section:basics/navbar.user_menu -->
				</ul>
			</div>

			<!-- /section:basics/navbar.dropdown -->
		</div>
		<!-- /.navbar-container -->
	</div>

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>

		<!-- #section:basics/sidebar -->
		<div id="sidebar" class="sidebar                  responsive">
			<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
				</script>

			<div class="sidebar-shortcuts" id="sidebar-shortcuts">
				<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
					<button class="btn btn-success">
						<i class="ace-icon fa fa-signal"></i>
					</button>

					<button class="btn btn-info">
						<i class="ace-icon fa fa-pencil"></i>
					</button>

					<!-- #section:basics/sidebar.layout.shortcuts -->
					<button class="btn btn-warning">
						<i class="ace-icon fa fa-users"></i>
					</button>

					<button class="btn btn-danger">
						<i class="ace-icon fa fa-cogs"></i>
					</button>

					<!-- /section:basics/sidebar.layout.shortcuts -->
				</div>

				<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
					<span class="btn btn-success"></span> <span class="btn btn-info"></span>

					<span class="btn btn-warning"></span> <span class="btn btn-danger"></span>
				</div>
			</div>
			<!-- /.sidebar-shortcuts -->

			<ul class="nav nav-list" id="left_menu">
				<li class="active"><a href="index.html"> <i
						class="menu-icon fa fa-tachometer"></i> <span class="menu-text">
							Dashboard </span>
				</a> <b class="arrow"></b>
				</li>
				<cc:hasUrlPerm link="systemadmin.do">
					<li class=""><a href="#" class="dropdown-toggle"> <i
							class="menu-icon fa fa-desktop"></i> <span class="menu-text">
								系统管理</span> <b class="arrow fa fa-angle-down"></b>
					</a> <b class="arrow"></b>
	
						<ul class="submenu">
							<cc:hasUrlPerm link="admin/adminPage.do">
								<li class=""><a href="#" class="dropdown-toggle"
									menu-url="admin/adminPage.do"> <i
										class="menu-icon fa fa-caret-right"></i> 用户管理
								</a> <b class="arrow"></b></li>
							</cc:hasUrlPerm>
							<cc:hasUrlPerm link="permission/permissionPage.do">
								<li class=""><a href="#" class="dropdown-toggle"
									menu-url="permission/permissionPage.do"> <i
										class="menu-icon fa fa-caret-right"></i> 权限管理
								</a> <b class="arrow"></b></li>
							</cc:hasUrlPerm>
							<cc:hasUrlPerm link="mapAdminPermission/mapAdminPermissionPage.do">
								<li class=""><a href="#" class="dropdown-toggle"
									menu-url="mapAdminPermission/mapAdminPermissionPage.do"> <i
										class="menu-icon fa fa-caret-right"></i> 用户权限
								</a> <b class="arrow"></b></li>
							</cc:hasUrlPerm>
						</ul>
					</li>
				</cc:hasUrlPerm>
				<cc:hasUrlPerm link="productManage.do">
					<li class=""><a href="#" class="dropdown-toggle"> <i
							class="menu-icon fa fa-list"></i> <span class="menu-text">
								商品管理 </span> <b class="arrow fa fa-angle-down"></b>
					</a> <b class="arrow"></b>
	
						<ul class="submenu">
							<cc:hasUrlPerm link="classify/productPage.do">
								<li class=""><a a href="#" class="dropdown-toggle"
									menu-url="classify/productPage.do"> <i
										class="menu-icon fa fa-caret-right"></i> 上传商品
								</a> <b class="arrow"></b></li>
							</cc:hasUrlPerm>
							<cc:hasUrlPerm link="product/productPage.do">
								<li class=""><a a href="#" class="dropdown-toggle"
									menu-url="product/productPage.do"> <i
										class="menu-icon fa fa-caret-right"></i> 商品查询
								</a> <b class="arrow"></b></li>
							</cc:hasUrlPerm>
							<cc:hasUrlPerm link="product/productEditorPage.do">
								<li class=""><a a href="#" class="dropdown-toggle"
									menu-url="product/productEditorPage.do"> <i
										class="menu-icon fa fa-caret-right"></i> 商品修改
								</a> <b class="arrow"></b></li>
							</cc:hasUrlPerm>
						</ul>
					</li>
				</cc:hasUrlPerm>
				<cc:hasUrlPerm link="orderManage.do">
					<li class=""><a href="#" class="dropdown-toggle"> <i
							class="menu-icon fa fa-pencil-square-o"></i> <span
							class="menu-text"> 订单管理 </span> <b class="arrow fa fa-angle-down"></b>
					</a> <b class="arrow"></b>
	
						<ul class="submenu">
							<cc:hasUrlPerm link="orderInfo/reAndDeOrderPage.do">
								<li class=""><a href="#"
									menu-url="orderInfo/reAndDeOrderPage.do"> <i
										class="menu-icon fa fa-caret-right"></i> 收发货订单
								</a> <b class="arrow"></b></li>
							</cc:hasUrlPerm>
							<cc:hasUrlPerm link="orderInfo/detectionOrderPage.do">
								<li class=""><a href="#"
									menu-url="orderInfo/detectionOrderPage.do"> <i
										class="menu-icon fa fa-caret-right"></i> 检测中订单
								</a> <b class="arrow"></b></li>
							</cc:hasUrlPerm>
							<cc:hasUrlPerm link="orderInfo/completeOrderPage.do">
								<li class=""><a href="#"
									menu-url="orderInfo/completeOrderPage.do"> <i
										class="menu-icon fa fa-caret-right"></i> 已完成订单
								</a> <b class="arrow"></b></li>
							</cc:hasUrlPerm>
						</ul>
					</li>
				</cc:hasUrlPerm>
				<cc:hasUrlPerm link="classifyManage.do">
					<li class=""><a href="#" class="dropdown-toggle"> <i
							class="menu-icon fa fa-list-alt"></i> <span class="menu-text">
								分类管理 </span> <b class="arrow fa fa-angle-down"></b>
					</a> <b class="arrow"></b>
						<ul class="submenu">
							<cc:hasUrlPerm link="classify2/classifyListPage.do">
								<li class=""><a href="#"
									menu-url="classify2/classifyListPage.do"> <i
										class="menu-icon fa fa-caret-right"></i> 分类操作
								</a> <b class="arrow"></b></li>
							</cc:hasUrlPerm>
						</ul>
					</li>
				</cc:hasUrlPerm>
				
			</ul>
			<!-- /.nav-list -->

			<!-- #section:basics/sidebar.layout.minimize -->
			<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
				<i class="ace-icon fa fa-angle-double-left"
					data-icon1="ace-icon fa fa-angle-double-left"
					data-icon2="ace-icon fa fa-angle-double-right"></i>
			</div>

			<!-- /section:basics/sidebar.layout.minimize -->
			<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
				</script>
		</div>

		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner" id="main_page"></div>
		</div>
		<!-- /.main-content -->

		<div class="footer">
			<div class="footer-inner">
				<!-- #section:basics/footer -->
				<div class="footer-content">
					<span class="bigger-120"> <!-- <span class="blue bolder">Ace</span> -->
						基因商城&copy; 2016-2017
					</span> &nbsp; &nbsp;
					<!-- <span class="action-buttons">
							<a href="#">
								<i class="ace-icon fa fa-twitter-square light-blue bigger-150"></i>
							</a>

							<a href="#">
								<i class="ace-icon fa fa-facebook-square text-primary bigger-150"></i>
							</a>

							<a href="#">
								<i class="ace-icon fa fa-rss-square orange bigger-150"></i>
							</a>
						</span> -->
				</div>

				<!-- /section:basics/footer -->
			</div>
		</div>

		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->

	<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='<%=path%>/ace/assets/js/jquery.mobile.custom.js'>"+ "<"+"/script>");
	</script>
	<script src="<%=path%>/assets/js/bootstrap.js"></script>

	<!-- page specific plugin scripts -->

	<!--[if lte IE 8]>
		  <script src="<%=path%>/assets/js/excanvas.js"></script>
		<![endif]-->

	<script src="<%=path%>/pagejs/util.js"></script>
	<script src="<%=path%>/assets/js/imageEditer.js"></script>
	<script src="<%=path%>/assets/js/jquery-ui.custom.js"></script>
	<script src="<%=path%>/assets/js/jquery.ui.touch-punch.js"></script>
	<script src="<%=path%>/assets/js/flot/jquery.flot.js"></script>
	<script src="<%=path%>/assets/js/flot/jquery.flot.pie.js"></script>
	<script src="<%=path%>/assets/js/flot/jquery.flot.resize.js"></script>
	<script src="<%=path%>/assets/js/jquery.validate.js"></script>

	<!-- 多级联动 -->
	<script src="<%=path%>/assets/js/area.js"></script>
	<script src="<%=path%>/assets/js/location.js"></script>



	<!-- ace scripts -->
	<script src="<%=path%>/assets/js/ace/elements.scroller.js"></script>
	<script src="<%=path%>/assets/js/ace/elements.colorpicker.js"></script>
	<script src="<%=path%>/assets/js/ace/elements.fileinput.js"></script>
	<script src="<%=path%>/assets/js/ace/elements.typeahead.js"></script>
	<script src="<%=path%>/assets/js/ace/elements.wysiwyg.js"></script>
	<script src="<%=path%>/assets/js/ace/elements.spinner.js"></script>
	<script src="<%=path%>/assets/js/ace/elements.treeview.js"></script>
	<script src="<%=path%>/assets/js/ace/elements.wizard.js"></script>
	<script src="<%=path%>/assets/js/ace/elements.aside.js"></script>
	<script src="<%=path%>/assets/js/ace/ace.js"></script>
	<script src="<%=path%>/assets/js/ace/ace.ajax-content.js"></script>
	<script src="<%=path%>/assets/js/ace/ace.touch-drag.js"></script>
	<script src="<%=path%>/assets/js/ace/ace.sidebar.js"></script>
	<script src="<%=path%>/assets/js/ace/ace.sidebar-scroll-1.js"></script>
	<script src="<%=path%>/assets/js/ace/ace.submenu-hover.js"></script>
	<script src="<%=path%>/assets/js/ace/ace.widget-box.js"></script>
	<script src="<%=path%>/assets/js/ace/ace.settings.js"></script>
	<script src="<%=path%>/assets/js/ace/ace.settings-rtl.js"></script>
	<script src="<%=path%>/assets/js/ace/ace.settings-skin.js"></script>
	<script src="<%=path%>/assets/js/ace/ace.widget-on-reload.js"></script>
	<script src="<%=path%>/assets/js/ace/ace.searchbox-autocomplete.js"></script>

	<!-- <script type="text/javascript"> ace.vars['base'] = '<c:url value="/"/>'; </script> -->
	<script type="text/javascript">
		ace.vars['base'] = '..';
	</script>
	<script src="<%=path%>/assets/js/ace/elements.onpage-help.js"></script>
	<script src="<%=path%>/assets/js/ace/ace.onpage-help.js"></script>
	<script src="<%=path%>/docs/assets/js/rainbow.js"></script>
	<script src="<%=path%>/docs/assets/js/language/generic.js"></script>
	<script src="<%=path%>/docs/assets/js/language/html.js"></script>
	<script src="<%=path%>/docs/assets/js/language/css.js"></script>
	<script src="<%=path%>/docs/assets/js/language/javascript.js"></script>

	<!-- jqgrid -->
	<script src="<%=path%>/assets/js/jqGrid/jquery.jqGrid.src.js"></script>
	<script src="<%=path%>/assets/js/jqGrid/i18n/grid.locale-cn.js"></script>
	<!-- jquery plugin -->
	<script src="<%=path%>/assets/js/jquery-ui.js"></script>
	<script src="<%=path%>/assets/js/jquery-ui.custom.js"></script>
	<script src="<%=path%>/assets/js/jquery.ui.touch-punch.js"></script>
	<script src="<%=path%>/assets/js/jquery.gritter.js"></script>
	<script src="<%=path%>/assets/js/jquery.easypiechart.js"></script>
	<!-- <script src="<%=path%>/assets/js/jquery.sparkline.js"></script> -->
	<script src="<%=path%>/assets/js/typeahead.jquery.js"></script>
	<script src="<%=path%>/assets/js/jquery.hotkeys.js"></script>
	<script src="<%=path%>/assets/js/bootstrap-wysiwyg.js"></script>
	<script src="<%=path%>/assets/js/fuelux/fuelux.wizard.js"></script>
	<script src="<%=path%>/assets/js/select2.js"></script>
	<script src="<%=path%>/assets/js/x-editable/bootstrap-editable.js"></script>
	<script src="<%=path%>/assets/js/x-editable/ace-editable.js"></script>
	<script src="<%=path%>/assets/js/jquery.colorbox.js"></script>
	<script src="<%=path%>/assets/js/jquery.maskedinput.js"></script>
	<script src="<%=path%>/assets/js/chosen.jquery.js"></script>
	<script src="<%=path%>/plugins/js/jquery-pin/jquery.pin.min.js"></script>
	<script src="<%=path%>/plugins/js/json/json2.min.js"></script>
	<script src="<%=path%>/plugins/js/waypoints/jquery.waypoints.min.js"></script>
	<script src="<%=path%>/plugins/js/jquery-jcrop/jquery.Jcrop.js"></script>
	<%-- <script src="<%=path%>/pages/star/js/jquery.form.js"></script> --%>
	<script src="<%=path%>/plugins/js/autocomplete/jquery.autocomplete.js"></script>

	<script src="<%=path%>/plugins/js/msgTips.js"></script>
	<%--<script src="<%=path%>/plugins/js/echarts/dist/echarts-all.js"></script>--%>
	<script src="<%=path%>/plugins/js/lobibox.js"></script>

	<!-- ztree -->
	<script src="<%=path%>/plugins/js/ztree/jquery.ztree.core-3.5.js"></script>
	<script src="<%=path%>/plugins/js/ztree/jquery.ztree.excheck-3.5.js"></script>
	<script src="<%=path%>/plugins/js/ztree/jquery.ztree.exedit-3.5.js"></script>
	<script src="<%=path%>/plugins/js/ztree/jquery.ztree.exhide-3.5.min.js"></script>

	<script src="<%=path%>/assets/js/date-time/moment-with-locales.js"></script>
	<!--时间获取和处理js -->
	<script src="<%=path%>/assets/js/date-time/moment.js"></script>
	<script src="<%=path%>/assets/js/date-time/daterangepicker.js"></script>
	<script src="<%=path%>/assets/js/date-time/bootstrap-datepicker.js"></script>
	<script src="<%=path%>/assets/js/date-time/bootstrap-datetimepicker.js"></script>
	<script
		src="<%=path%>/assets/js/date-time/todayafternoselect-bootstrap-datepicker.js"></script>


	<script src="<%=path%>/assets/js/dropzone.js"></script>
	<script src="<%=path%>/assets/js/bootbox.js"></script>
	<script src="<%=path%>/assets/js/fuelux/fuelux.spinner.js"></script>
	<script src="<%=path%>/plugins/js/resize.js"></script>

	<script src="<%=path%>/plugins/js/mytag/elements.mytypeahead.js"></script>
	<script src="<%=path%>/plugins/js/mytag/bootstrap-mytag.js"></script>

	<!--双向 选择框 -->
	<script src="<%=path%>/assets/js/jquery.bootstrap-duallistbox.js"></script>
	<script src="<%=path%>/assets/js/fuelux/fuelux.tree.js"></script>
	<script src="<%=path%>/plugins/js/mouseRightmenu/jquery-smartMenu.js"></script>



	<!--for transCode -->
	<%-- <script src="<%=path%>/pages/live/imitativeChannel/js/tablednd.js"></script> --%>
	<!-- 自定义时间控件 -->
	<%-- <script src="<%=path%>/pages/live/js/jquery.datetimepicker.full.js"></script>
		<script src="<%=path%>/pages/live/js/my-datetimepicker.js"></script>
		<script src="<%=path%>/pages/live/imitativeChannel/js/epg-datetimepicker.js"></script> --%>
	<script src="<%=path%>/plugins/js/echarts/dist/echarts.js"></script>
	<!-- 首页 -->
	<%-- <script src="<%=path%>/pages/util.js?v=1.0.7"></script>
		<script src="<%=path%>/pages/main.js"></script>
		<script src="<%=path%>/pages/live/js/MVC/base.js"></script>
		<script src="<%=path%>/pages/live/js/MVC/common.js"></script>
		<script src="<%=path%>/pages/live/js/MVC/page.js"></script> --%>
	<!-- 点播 -->
	<%-- <script src="<%=path%>/pages/asset/js/assetAdd.js?v=1.0.7"></script>
		<script src="<%=path%>/pages/asset/js/imageEditer.js?v=1.0.7"></script>
		<script src="<%=path%>/pages/asset/js/imageView.js"></script>
		<script src="<%=path%>/pages/asset/js/starSelect.js"></script>
		<script src="<%=path%>/pages/asset/js/labelBox.js?v=1.0.7"></script>
		<script src="<%=path%>/pages/asset/js/imageList.js"></script>
		<script src="<%=path%>/plugins/js/zyFile/zyFile.js"></script>
		<script src="<%=path%>/plugins/js/zyFile/zyUpload.js"></script> --%>


	<!-- inline scripts related to this page -->
	<script type="text/javascript">
		//js中全局的项目路径变量           http://localhost:8080/SpringGene1/
		var webroot;
		$(document).ready(function() {
			webroot = $("#webroot").val();
			$('#left_menu a').each(function(n, v) {
				var url = $(v).attr("menu-url");
				if (url) {
					$(v).unbind('click').click(function(e) {
						openPage($(this).attr("menu-url"));

						$('#left_menu .active').each(function(nn, vv) {
							$(vv).removeClass("active");
						});
						$(this).parents("li").each(function(nn, vv) {
							$(vv).addClass("active");
						});
					});
				}
			});
			function openPage(url) {
				var p = $("#main_page");
				if (p.length > 0) {
					p.load(webroot + url, function(response, status, xhr) {
						if (status != "success") {
							/* if(checkSession) {
								checkSession();
							} */
						}
					});
				}
			}
		});

		//显示提示信息方法
		function alertmsg(type, msg) {
			$("#alertButton").manhua_msgTips({
				Event : "click", //响应的事件
				timeOut : 3000, //提示层显示的时间
				msg : msg, //显示的消息
				speed : 800, //滑动速度
				type : type
			//提示类型（1、success 2、error 3、warning）

			});
			$("#alertButton").click();
		}
	</script>
</body>
</html>
