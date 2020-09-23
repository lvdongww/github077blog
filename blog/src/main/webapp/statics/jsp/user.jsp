<%--
  Created by IntelliJ IDEA.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>用戶管理</title>
</head>
<script src="/statics/js/jquery-3.4.1.js"></script>
<body style="background:url(/statics/img/微博背景.jpg)">
<center>
    <p>${username}你好,欢迎访问微博信息管理系统 &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<sapn><a href="/statics/jsp/login.jsp">注销</a></sapn>
    </p>
    <a href="BG">微博管理</a>
    <a href="/statics/jsp/adduser.jsp">添加用户</a>
    <table border="1px">
        <tr>
            <td colspan="5" style="text-align: center">微博首页
        </tr>
        <tr>
            <td>用户名</td>
            <td>昵称</td>
            <td>手机</td>
            <td>地址</td>
            <td>操作</td>
        </tr>
        <c:forEach items="${pageInfo}" var="user">
            <tr>
                <td>${user.username}</td>
                <td>${user.nickname}</td>
                <td>${user.mobile}</td>
                <td>${user.address}</td>
                <td><a href="/deluser/${user.id}" onclick="del()">删除</a></td>
            </tr>
        </c:forEach>
    </table>
    <p style="color: red">${msg}</p>
    <p style="margin-left: 220px;">
        <c:if test="${sessionScope.flag1==true}">
        <span style="color: red">
            添加成功!
        </span>
        </c:if>
        <c:if test="${sessionScope.flag1==false}">
        <span style="color: red">
            添加失败!
        </span>
        </c:if>
    </p>
</center>
<script type="text/javascript">
    function del() {
        var xxx = "确定删除该用户吗?";
        if (confirm(xxx) == true) {
            return true;
        } else {
            return false;
        }
    }
</script>
</body>
</html>
