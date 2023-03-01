<%--
  Created by IntelliJ IDEA.
  User: is2m
  Date: 2/20/23
  Time: 4:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create New User</title>
    <link href="<%=request.getContextPath()%>/styles/bootstrap.css" rel="stylesheet" type="text/css">
    <script>
        function changeVisibility(id) {
            var txt = document.getElementById(id);
            if (txt.type == "text") {
                txt.type = "password";
            } else {
                txt.type = "text";
            }
        }
    </script>
</head>
<body>
<%@include file="../Components/nav.jsp" %>
<%
    if (currentUser != null || currentUser.isAdmin()) {
        User userToEdit = (User) session.getAttribute("userToEdit");
%>
<div class="jumbotron d-flex align-items-center min-vh-100 ">
    <div class="container w-50 p-5 m-auto border shadow-sm">

        <p class="h3 mb-4 text-center">Create Your New Note</p>
        <form action="<%=request.getContextPath()%>/UserServlet" method="post">
            <input type="hidden" name="userId" value="<%=userToEdit==null?-1:userToEdit.getId()%>">
            <div class="input-group m-3 ">
                <div class="input-group-prepend">
                    <div class="input-group-text">Name</div>
                </div>
                <input type="text" class="form-control" name="name"
                       placeholder="Name" value="<%=userToEdit==null?"":userToEdit.getName()%>" required="required">
            </div>
            <%if (userToEdit == null) {%>
            <div class="input-group m-3">
                <div class="input-group-prepend">
                    <div class="input-group-text">Email</div>
                </div>
                <input type="email" class="form-control" placeholder="Email"
                       value="" required="required" name="email">
            </div>
            <%}%>
            <div class="input-group m-3">
                <div class="input-group-prepend">
                    <div class="input-group-text">Password</div>
                </div>
                <input id="txtPass" type="password" class="form-control" placeholder="Password"
                       value="<%=userToEdit==null?"":userToEdit.getPassword()%>" required="required" name="password">

                <div class="input-group-append">
                    <div class="input-group-text pb-3 d-block">
                        <input type="checkbox" onclick="changeVisibility('txtPass')">
                    </div>
                </div>
            </div>
            <div class="input-group m-3">
                <div class="input-group-prepend">
                    <div class="input-group-text">Confirm Password</div>
                </div>
                <input id="txtPassConf" type="password" class="form-control" name="passConf"
                       placeholder="Re-type password"
                       value="<%=userToEdit==null?"":userToEdit.getPassword()%>" required="required">

                <div class="input-group-append">
                    <div class="input-group-text pb-3 d-block">
                        <input type="checkbox" onclick="changeVisibility('txtPassConf')">
                    </div>
                </div>
            </div>
            <% String error = (String) request.getParameter("error"); %>
            <% if (error != null) { %>
            <p>
            <div class="alert alert-danger" role="alert">
                <%= error %>
            </div>

            </p>
            <% } %>
            <input type="submit" class="btn btn-primary d-block mx-auto" value="Submit"/>

        </form>
    </div>
</div>

<% } %>
</body>
</html>
