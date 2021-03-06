<%--
    Document   : addUser
    Created on : May 10, 2022, 1:22:50 PM
    Author     : BiG
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.bogdan.cs230project.entity.User" %>
<%@ page import="com.bogdan.cs230project.dao.UserDao" %>
<%@ page import="com.bogdan.cs230project.dao.RoleDao" %>
<%@ page import="com.bogdan.cs230project.entity.Role" %>
<%@ page import="java.util.List" %>
<%@ page import="com.bogdan.cs230project.security.Security" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <jsp:include page="include/head.jsp"/>
    <title>MyBusiness | Add user</title>
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
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    String confPassword = request.getParameter("confPassword");
    String roleString = request.getParameter("role");
    String pwErr = "";
    RoleDao roleDao = new RoleDao();
    List<Role> roles = roleDao.findAll();
    request.setAttribute("roles", roles);

    if (request.getParameter("username") != null) {
        UserDao userDao = new UserDao();

        if (password.equals(confPassword)) {
            User user = new User();
            Role role = roleDao.findByName(roleString);

            user.setUsername(username);
            user.setPassword(password);
            user.setEmail(email);
            user.setRoleFk(role);

            userDao.create(user);
            session.setAttribute("newUsername", username);
        } else {
            pwErr = "Passwords do not match!";
        }
    }
%>
<jsp:include page="/include/nav.jsp"/>
<div class="form-control">
    <div class="card-header">
        <h4>Add user:</h4>
    </div>
    <br>
    <div style="margin-right: 70px; margin-left: 70px">
        <form method="post" action="addUser.jsp">
            <div class="field">
                <label for="username" class="label">Username:</label>
                <div class="control ">
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
                            <c:forEach items="${roles}" var="role">
                                <option value="${role.role}">${role.role}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </div>

            <div class="field is-grouped">
                <div class="control">
                    <input type="submit" class="button is-link" value="Submit"/>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>