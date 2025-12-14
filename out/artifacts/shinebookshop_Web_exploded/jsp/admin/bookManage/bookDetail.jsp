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
    <meta charset="UTF-8">
    <title>图书详情页</title>
    <link rel="stylesheet" href="bs/css/bootstrap.css">
    <style type="text/css">
       /* 现代化图书详情页样式 */
       * {
           margin: 0;
           padding: 0;
           box-sizing: border-box;
       }

       body {
           font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'PingFang SC', 'Hiragino Sans GB', 'Microsoft YaHei', sans-serif;
           background: linear-gradient(135deg, #f5f7fa 0%, #e8eaf6 100%);
           padding: 20px;
           min-height: 100vh;
       }

       /* 页面标题 */
       h2 {
           color: #333;
           font-weight: 700;
           margin: 25px 0 30px;
           padding-bottom: 15px;
           border-bottom: 3px solid #667eea;
           position: relative;
           text-align: center;
       }

       h2::before {
           content: '📖';
           margin-right: 12px;
           font-size: 32px;
       }

       h2::after {
           content: '';
           position: absolute;
           bottom: -3px;
           left: 50%;
           transform: translateX(-50%);
           width: 100px;
           height: 3px;
           background: linear-gradient(90deg, #667eea 0%, #764ba2 100%);
       }

       /* 主容器 */
       .container {
           background: white;
           border-radius: 20px;
           padding: 40px;
           box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
           max-width: 900px;
           margin: 0 auto;
       }

       /* 信息行 */
       .info-row {
           display: flex;
           margin-bottom: 20px;
           padding: 15px;
           border-radius: 12px;
           transition: all 0.3s;
           align-items: flex-start;
       }

       .info-row:hover {
           background: rgba(102, 126, 234, 0.05);
           transform: translateX(5px);
       }

       /* 标签 */
       .info-label {
           min-width: 120px;
           font-weight: 600;
           color: #667eea;
           font-size: 15px;
           padding: 5px 15px;
           background: rgba(102, 126, 234, 0.1);
           border-radius: 8px;
           margin-right: 20px;
           text-align: center;
           position: relative;
       }

       .info-label::after {
           content: '';
           position: absolute;
           right: -8px;
           top: 50%;
           transform: translateY(-50%);
           width: 0;
           height: 0;
           border-top: 6px solid transparent;
           border-bottom: 6px solid transparent;
           border-left: 8px solid rgba(102, 126, 234, 0.1);
       }

       /* 内容 */
       .info-content {
           flex: 1;
           color: #555;
           font-size: 15px;
           line-height: 1.8;
           padding: 5px 0;
       }

       /* 价格特殊样式 */
       .price-value {
           font-size: 28px;
           font-weight: 700;
           color: #f5576c;
           font-family: 'Arial', sans-serif;
       }

       .price-value::before {
           content: '¥';
           font-size: 20px;
           margin-right: 2px;
       }

       /* 图书简介区域 */
       .description-row {
           margin-top: 30px;
           padding: 20px;
           background: linear-gradient(135deg, rgba(102, 126, 234, 0.05) 0%, rgba(118, 75, 162, 0.05) 100%);
           border-radius: 12px;
           border-left: 4px solid #667eea;
       }

       .description-row .info-label {
           background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
           color: white;
           margin-bottom: 15px;
           display: inline-block;
       }

       .description-row .info-label::after {
           display: none;
       }

       .description-content {
           color: #555;
           line-height: 1.8;
           font-size: 15px;
           text-indent: 2em;
       }

       /* 图书封面区域 */
       .book-cover-section {
           margin-top: 40px;
           text-align: center;
           padding: 30px;
           background: linear-gradient(135deg, #f5f7fa 0%, #e8eaf6 100%);
           border-radius: 15px;
       }

       .book-cover-section h3 {
           color: #667eea;
           font-weight: 600;
           margin-bottom: 20px;
           font-size: 18px;
       }

       .book-cover-section img {
           max-width: 100%;
           max-height: 500px;
           border-radius: 15px;
           box-shadow: 0 10px 40px rgba(0, 0, 0, 0.15);
           transition: transform 0.3s;
       }

       .book-cover-section img:hover {
           transform: scale(1.02) translateY(-5px);
           box-shadow: 0 15px 50px rgba(102, 126, 234, 0.3);
       }

       /* 操作按钮区域 */
       .action-buttons {
           margin-top: 30px;
           text-align: center;
           padding-top: 30px;
           border-top: 2px solid #f0f0f0;
       }

       .action-buttons .btn {
           margin: 0 10px;
           padding: 10px 30px;
           border-radius: 25px;
           font-weight: 600;
           transition: all 0.3s;
           border: none;
           font-size: 15px;
       }

       .btn-primary {
           background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
           color: white;
       }

       .btn-primary:hover {
           transform: translateY(-3px);
           box-shadow: 0 8px 20px rgba(102, 126, 234, 0.4);
       }

       .btn-success {
           background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);
           color: white;
       }

       .btn-success:hover {
           transform: translateY(-3px);
           box-shadow: 0 8px 20px rgba(67, 233, 123, 0.4);
       }

       .btn-default {
           background: #f5f7fa;
           color: #555;
           border: 2px solid #e0e0e0;
       }

       .btn-default:hover {
           background: #e0e5ea;
           transform: translateY(-3px);
       }

       /* 响应式设计 */
       @media (max-width: 768px) {
           .container {
               padding: 20px;
               border-radius: 15px;
           }

           .info-row {
               flex-direction: column;
           }

           .info-label {
               margin-bottom: 10px;
               margin-right: 0;
           }

           .info-label::after {
               display: none;
           }

           .action-buttons .btn {
               display: block;
               width: 100%;
               margin: 10px 0;
           }

           h2 {
               font-size: 24px;
           }
       }

       /* 加载动画 */
       @keyframes fadeIn {
           from {
               opacity: 0;
               transform: translateY(20px);
           }
           to {
               opacity: 1;
               transform: translateY(0);
           }
       }

       .container {
           animation: fadeIn 0.5s ease;
       }
    </style>
</head>
<body>
    <h2>图书详情</h2>
    <div class="container">
       <!-- 图书ID -->
       <div class="info-row">
          <div class="info-label">图书编号</div>
          <div class="info-content">${bookInfo.bookId}</div>
       </div>

       <!-- 图书名称 -->
       <div class="info-row">
          <div class="info-label">图书名称</div>
          <div class="info-content"><strong>${bookInfo.bookName}</strong></div>
       </div>

       <!-- 图书分类 -->
       <div class="info-row">
          <div class="info-label">图书分类</div>
          <div class="info-content">${bookInfo.catalog.catalogName}</div>
       </div>

       <!-- 图书作者 -->
       <div class="info-row">
          <div class="info-label">图书作者</div>
          <div class="info-content">${bookInfo.author}</div>
       </div>

       <!-- 出版社 -->
       <div class="info-row">
          <div class="info-label">出版社</div>
          <div class="info-content">${bookInfo.press}</div>
       </div>

       <!-- 图书价格 -->
       <div class="info-row">
          <div class="info-label">图书价格</div>
          <div class="info-content">
             <span class="price-value">${bookInfo.price}</span>
          </div>
       </div>

       <!-- 上架日期 -->
       <div class="info-row">
          <div class="info-label">上架日期</div>
          <div class="info-content">${bookInfo.addTime}</div>
       </div>

       <!-- 图书简介 -->
       <div class="description-row">
          <div class="info-label">📝 图书简介</div>
          <div class="description-content">
             ${bookInfo.description}
          </div>
       </div>

       <!-- 图书封面 -->
       <div class="book-cover-section">
          <h3>📷 图书封面</h3>
          <img alt="${bookInfo.bookName}" src="${bookInfo.upLoadImg.imgSrc}">
       </div>

       <!-- 操作按钮 -->
       <div class="action-buttons">
          <button class="btn btn-primary" onclick="history.back()">← 返回列表</button>
          <button class="btn btn-success" onclick="window.print()">🖨️ 打印详情</button>
       </div>
    </div>
</body>
</html>