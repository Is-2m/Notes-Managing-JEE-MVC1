<%@ page import="estm.dsic.models.User" %>
<% User currentUser = (User) session.getAttribute("currentUser");
    if (currentUser == null) {
            request.getRequestDispatcher("/authServlet?op=logout").forward(request, response);

    } else {
%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark px-5 mb-3  ">
    <div class="container-fluid">
        <a class="navbar-brand"
           href="<%= request.getContextPath()+(currentUser.isAdmin()?"/Admin":"/User")%>/index.jsp">Welcome <%=currentUser.getName()%>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 w-100">
                <li class="nav-item">
                    <a class="nav-link active" onclick="" aria-current="page" href="createNote.jsp">New Note</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" onclick="" aria-current="page" href="listAllNotes.jsp">My Notes</a>
                </li>
                <% if (currentUser.isAdmin()) {%>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page"
                       href="<%=request.getContextPath()%>/Admin/createUser.jsp">Create
                        User</a>
                </li>
                <li class="nav-item"><a class="nav-link active" onclick="" aria-current="page"
                                        href="<%=request.getContextPath()%>/UserServlet">All Users</a>
                </li>
                <%
                    }
                    int count = session.getAttribute("counter") == null ? 0 : (Integer) session.getAttribute("counter");
                    if (count > 0) {
                %>
                <li class="nav-item align-items-center ms-3  p-2 rounded-3 bg-warning ">
                    <span class="text-center ">Counter: <%=count%></span>
                </li>
                <%}%>
                <li class="nav-item ms-auto bg-warning rounded">
                    <a class="nav-link active text-dark" onclick="" aria-current="page" href="../authServlet?op=logout">Log
                        Out</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<%}%>