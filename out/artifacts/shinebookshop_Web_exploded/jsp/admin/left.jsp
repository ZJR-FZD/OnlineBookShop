<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();  
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>在此处插入标题</title>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<link rel="stylesheet" href="css/admin/left.css">
</head>
<body>
	<div class="left">
		<ul>
			<li class="list">
				<h3>人 员 管 理</h3>
				<ul>
					<li><a href="jsp/admin/AdminManageServlet?action=list" target="rFrame">管理员管理</a></li>
					<li><a href="jsp/admin/UserManageServlet?action=list" target="rFrame">用户管理</a></li>
				</ul>
			</li>
			<li class="list">
				<h3>图 书 管 理</h3>
				<ul>
					<li><a href="jsp/admin/BookManageServlet?action=list" target="rFrame">图书列表</a></li>
					<li><a href="jsp/admin/CatalogServlet?action=list" target="rFrame">分类管理</a></li>
				</ul>
			</li>
			
			<li class="list">
				<h3>订 单 管 理</h3>
				<ul>
					<li><a href="jsp/admin/OrderManageServlet?action=list" target="rFrame">订单列表</a></li>
					<li><a href="jsp/admin/OrderManageServlet?action=processing" target="rFrame">订单处理</a></li>
					<li><a href="jsp/admin/OrderManageServlet?action=stat" target="rFrame">订单报表</a></li>
				</ul>
			</li>
					
		</ul>
	</div>
	<script type="text/javascript">
	/* 菜单切换展开 */
		$(document).ready(function() {
            // 初始状态：所有子菜单收起
            $(".list ul").hide();

            // 点击一级菜单标题
            $(".list h3").click(function(){
                var $submenu = $(this).next("ul");
                var $allSubmenus = $(".list ul");
                var $allTitles = $(".list h3");

                // 如果当前子菜单是隐藏的
                if($submenu.is(":hidden")){
                    // 收起所有其他子菜单
                    $allSubmenus.slideUp(300);
                    $allTitles.removeClass("active");
                    $allTitles.css("color","#fff");

                    // 展开当前子菜单
                    $submenu.slideDown(300);
                    $(this).addClass("active");
                    $(this).css("color","#fff");
                } else {
                    // 收起当前子菜单
                    $submenu.slideUp(300);
                    $(this).removeClass("active");
                }
            });

            // 点击二级菜单项
            $(".list ul a").click(function(){
                // 移除所有激活状态
                $(".list ul a").removeClass("active");
                $(".list ul a").css("color","#555");

                // 添加当前激活状态
                $(this).addClass("active");
                $(this).css("color","#667eea");
            });

            // 默认展开第一个菜单（可选）
            // $(".list:first-child h3").click();
        });
	</script>
</body>
</html>