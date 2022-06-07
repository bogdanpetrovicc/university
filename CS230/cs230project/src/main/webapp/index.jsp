<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="include/head.jsp"/>
    <title>MyBusiness | HomePage</title>
    <style>
        .name {
            color: limegreen;
        }

        .main-page {
            position: relative;
            width: 100%;
            height: 100%;
        }

        .main-page .contect-card {
            position: relative;
            text-align: center;
            margin-top: 10em;
        }

        .more-info {
            position: relative;
            display: flex;
            margin-top: 18em;
        }

        .more-info p {
            font-size: 15px;
        }
    </style>
</head>
<body>
<%@include file="include/nav.jsp" %>
<main class="main-page">
    <div class="contect-card">
        <% if (loggedIn && user.getRoleFk().getRole().equals("Staff")) {%>
        <h3>Welcome to MyBusiness</h3>
        <h2>Greetings <span class="name">
            <%=user.getUsername()%></span>!</h2>
        <div class="para">
            <p style="font-size: 20px;">See all jobs <a href="job.jsp"
                                                        style="text-decoration: none; color: darkorange;">here!</a>.</p>
        </div>
        <% } %>
        <% if (loggedIn && user.getRoleFk().getRole().equals("Admin")) {%>
        <h3>Welcome to MyBusiness</h3>
        <h2>Greetings <span class="name"><%=user.getUsername()%></span>!</h2>
        <div class="para">
            <p style="font-size: 20px;">Add a new user <a href="addUser.jsp"
                                                          style="text-decoration: none; color: darkorange;">here!</a>.
            </p>
            <p style="font-size: 20px;">Add a new firm <a href="addCompany.jsp"
                                                          style="text-decoration: none; color: darkorange;">here!</a>.
            </p>
        </div>
        <% } %>
        <% if (loggedIn && user.getRoleFk().getRole().equals("Employer")) {%>
        <h3>Welcome to MyBusiness</h3>
        <h2>Greetings <span class="name">
            <%=user.getUsername()%>
        </span>!</h2>
        <div class="para">
            <p style="font-size: 20px;">Create a new job <a href="addJob.jsp"
                                                            style="text-decoration: none; color: darkorange;">here!</a>.
            </p>
        </div>
        <% } %>
        <% if (!loggedIn) {%>
        <h2>Welcome to MyBusiness</h2>
        <h3>Greetings, stranger!</h3>
        <div class="para">
            <p style="font-size: 20px;">You have to log in to continue to the site!</p>
        </div>
        <% } %>
    </div>
    <div class="more-info">

    </div>
    <footer class="bg-light text-center text-md-start">
        <!-- Copyright -->
        <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
            © 2022 Copyright<p class="text-dark">bogdan.petrovic.4382@metropolitan.ac.rs</p>
        </div>
        <!-- Copyright -->
    </footer>
</main>
</body>
</html>