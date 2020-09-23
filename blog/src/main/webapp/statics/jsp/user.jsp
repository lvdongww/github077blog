<%--
  Created by IntelliJ IDEA.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>用戶管理</title>
</head>
<body style="background:url(/statics/img/微博背景.jpg)">
<center>
    <p>${username}你好,欢迎访问微博信息管理系统 &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<sapn><a href="login.jsp">注销</a></sapn>
    </p>
    <a href="BG">微博管理</a>
    <a href="adduser.jsp">添加用户</a>
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
        <c:forEach items="${pageInfo.list}" var="user">
            <tr>
                <td>${user.username}</td>
                <td>${user.nickname}</td>
                <td>${user.mobile}</td>
                <td>${user.address}</td>
                <td><a href="US?prop=del&id=${user.id}">删除</a></td>
            </tr>
        </c:forEach>
    </table>
    <div>
        <a href="US?pageNum=${pageInfo.firstPage}">首页</a>
        <c:if test="${pageInfo.hasPreviousPage}">
            <a href="US?pageNum=${pageInfo.prePage}">上一页</a>
        </c:if>
        <c:forEach items="${pageInfo.navigatepageNums}" var="i">
            <a href="US?pageNum=${i}">${i}</a>
        </c:forEach>
        <c:if test="${pageInfo.hasNextPage}">
            <a href="US?pageNum=${pageInfo.nextPage}">下一页</a>
        </c:if>
        <a href="US?pageNum=${pageInfo.lastPage}">末页</a>
    </div>
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
</body>
</html>
