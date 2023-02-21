<%@ page import="estm.dsic.models.Note" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>All Notes</title>
    <link href="<%=request.getContextPath()%>/styles/bootstrap.css" rel="stylesheet" type="text/css">
<%--    <link href="styles/bootstrap.css" rel="stylesheet" type="text/css">--%>
</head>
<body>
<%@include file="../Components/nav.jsp" %>
<% if (currentUser == null) {
//    request.getRequestDispatcher(request.getContextPath()+"/authServlet?op=logout").forward(request,response);
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
        <% assert currentUser != null;
            if (currentUser.getNotes() != null) {
                for (Note n : currentUser.getNotes()) {%>

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
                   href="<%=request.getContextPath() %>/NoteServlet?op=delete&note_id=<%=n.getId()%>">Delete</a>
            </td>
        </tr><%}}%>
        </tbody>
    </table>
</div>
<%}%>
</body>
</html>