<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: is2m
  Date: 2/19/23
  Time: 4:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Manage Users</title>
    <link href="<%=request.getContextPath()%>/styles/bootstrap.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@include file="../Components/nav.jsp" %>
<% ArrayList<User> lst = (ArrayList<User>) session.getAttribute("users"); %>;
<div class="container">

    <table class="table-bordered table table-striped table-dark">
        <thead>
        <tr align="center">
            <th>Id</th>
            <th>Name</th>
            <th>Email</th>
            <th>Actions</th>
        </tr>
        </thead>
        <% if (lst != null && !lst.isEmpty()) {
            for (User u : lst) {%>
        <tbody>
        <tr align="center">
            <td><%=u.getId()%>
            </td>
            <td><%=u.getName()%>
            </td>
            <td><%=u.getEmail()%>
            </td>
            <td><a class="btn btn-success"
                   href="<%=request.getContextPath()%>/UserServlet?op=edit&userId=<%=u.getId()%>">Edit</a>
                <a class="btn btn-danger"
                   href="<%=request.getContextPath()%>/UserServlet?op=delete&userId=<%=u.getId()%>">Delete</a>
                <a class="btn btn-warning" href="<%=request.getContextPath()%>/UserServlet?op=viewNotes&userId=<%=u.getId()%>">View Notes</a>
            </td>
        </tr>
        </tbody>
        <%
                }
            }
        %>
    </table>
</div>

</body>
</html>
