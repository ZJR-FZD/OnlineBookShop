<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()
            +":"+request.getServerPort()+path+"/";
    pageContext.setAttribute("basePath", basePath);
%>

<!DOCTYPE html>
<html>
<base href="${basePath}">
    <meta charset="UTF-8">
    <title>销售统计报表</title>

    <script src="bs/js/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <link rel="stylesheet" href="bs/css/bootstrap.css">
    <link rel="stylesheet" href="bs/css/bootstrap-purple-theme.css">

    <style>
        body{
            background:#f5f3ff;
        }
        .stat-box{
            margin:40px auto;
            padding:30px;
            background:#fff;
            border-radius:16px;
            box-shadow:0 10px 30px rgba(124,110,230,.25);
        }
        h2{
            color:#6a5acd;
            margin-bottom:30px;
            font-weight:600;
        }
    </style>
</head>

<body>
<div class="container stat-box">
    <h2 class="text-center">📊 按月份销售统计</h2>
    <canvas id="monthChart" height="120"></canvas>
</div>

<script>
    // 1️⃣ JSP → JS
    var orders = [];
    <c:forEach items="${orderList}" var="o">
        orders.push({ date: "${o.orderDate}" });
    </c:forEach>

    // 2️⃣ 按月份统计
    var monthMap = {};

    orders.forEach(function(o){
        if(!o.date) return;
        var month = o.date.substring(0,7);
        monthMap[month] = (monthMap[month] || 0) + 1;
    });

    var labels = Object.keys(monthMap);
    var values = Object.values(monthMap);

    // 3️⃣ 柱状图
    new Chart(document.getElementById("monthChart"), {
        type: 'bar',
        data: {
            labels: labels,
            datasets: [{
                label: '订单数量',
                data: values,
                backgroundColor: '#7c6ee6'
            }]
        },
        options: {
            plugins: {
                legend: { display: false }
            }
        }
    });
</script>

</body>
</html>