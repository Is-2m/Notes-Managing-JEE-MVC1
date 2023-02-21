<%--
  Created by IntelliJ IDEA.
  User: is2m
  Date: 2/17/23
  Time: 8:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
    <link href="<%=request.getContextPath()%>/styles/bootstrap.css" rel="stylesheet" type="text/css">
</head>
<body>
<body class="">
<div class="jumbotron d-flex align-items-center min-vh-100">
    <div class="container w-50 m-auto shadow-lg p-5">
        <!-- Pills navs -->
        <ul class="nav nav-pills nav-justified mb-3" role="tablist">
            <li class="nav-item" role="presentation">
                <a class="nav-link" id="tab-login" data-mdb-toggle="pill"
                   href="<%=request.getContextPath()%>/Auth/auth.jsp" role="tab"
                   aria-controls="pills-login" aria-selected="false">Login</a>
            </li>
            <li class="nav-link active" role="presentation">
                <a class="nav-link text-white" id="tab-register" data-mdb-toggle="pill" role="tab"
                   aria-controls="pills-register" aria-selected="false">Register</a>
            </li>
        </ul>
        <!-- Pills navs -->

        <!-- Pills content -->
        <div class="tab-content">
            <div class="tab-pane fade show active" id="pills-login" role="tabpanel" aria-labelledby="tab-login">
                <form action="<%=request.getContextPath()%>/UserServlet" method="post">
                    <div class="form-outline mb-4">
                        <input type="text" aria-required="true" name="name" placeholder="Name" class="form-control"/>
                    </div>

                    <div class="form-outline mb-4">
                        <input type="email" aria-required="true" name="email" placeholder="Email" class="form-control"/>
                    </div>
                    <div class="form-outline mb-4">
                        <input type="password" aria-required="true" name="password" placeholder="Password"
                               class="form-control"/>
                    </div>
                    <div class="form-outline mb-4">
                        <input type="password" aria-required="true" name="confPass" placeholder="Confirm Password"
                               class="form-control"/>
                    </div>
                    <% String error = (String) request.getParameter("error"); %>
                    <% if (error != null) { %>
                    <p>
                    <div class="alert alert-danger" role="alert">
                        <%= error %>
                    </div>

                    </p>
                    <% } %>

                    <!-- Submit button -->
                    <div class="text-center">
                        <p>Already a member? <a href="<%=request.getContextPath()%>/Auth/auth.jsp">Sign In</a></p>
                    </div>
                    <button type="submit" class="btn btn-primary btn-block mb-3">Register</button>
                </form>
            </div>
            <div class="tab-pane fade" id="pills-register" role="tabpanel" aria-labelledby="tab-register">

            </div>
        </div>
        <!-- Pills content -->

    </div>
</div>
</body>
</body>
</html>
