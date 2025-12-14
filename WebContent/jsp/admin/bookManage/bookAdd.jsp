<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书增加</title>

<link rel="stylesheet" href="bs/css/bootstrap.css">
<script src="bs/js/jquery.min.js"></script>

<link rel="stylesheet" href="bs/validform/style.css">
<script src="bs/validform/Validform_v5.3.2_min.js"></script>
<script src="js/admin/bookManage/bookAdd.js"></script>

<style>
/* ===== 页面背景 ===== */
body {
    background: linear-gradient(135deg, #f5f7ff, #fdfcff);
    font-family: "Microsoft YaHei", sans-serif;
}

/* ===== 卡片容器 ===== */
.container {
    margin-top: 60px;
    background: #fff;
    border-radius: 20px;
    padding: 40px 50px;
    box-shadow: 0 20px 40px rgba(102,126,234,0.15);
}

/* ===== 标题 ===== */
h2 {
    text-align: center;
    margin-bottom: 30px;
    font-weight: 600;
    color: #4f46e5;
}

/* ===== 表单标签 ===== */
.control-label {
    font-weight: 500;
    color: #555;
}

/* ===== 输入框 ===== */
.form-control {
    border-radius: 10px;
    border: 1px solid #ddd;
    transition: all .3s;
}

.form-control:focus {
    border-color: #667eea;
    box-shadow: 0 0 0 3px rgba(102,126,234,0.15);
}

/* ===== select & file ===== */
select.form-control {
    height: 38px;
}

/* ===== 校验提示 ===== */
.Validform_checktip {
    color: #999;
    line-height: 34px;
}

/* ===== 按钮区域 ===== */
.form-group:last-child {
    margin-top: 30px;
}

/* 提交按钮 */
.btn-success {
    background: linear-gradient(135deg, #667eea, #764ba2);
    border: none;
    border-radius: 30px;
    font-size: 16px;
    padding: 10px 0;
    transition: all .3s;
}

.btn-success:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 24px rgba(102,126,234,0.4);
}

/* 重置按钮 */
.btn-warning {
    background: #f1f3ff;
    border: none;
    border-radius: 30px;
    font-size: 16px;
    color: #667eea;
    padding: 10px 0;
    transition: all .3s;
}

.btn-warning:hover {
    background: #e4e7ff;
}

/* ===== 提示信息 ===== */
.text-center {
    color: #4f46e5;
}
</style>
</head>

<body>

<div class="container">

    <c:if test="${!empty bookMessage}">
        <h3 class="text-center">${bookMessage}</h3>
    </c:if>

    <h2>📘 图书增加</h2>

    <form id="bookAddForm" class="form-horizontal"
          action="jsp/admin/BookManageServlet?action=add"
          method="post" enctype="multipart/form-data">

        <div class="form-group">
            <label class="col-sm-2 col-sm-offset-2 control-label">图书名称</label>
            <div class="col-sm-4">
                <input type="text" name="bookName" class="form-control">
            </div>
            <div class="col-sm-4 Validform_checktip"></div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 col-sm-offset-2 control-label">图书类型</label>
            <div class="col-sm-4">
                <select name="catalog" class="form-control">
                    <option value="">==请选择图书类型==</option>
                    <c:forEach items="${catalog}" var="i">
                        <option value="${i.catalogId}">${i.catalogName}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-sm-4 Validform_checktip"></div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 col-sm-offset-2 control-label">图书作者</label>
            <div class="col-sm-4">
                <input type="text" name="author" class="form-control">
            </div>
            <div class="col-sm-4 Validform_checktip"></div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 col-sm-offset-2 control-label">出版社</label>
            <div class="col-sm-4">
                <input type="text" name="press" class="form-control">
            </div>
            <div class="col-sm-4 Validform_checktip"></div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 col-sm-offset-2 control-label">价格</label>
            <div class="col-sm-4">
                <input type="text" name="price" class="form-control">
            </div>
            <div class="col-sm-4 Validform_checktip"></div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 col-sm-offset-2 control-label">图片上传</label>
            <div class="col-sm-4">
                <input type="file" name="bookImg">
            </div>
            <div class="col-sm-4 Validform_checktip"></div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 col-sm-offset-2 control-label">备注</label>
            <div class="col-sm-4">
                <textarea rows="3" name="desc" class="form-control"></textarea>
            </div>
            <div class="col-sm-4 Validform_checktip">*选填</div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 col-sm-offset-2 control-label">
                <input class="btn btn-success btn-block" type="submit" value="提交">
            </label>
            <label class="col-sm-2 control-label">
                <input class="btn btn-warning btn-block" type="reset" value="重置">
            </label>
        </div>

    </form>
</div>

</body>
</html>