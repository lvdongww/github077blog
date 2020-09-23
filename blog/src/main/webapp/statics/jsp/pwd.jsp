<%--
  Created by IntelliJ IDEA.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>修改密码</title>
</head>
<body style="background:url(/statics/img/微博背景.jpg)">
<center>
    <p>${username}你好,欢迎访问微博信息管理系统 &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<sapn><a href="/statics/jsp/login.jsp">注销</a></sapn>
    </p>
    <table border="1px">
        <tr>
            <td colspan="5" style="text-align: center">微博首页
        </tr>
        <tr>
            <td>用户名</td>
            <td>密码</td>
            <td>操作</td>
        </tr>
        <c:forEach items="${pageInfo}" var="user">
            <tr>
                <td>${user.username}</td>
                <td>${user.password}</td>
                <td><a href="/toupdpwd">修改</a></td>
            </tr>
        </c:forEach>
        <p style="color: red">${msg}</p>
    </table>
</center>
</body>
</html>
