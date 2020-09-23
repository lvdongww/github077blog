<%--
  Created by IntelliJ IDEA.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加用户</title>
</head>
<body style="background:url(/statics/img/微博背景.jpg)">
<center>
    <a href="US">返回</a>
    <form action="US?prop=add" method="post">
        <p>用户名:<input type="text" name="username"></p>
        <p>密码:<input type="text" name="password"></p>
        <p>昵称:<input type="text" name="nickname"></p>
        <p>年龄:<input type="text" name="age"></p>
        <p>性别:
            <select name="sex">
                <option value="0">男</option>
                <option value="1">女</option>
            </select>
        </p>
        <p>手机:<input type="text" name="mobile"></p>
        <p>地址:<input type="text" name="address"></p>
        <p>头像:<input type="text" name="picpath"></p>
        <p><input type="submit" value="添加"></p>
    </form>
</center>
</body>
</html>
