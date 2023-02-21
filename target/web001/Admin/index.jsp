<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Note Management</title>
    <link rel="stylesheet" href="../styles/bootstrap.css" type="text/css">
    <link rel="stylesheet" href="../styles/styles.css" type="text/css">
</head>
<body>
<%@include file="../Components/nav.jsp" %>
<% if (currentUser == null || !currentUser.isAdmin()) {
    if (response.isCommitted()) {
        request.getRequestDispatcher(request.getContextPath() + "/authServlet?op=logout").forward(request, response);
    } else {
        response.sendRedirect(request.getContextPath() + "/Auth/auth.jsp");
    }
} else { %>
<div id="gridy" class="container w-100 h-100 mt-5">
    <a href="createNote.jsp" class="text-decoration-none ">
        <div class="loader w-50 h-50 mx-auto">
            <div class="loader_cube loader_cube--color"></div>
            <div class="loader_cube loader_cube--glowing"></div>
            <p style="z-index: 10;" class="text-white h3 text-center black-outline">Create New Note</p>
        </div>
    </a>
    <a href="listAllNotes.jsp" class="text-decoration-none">
        <div class="loader w-50 h-50 mx-auto">
            <div class="loader_cube loader_cube--color"></div>
            <div class="loader_cube loader_cube--glowing"></div>
            <p style="z-index: 10;" class="text-white h3 text-center black-outline">Inspect My Notes</p>
        </div>
    </a>
    <a href="<%=request.getContextPath()%>/Admin/createUser.jsp" class="text-decoration-none">
        <div class="loader w-50 h-50 mx-auto">
            <div class="loader_cube loader_cube--color"></div>
            <div class="loader_cube loader_cube--glowing"></div>
            <p style="z-index: 10;" class="text-white h3 text-center black-outline">Create User</p>
        </div>
    </a>
    <a href="<%=request.getContextPath()%>/UserServlet" class="text-decoration-none">
        <div class="loader w-50 h-50 mx-auto">
            <div class="loader_cube loader_cube--color"></div>
            <div class="loader_cube loader_cube--glowing"></div>
            <p style="z-index: 10;" class="text-white h3 text-center black-outline">See All Users</p>
        </div>
    </a>


</div>
<%}%>
</body>
</html>
