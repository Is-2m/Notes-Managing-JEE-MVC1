<%@ page import="estm.dsic.models.Note" %>
<%@ page import="java.util.Enumeration" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add New Note</title>
    <link href="<%=request.getContextPath()%>/styles/bootstrap.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@include file="../Components/nav.jsp" %>
<%
    Note note = (Note) session.getAttribute("note");
//    if (currentUser == null) response.sendRedirect(request.getContextPath() + "/Auth/auth.jsp");
//    else {
%>
<div class="jumbotron d-flex align-items-center min-vh-100 ">
    <div class="container w-50 p-5 m-auto border shadow-sm">

        <p class="h3 mb-4 text-center">Create Your New Note</p>
        <form method="post" action="<%=request.getContextPath() %>/NoteServlet">
            <input type="hidden" name="id" value="<%=note==null?-1:note.getId() %>">
            <input type="hidden" name="mode" value="<%=note==null?-1:note.getId() %>">
            <div class="mb-3">
                <input type="title" class="form-control" name="title" placeholder="Note's Title"
                       value="<%=note==null?"":note.getTitle() %>">
            </div>
            <div class="mb-3">
                    <textarea class="form-control" placeholder="Note's Content" name="content" id="" cols="30"
                              rows="10"><%=note == null ? "" : note.getContent() %></textarea>
            </div>
            <% String error = (String) request.getAttribute("error"); %>
            <% if (error != null) { %>
            <p>
            <div class="alert alert-danger" role="alert">
                <%= error %>
            </div>

            </p>
            <% } %>

            <button type="submit" class="btn btn-primary ">Submit</button>
        </form>

    </div>
</div>

</body>
</html>
<%--<%}%>--%>