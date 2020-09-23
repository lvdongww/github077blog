<%--
  Created by IntelliJ IDEA.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>修改密码</title>
</head>
<script src="/statics/js/jquery-3.4.1.js"></script>
<body style="background:url(/statics/img/微博背景.jpg)">
<center>
    <p>${username}你好,欢迎访问微博信息管理系统 &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<sapn><a href="login.jsp">注销</a></sapn>
    </p>
    <form action="/updpwd" method="post">
        <table width="100px" border="1px">
            <tr style="text-align: center">
                <td colspan="2">
                    <h1>修改密码</h1>
                </td>
            </tr>
            <tr style="text-align: center">
                <td>
                    <a>用户名</a>
                </td>
                <td>
                    <input type="text" value="${username}"/>
                </td>
            </tr>
            <tr style="text-align: center">
                <td>
                    <a>密码</a>
                </td>
                <td>
                    <input type="text" name="password" value="${pageInfo.password}"/>
                </td>
            </tr>
            <tr style="text-align: center">
                <td colspan="2">
                    <input type="submit" value="提交">
                    <input type="button" value="返回" onclick="fanhui()">
                </td>
            </tr>
        </table>
    </form>
</center>
<script type="text/javascript">
    $("form").submit(function () {
        var password = $("[name='password']").val();
        if (password == "") {
            alert("请填写用户密码")
            return false;
        }
        return true;
    })

    function fanhui() {
        location.href = "pwd.jsp";
    }
</script>
</body>
</html>
