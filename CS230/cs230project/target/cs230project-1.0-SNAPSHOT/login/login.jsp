<%@ page import="com.bogdan.cs230project.entity.User" %>
<%@ page import="com.bogdan.cs230project.dao.UserDao" %><%--
    Document   : login
    Created on : May 10, 2022, 1:11:49 PM
    Author     : BiG
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="<%=session.getAttribute("lang")%>">
<head>
    <jsp:include page="/include/head.jsp"/>
    <title>MyBusiness | Login</title>
    <style>
        body, html {
            background: whitesmoke;
            margin-left: 70px;
            margin-right: 70px;
        }
    </style>
</head>
<body>
<%
    String pwErr = "";
    String username = request.getParameter("username");
    if (request.getParameter("username") != null || request.getParameter("password") != null) {
        User user = new UserDao().findByUsername(username);
        if (user == null) {
            pwErr = "You must fill every field!";
        }
    }

%>
<div class="form-control">
    <div style="margin-right: 70px; margin-left: 70px">
        <a class="button" role="button" href="${pageContext.request.contextPath}/index.jsp">Home</a>
    <hr>
    </div>
    <br>
    <h2 style="text-align: center">Log in</h2>
    <br>
    <div style="margin-right: 70px; margin-left: 70px">
        <form method="post" action="${pageContext.request.contextPath}/login">
            <div class="field">
                <label for="username" class="label">Username:</label>
                <div class="control">
                    <input class="input is-success" id="username" name="username" type="text"
                           placeholder="Text input">
                    <span class="icon is-small is-left">
      <i class="fas fa-user"></i>
    </span>
                    <span class="icon is-small is-right">
      <i class="fas fa-check"></i>
    </span>
                </div>
            </div>
            <div class="field">
                <label for="password" class="label">Password</label>
                <div class="control">
                    <input  id="password" name="password" class="input is-success" type="text" placeholder="Text input">
                    <span style="color: green"><%= pwErr %></span>
                </div>
            </div>

            <div class="field is-grouped">
                <div class="control">
                    <input type="submit" class="button is-link text-center" value="Log in"/>
                </div>
            </div>
            <a class="button is-link" href="register.jsp" role="button">Register here</a>
        </form>
    </div>
</div>
</body>
</html>