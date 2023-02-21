<%@ page import="estm.dsic.models.Note" %>
<%@ page import="estm.dsic.models.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Note Management</title>
    <link type="text/css" rel="stylesheet" href="styles/bootstrap.css"/>
</head>

<%--<jsp:useBean id="currentUser" class="estm.dsic.models.User" scope="session"/>--%>

<body class="">
<%
    User currentUser = (User) session.getAttribute("currentUser");
    if (currentUser == null) {
        response.sendRedirect(request.getContextPath()+"/Auth/auth.jsp");
    } else {
        if(currentUser.isAdmin()){
            response.sendRedirect(request.getContextPath()+"/Admin/index.jsp");
        }else{
            response.sendRedirect(request.getContextPath()+"/User/index.jsp");
        }
    }%>

</body>

</html>