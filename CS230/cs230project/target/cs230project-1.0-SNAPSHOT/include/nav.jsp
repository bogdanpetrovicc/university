<%--
    Document   : nav
    Created on : May 10, 2022, 1:21:39 PM
    Author     : BiG
--%>
<%@ page import="com.bogdan.cs230project.entity.User" %>
<%@ page import="com.bogdan.cs230project.dao.UserDao" %>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <title>MyBusiness</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto&display=swap');
        html, body {
            font-family: 'Roboto', sans-serif;
        }
    </style>
</head>
<body>
<%
    String username = (String) session.getAttribute("username");
    Integer id = (Integer) session.getAttribute("id");
    boolean loggedIn = username != null && id != null;
    User user = new UserDao().findByUsername(username);
%>
<nav style="background-color: rgba(0, 0, 0, 0.2);" class="navbar" role="navigation" aria-label="main navigation">
    <div id="navbarBasicExample" class="navbar-menu">
        <div class="navbar-end">
            <div class="navbar-item">
                <div class="buttons">
                    <% if (!loggedIn) {%>
                    <a href="login/login.jsp" class="button is-light">Log in</a>
                    <%}%>
                    <%if (loggedIn && user.getRoleFk().getRole().equals("Employer")) {%>
                    <a href="index.jsp" class="button is-light">Home</a>
                    <a href="addJob.jsp" class="button is-light">Create a Job</a>
                    <a href="${pageContext.request.contextPath}/logout" class="button is-light">Logout</a>
                    <%}%>
                    <%if (loggedIn && user.getRoleFk().getRole().equals("Staff")) {%>
                    <a href="index.jsp" class="button is-light">Home</a>
                    <a href="job.jsp" class="button is-light">Find Jobs</a>
                    <a href="allSubscribedJobs.jsp" class="button is-light">Your Jobs</a>
                    <a href="${pageContext.request.contextPath}/logout" class="button is-light">Logout</a>
                    <%}%>
                    <%if (loggedIn && user.getRoleFk().getRole().equals("Admin")) {%>
                    <a href="index.jsp" class="button is-light">Home</a>
                    <a href="addUser.jsp" class="button is-light">Add user</a>
                    <a href="addCompany.jsp" class="button is-light">Add company</a>
                    <a href="${pageContext.request.contextPath}/logout" class="button is-light">Logout</a>
                    <%}%>
                </div>
            </div>
        </div>
    </div>
</nav>
</body>
</html>

