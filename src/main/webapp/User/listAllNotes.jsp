<%@ page import="estm.dsic.models.Note" %>
<%@ page import="java.util.Random" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>All Notes</title>
    <link href="<%=request.getContextPath()%>/styles/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/styles/fontawesome-free-6.3.0-web/css/all.min.css" rel="stylesheet"
          type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/styles/styles.css" type="text/css">
</head>
<body>
<%@include file="../Components/nav.jsp" %>
<%! String[] colors = new String[]{"blue", "yellow", "green", "brown", "purple", "orange", "amber"}; %>
<%--<% if (currentUser != null) {%>--%>


<div class="container bootstrap snippets bootdeys ">
    <div class="row">

        <% if (currentUser!=null && currentUser.getNotes() != null) {
                for (Note n : currentUser.getNotes()) {%>
        <div class="col-md-4 col-sm-6 content-card">
            <div class="card-big-shadow">
                <div class="card card-just-text" data-background="color"
                     data-color="<%=colors[new Random().nextInt(7)] %>" data-radius="none">
                    <a class="text-decoration-none text-dark position-absolute mt-5" style="right: 10%;"
                       href="<%=request.getContextPath() %>/NoteServlet?op=delete&self=yes&note_id=<%=n.getId()%>">
                        <i class="fa-solid fa-lg fa-trash">
                        </i></a>
                    <div class="content">
                        <h6 class="category"><%=n.getCreationDate() %>
                        </h6>
                        <h4 class=" title">
                            <a class="text-decoration-none"
                               href="<%=request.getContextPath() %>/NoteServlet?op=edit&note_id=<%=n.getId()%>">
                                <%=n.getTitle() %>
                            </a></h4>
                        <p class="description"><%=n.getContent().length() < 130 ? n.getContent() : n.getContent().substring(0, 130) + "..." %>
                        </p>
                    </div>
                </div> <!-- end card -->
            </div>
        </div>
        </tr><%
            }
        }
    %>
    </div>
</div>

<%--<%}%>--%>
</body>
</html>