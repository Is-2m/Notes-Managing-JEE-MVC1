<%@ page import="estm.dsic.models.User" %>
<%@ page import="estm.dsic.models.Note" %><%--
  Created by IntelliJ IDEA.
  User: is2m
  Date: 2/19/23
  Time: 8:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<%
    User inspectedUser = (User) session.getAttribute("inspectedUser");%>
<head>
    <title><%=inspectedUser.getName() %>'s Notes</title>
    <link href="<%=request.getContextPath()%>/styles/bootstrap.css" rel="stylesheet" type="text/css">

</head>
<body>
<%--<% inspectedUser = (User) session.getAttribute("inspectedUser");%>--%>

<%@include file="../Components/nav.jsp" %>
<% if (inspectedUser == null) {
    response.sendRedirect(request.getContextPath()+"/Admin/listAllUsers.jsp");
} else {%>

<div class="container w-100">
    <table class="table-bordered table table-striped table-dark">
        <thead>
        <tr align="center">
            <th>ID</th>
            <th class="w-25">Title</th>
            <th class="w-50">Content</th>
            <th class="w-25">Creation Date</th>
            <th colspan=" 2">Actions</th>
        </tr>
        </thead>

        <tbody>
        <% assert inspectedUser != null;
            if (inspectedUser.getNotes() != null) {
                for (Note n : inspectedUser.getNotes()) {%>

        <tr>
            <td><%=n.getId() %>
            </td>
            <td><%=n.getTitle() %>
            </td>
            <td><%=n.getContent() %>
            </td>
            <td><%=n.getCreationDate() %>
            </td>
            <td class="text-nowrap">
                <a class="btn btn-success"
                   href="<%=request.getContextPath() %>/NoteServlet?op=edit&note_id=<%=n.getId()%>">Edit</a>
                <a class="btn btn-danger"
                   href="<%=request.getContextPath() %>/NoteServlet?op=delete&self=no&note_id=<%=n.getId()%>">Delete</a>
            </td>
        </tr><%}}%>
        </tbody>
    </table>
</div>
<%}%>
</body>
</html>
