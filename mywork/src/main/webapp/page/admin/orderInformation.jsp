<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>订单详情</title>
    <style>
        body {
            text-align: center;
        }

        table {
            margin: 20px auto;
            border-collapse: collapse;
            width: 80%;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
</head>


<body>

<h2>订单详情</h2>

<table border="1">
    <tr>
        <th>商品图片</th>
        <th>商品名称</th>
        <th>交易价格</th>
        <th>交易地点</th>
        <th>买家</th>
        <th>买家电话</th>
        <th>卖家</th>
        <th>卖家电话</th>
    </tr>
    <tr>
        <td><img width="150" height="150" src="${pageContext.request.contextPath}/product/${order.pimage}"></td>
        <td>${order.pname}</td>
        <td>${order.order_price}</td>
        <td>${order.dealAddress}</td>
        <td>${buyUser.username}</td>
        <td>${buyUser.telephone}</td>
        <td>${sellUser.username}</td>
        <td>${sellUser.telephone}</td>
    </tr>
</table>


</body>
</html>
