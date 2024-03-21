
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>管理员信息</title>
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

<h2>管理员信息</h2>

<c:if test="${not empty admin}">
    <table border="1">
        <tr>
            <th>ID</th>
            <th>管理员姓名</th>
            <th>电话号码</th>
            <th>职责</th>
        </tr>
        <tr>
            <td>${admin.id}</td>
            <td>${admin.username}</td>
            <td>${admin.telephone}</td>
            <td>${admin.role}</td>
        </tr>
    </table>
</c:if>



</body>
</html>