<%--
    Document   : register
    Created on : May 10, 2022, 1:11:58 PM
    Author     : BiG
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.bogdan.cs230project.dao.RoleDao" %>
<%@ page import="com.bogdan.cs230project.entity.Role" %>
<%@ page import="com.bogdan.cs230project.entity.User" %>
<%@ page import="com.bogdan.cs230project.dao.UserDao" %>
<%@ page import="com.bogdan.cs230project.security.Security" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="<%=session.getAttribute("lang")%>">
<head>
    <jsp:include page="/include/head.jsp"/>
    <title>MyBusiness | Register</title>
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
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    String confPassword = request.getParameter("confPassword");
    String roleName = request.getParameter("role");
    RoleDao roleDao = new RoleDao();
    List<Role> roles = roleDao.findAll();
    request.setAttribute("roles", roles);

    if (request.getParameter("username") != null) {
        UserDao userDao = new UserDao();
        if (password.equals(confPassword)) {
            User user = new User();
            Role role = roleDao.findByName(roleName);
            user.setUsername(username);
            user.setPassword(password);
            user.setEmail(email);
            user.setRoleFk(role);
            userDao.create(user);
            session.setAttribute("newUsername", username);
            request.getRequestDispatcher("/login/login.jsp").forward(request, response);
        } else {
            pwErr = "Passwords do not match!";
            System.out.println(pwErr);
        }
    }
%>
<div class="form-control">
    <div style="margin-right: 70px; margin-left: 70px">
        <a class="button" role="button" href="${pageContext.request.contextPath}/index.jsp">Home</a>
        <hr>
    </div>
    <br>
    <h2 style="text-align: center">Register</h2>
    <br>
    <div style="margin-right: 70px; margin-left: 70px">
        <form method="post" action="register.jsp">
            <div class="field">
                <label for="username" class="label">Username:</label>
                <div class="control">
                    <input class="input is-success" id="username" name="username" type="text" placeholder="Text input">
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
                    <input id="password" name="password" class="input" type="text" placeholder="Text input">
                </div>
            </div>

            <div class="field">
                <label for="confPassword" class="label">Confirm password:</label>
                <div class="control">
                    <input id="confPassword" name="confPassword" class="input" type="text" placeholder="Text input">
                    <span style="color: red"><%= pwErr%></span>
                </div>
            </div>

            <div class="field">
                <label for="email" class="label">Email</label>
                <div class="control">
                    <input class="input is-danger" id="email" name="email" type="email" placeholder="Email input">
                    <span class="icon is-small is-left">
      <i class="fas fa-envelope"></i>
    </span>
                    <span class="icon is-small is-right">
      <i class="fas fa-exclamation-triangle"></i>
    </span>
                </div>
            </div>
            <div class="field">
                <label for="role" class="label">Role</label>
                <div class="control">
                    <div class="select">
                        <select name="role" id="role" class="form-select">
                            <option value="" disabled selected>Select a role</option>
                                <option value="Staff">Staff</option>
                                <option value="Employer">Employer</option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="field is-grouped">
                <div class="control">
                    <input type="submit" class="button is-link" value="Register"/>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>

