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

        /*.main-page*/
        .contect-card {
            position: relative;
            text-align: center;
            margin-top: 10em;
        }

        .more-info {
            position: relative;
            /*display: flex;*/
            margin-left: 150px;
            margin-right: 150px;
            margin-top: 18em;
            text-wrap: normal;
            font-size: 16px;
        }

        footer {
            min-height: 5px;
        }
    </style>
</head>
<body>
<%@include file="include/nav.jsp" %>
<main class="main-page">
<div class="contect-card">
    <% if (loggedIn && user.getRoleFk().getRole().equals("Staff")) {%>
    <h2>Welcome to MyBusiness</h2>
    <h3>Greetings <span class="name">
            <%=user.getUsername()%></span>!</h3>
    <div class="para">
        <p style="font-size: 20px;">See all jobs <a href="job.jsp"
                                                    style="text-decoration: none; color: darkorange;">here!</a>.</p>
    </div>
    <% } %>
    <% if (loggedIn && user.getRoleFk().getRole().equals("Admin")) {%>
    <h2>Welcome to MyBusiness</h2>
    <h3>Greetings <span class="name"><%=user.getUsername()%></span>!</h3>
    <div class="para">
        <p style="font-size: 20px;">Add a new user <a href="addUser.jsp"
                                                      style="text-decoration: none; color: darkorange;">here!</a>.
        </p>
        <p style="font-size: 20px;">Add a new company <a href="addCompany.jsp"
                                                      style="text-decoration: none; color: darkorange;">here!</a>.
        </p>
    </div>
    <% } %>
    <% if (loggedIn && user.getRoleFk().getRole().equals("Employer")) {%>
    <h2>Welcome to MyBusiness</h2>
    <h3>Greetings <span class="name">
            <%=user.getUsername()%>
        </span>!</h3>
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
    The presence of your company on MyBusiness is one of the most important ranking factors for local search engine
    optimization (SEO).
    With MyBusiness you define your appearance in Google Search and on Google Maps.
    Additionally, you need MyBusiness if you want to use location extensions in Google Ads.
    If you already have a MyBusiness profile, you are on track. If you have not, you should catch up now by
    following our tutorial to create a MyBusiness Account.
    <ul style="text-align: center">
        <p>Google uses the following factors to define the local ranking position of your company:</p>
        <li>1. Relevance of listing</li>
        <li>2. Prominence of company</li>
        <li>3. Distance between user and company</li>
    </ul>
</div>
</main>
<footer class="bg-light text-center">
    <!-- Copyright -->
    <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
        © 2022 Copyright<p class="text-dark">bogdan.petrovic.4382@metropolitan.ac.rs</p>
    </div>
    <!-- Copyright -->
</footer>

</body>
</html>