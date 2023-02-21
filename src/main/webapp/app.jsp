<%@ page import="estm.dsic.models.User" %><%--
  Created by IntelliJ IDEA.
  User: is2m
  Date: 2/15/23
  Time: 4:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Welcome Page</title>
</head>
<body>
<% User currentUser = (User) session.getAttribute("currentUser"); %>
<center>
    <h3>Welcome <%= currentUser.getName() %> </h3>
</center>
</body>
</html>
