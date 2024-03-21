
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>User Registration</title>
    <!-- Include your CSS stylesheets here -->
    <style>
        body {
            text-align: center;
            margin-top: 50px;
            background-image: url("../page/1@2x.jpg");
            background-size: cover;
            font-family: 'Arial', sans-serif; /* 选择适合的字体 */
            color: #333; /* 主要文本颜色 */
        }

        .registration-container {
            width: 40%;
            margin: auto;
            display: inline-block;
            background-color: #fff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0px 0px 15px 0px rgba(0, 0, 0, 0.1); /* 添加阴影效果 */
        }

        form {
            width: 80%;
            margin: auto;
            display: block;
            text-align: left;
        }

        label {
            display: block;
            margin-bottom: 15px;
        }

        input, select {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc; /* 添加边框 */
            border-radius: 8px;
        }

        input[type="submit"] {
            background-color: #e0891e;
            color: white;
            cursor: pointer;
            padding: 12px;
            border: none;
            border-radius: 8px;
            transition: background-color 0.3s ease; /* 添加过渡效果 */
        }

        input[type="submit"]:hover {
            background-color: #d0781a;
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

        /* 其他样式和布局规则 */



        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-btn {
            background-color: #4CAF50;
            color: white;
            padding: 8px;
            border: none;
            cursor: pointer;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 200%; /* 设置宽度为100% */
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            z-index: 1;
        }

        .dropdown-content option {
            color: black;
            padding: 12px 16px;
            display: block;
            width: 200%;
            border: none;
            background-color: inherit;
            text-align: left;
            cursor: pointer;
        }

        .dropdown-content option:hover {
            background-color: #ddd;
        }

        .show {
            display: block;
        }
    </style>
</head>
<body>
<div class="registration-container">
    <h2>用户注册</h2>

    <c:if test="${not empty msg}">
    <div class="success-message">
            ${msg}
    </div>
    </c:if>

    <form id="registrationForm" method="post" action="${pageContext.request.contextPath}/user/userRegist.do">
        <label for="username">用户名:</label>
        <input type="text" id="username" name="username" required>

        <label for="telephone">电话:</label>
        <input type="text" id="telephone" name="telephone" required>

        <label for="password">密码:</label>
        <input type="password" id="password" name="password" required>

        <label for="confirmPassword">确认密码:</label>
        <input type="password" id="confirmPassword" name="confirmPassword" required>

        <label for="email">邮箱:</label>
        <input type="email" id="email" name="email" required>

        <label for="studentid">学号:</label>
        <input type="text" id="studentid" name="studentid">

        <label for="yid">院系:</label>
        <div class="dropdown">
            <select id="yid" name="yid" required>
                <option value="" disabled selected>选择一个院系</option>
                <option value="1">材料科学与工程学院</option>
                <option value="2">电子信息工程学院</option>
                <option value="3">自动化科学与电气工程学院</option>
                <option value="4">能源与动力工程学院</option>
                <option value="5">航空科学与工程学院</option>
                <option value="6">计算机学院</option>
                <option value="7">机械工程与自动化学院</option>
                <option value="8">经济管理学院</option>
                <option value="9">数学科学学院</option>
                <option value="10">生物医学与工程学院</option>
                <option value="11">人文社会科学学院</option>
                <option value="12">外国语学院</option>
                <!-- 其他院系选项依此类推 -->
            </select>
        </div>

        <!-- You can add more fields as needed -->

        <input type="submit" value="注册">
    </form>

    <p>
        <a href="${pageContext.request.contextPath}/page/login.jsp">返回登录界面</a>
    </p>

</body>
<script>
    function toggleDropdown() {
        var dropdown = document.getElementById("yid");
        dropdown.classList.toggle("show");
    }

    // 关闭下拉框，如果用户点击页面其他地方
    window.onclick = function (event) {
        if (!event.target.matches('.dropdown-btn')) {
            var dropdowns = document.getElementsByClassName("dropdown-content");
            for (var i = 0; i < dropdowns.length; i++) {
                var openDropdown = dropdowns[i];
                if (openDropdown.classList.contains('show')) {
                    openDropdown.classList.remove('show');
                }
            }
        }
    }
    document.getElementById('telephone').addEventListener('blur', function () {
        validateTelephone();
    });

    document.getElementById('password').addEventListener('blur', function () {
        validatePassword();
    });

    document.getElementById('confirmPassword').addEventListener('blur', function () {
        validateConfirmPassword();
    });

    // 针对其他字段需要相似的事件监听器

    function validateTelephone() {
        var telephoneInput = document.getElementById('telephone');
        var telephoneMsg = document.getElementById('telephoneMsg');

        // 您的验证逻辑
        // 例如，检查电话是否符合特定模式

        if (telephoneInput.value.match(/^(\d{11})$/)) {
            // 有效的电话
            telephoneMsg.innerHTML = '<span style="color: #4CAF50;">&#10004; 有效的电话</span>';
        } else {
            // 无效的电话
            telephoneMsg.innerHTML = '<span style="color: #FF0000;">&#10008; 无效的电话</span>';
        }
    }

    function validatePassword() {
        var passwordInput = document.getElementById('password');
        var passwordMsg = document.getElementById('passwordMsg');

        // 密码长度至少为6位
        if (passwordInput.value.length >= 6) {
            // 有效的密码
            passwordMsg.innerHTML = '<span style="color: #4CAF50;">&#10004; 有效的密码</span>';
        } else {
            // 无效的密码
            passwordMsg.innerHTML = '<span style="color: #FF0000;">&#10008; 密码长度至少为6位</span>';
        }
    }

    function validateConfirmPassword() {
        var passwordInput = document.getElementById('password');
        var confirmPasswordInput = document.getElementById('confirmPassword');
        var confirmPasswordMsg = document.getElementById('confirmPasswordMsg');

        // 确认密码与密码一致
        if (confirmPasswordInput.value === passwordInput.value) {
            // 有效的确认密码
            confirmPasswordMsg.innerHTML = '<span style="color: #4CAF50;">&#10004; 密码一致</span>';
        } else {
            // 无效的确认密码
            confirmPasswordMsg.innerHTML = '<span style="color: #FF0000;">&#10008; 密码不一致</span>';
        }
    }

    // 针对其他字段需要相似的验证函数
</script>
</html>
