
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>更新密码</title>
  <!-- Include your CSS stylesheets here -->
  <style>
    body {
      text-align: center;
      margin-top: 50px;
    }

    form {
      display: inline-block;
      text-align: left;
    }

    label {
      display: block;
      margin-bottom: 10px;
    }

    input {
      width: 100%;
      padding: 8px;
      margin-bottom: 15px;
    }

    input[type="submit"] {
      background-color: #4CAF50;
      color: white;
      cursor: pointer;
    }

    .success-message {
      color: #4CAF50;
      font-size: 20px;
      margin-bottom: 20px;
    }

    a {
      color: #2196F3;
      text-decoration: none;
    }
  </style>
  <script>
    $(document).ready(function () {
      // 拦截表单提交
      $("#updatePasswordForm").submit(function (event) {
        // 阻止默认表单提交行为
        event.preventDefault();

        // 收集表单数据
        var formData = {
          password: $("#password").val(),
          newpassword: $("#newpassword").val()
        };

        // 发送Ajax请求更新密码
        $.ajax({
          type: "POST",
          url: "${pageContext.request.contextPath}/admin/updatePassword.do",
          data: formData,
          dataType: "json",
          success: function (data) {
            // 显示成功消息或处理错误
            if (data.msg === "密码修改成功，请重新登录") {
              alert("密码修改成功，下次登录时请输入新密码");
            } else {
              // 显示错误消息或处理其他情况
              alert("密码更新失败：" + data.msg);
            }
          },
          error: function () {
            // 处理Ajax错误
            alert("密码更新失败。请重试。");
          }
        });
      });
    });
  </script>
</head>
<body>

<h2>更新密码</h2>

<form id="updatePasswordForm" method="post" action="${pageContext.request.contextPath}/admin/updatePassword.do">
  <label for="password">原密码:</label>
  <input type="password" id="password" name="password" required>

  <label for="newpassword">新密码:</label>
  <input type="password" id="newpassword" name="newpassword" required>

  <input type="submit" value="修改密码">
</form>

<p>
  <a href="${pageContext.request.contextPath}/admin/adminInformation.do">回到信息界面</a>
</p>

</body>
</html>
