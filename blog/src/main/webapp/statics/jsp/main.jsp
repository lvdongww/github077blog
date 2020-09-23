<%--
  Created by IntelliJ IDEA.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>微博管理系统</title>
</head>
<body style="background:url(/statics/img/微博背景.jpg)">
<center>
    <p>${username},欢迎进入微博管理系统 &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<sapn><a href="/">注销</a></sapn>
    </p>
    <a href="/statics/jsp/user.jsp">用户管理</a>
    <a href="/statics/jsp/add.jsp">发表微博</a>
    <table border="1px">
        <tr>
            <td>微博内容</td>
            <td>发布时间</td>
            <td>操作</td>
        </tr>
        <c:forEach items="${pageInfo.list}" var="user">
            <tr>
                <td>${user.content}</td>
                <td>${user.publishtime}</td>
                <td><a href="BG?prop=del&id=${user.id}">删除</a></td>
            </tr>
        </c:forEach>
    </table>
    <div>
        <a href="BG?pageNum=${pageInfo.firstPage}">首页</a>
        <c:if test="${pageInfo.hasPreviousPage}">
            <a href="BG?pageNum=${pageInfo.prePage}">上一页</a>
        </c:if>
        <c:forEach items="${pageInfo.navigatepageNums}" var="i">
            <a href="BG?pageNum=${i}">${i}</a>
        </c:forEach>
        <c:if test="${pageInfo.hasNextPage}">
            <a href="BG?pageNum=${pageInfo.nextPage}">下一页</a>
        </c:if>
        <a href="BG?pageNum=${pageInfo.lastPage}">末页</a>
    </div>
    <p style="margin-left: 220px;">
        <c:if test="${sessionScope.flag==true}">
        <span style="color: red">
            添加成功!
        </span>
        </c:if>
        <c:if test="${sessionScope.flag==false}">
        <span style="color: black">
            添加失败!
        </span>
        </c:if>
    </p>
</center>
</body>
</html>
