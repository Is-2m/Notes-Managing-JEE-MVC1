<%@ page import="estm.dsic.models.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In</title>
    <link href="<%=request.getContextPath()%>/styles/bootstrap.css" rel="stylesheet" type="text/css">
</head>

<body class="">
<%
    User currentUser = (User) session.getAttribute("currentUser");
    if (currentUser != null) {
        response.sendRedirect(request.getContextPath() + (currentUser.isAdmin() ? "Admin" : "User") + "/index.jsp");
    } else {%>
<div class="jumbotron d-flex align-items-center min-vh-100">
    <div class="container w-50 m-auto shadow-lg p-5">
        <!-- Pills navs -->
        <ul class="nav nav-pills nav-justified mb-3" id="ex1" role="tablist">
            <li class="nav-item" role="presentation">
                <a class="nav-link active" id="tab-login" aria-required="true" data-mdb-toggle="pill"
                   href="#pills-login" role="tab"
                   aria-controls="pills-login" aria-selected="true">Login</a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" id="tab-register" data-mdb-toggle="pill" aria-required="true"
                   href="<%=request.getContextPath()%>/Auth/register.jsp" role="tab"
                   aria-controls="pills-register" aria-selected="false">Register</a>
            </li>
        </ul>
        <!-- Pills navs -->

        <!-- Pills content -->
        <div class="tab-content">
            <div class="tab-pane fade show active" id="pills-login" role="tabpanel" aria-labelledby="tab-login">
                <form method="post" action="<%=request.getContextPath()%>/authServlet">

                    <div class="form-outline mb-4">
                        <input type="email" id="loginName" name="email" placeholder="Email" class="form-control"/>
                    </div>

                    <div class="form-outline mb-4">
                        <input type="password" id="loginPassword" name="password" placeholder="Password"
                               class="form-control"/>
                    </div>
                    <% String error = (String) request.getAttribute("error"); %>
                    <% if (error != null) { %>
                    <p>
                    <div class="alert alert-danger" role="alert">
                        <%= error %>
                    </div>

                    </p>
                    <% } %>

                    <button type="submit" class="btn btn-primary btn-block mb-4">Sign in</button>

                    <div class="text-center">
                        <p>Not a member? <a href="<%=request.getContextPath()%>/Auth/register.jsp">Register</a></p>
                    </div>
                </form>
            </div>
        </div>
        <!-- Pills content -->

    </div>
</div>
<% }%>
</body>

</html>