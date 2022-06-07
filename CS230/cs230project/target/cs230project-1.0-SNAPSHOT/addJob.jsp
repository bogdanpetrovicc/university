<%--
    Document   : addJob
    Created on : May 10, 2022, 1:21:15 PM
    Author     : BiG
--%>
<%@ page import="com.bogdan.cs230project.dao.CompanyDao" %>
<%@ page import="com.bogdan.cs230project.entity.Company" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="include/head.jsp"/>
    <title>MyBusiness | Create a Job</title>
    <style>
        .create-a-job {
            text-align: center;
        }

        .form-group {
            margin: 2em 0 !important;
        }
    </style>
</head>
<body>
<%
    CompanyDao companyDao = new CompanyDao();
    List<Company> companies = companyDao.findAll();
    request.setAttribute("companies", companies);
%>
<jsp:include page="/include/nav.jsp"/>
<div class="form-control">
    <div class="card-header">
        <h4>Add job:</h4>
    </div>
    <br>
    <div style="margin-right: 70px; margin-left: 70px">
        <form method="post" action="${pageContext.request.contextPath}/add-job">
            <div class="field">
                <label for="name" class="label">Name:</label>
                <div class="control">
                    <input id="name" name="name" class="input" type="text" placeholder="Please enter your job name">
                    <small id="nameHelp" class="form-text text-muted">This is your jobs name!</small>
                </div>
            </div>

            <div class="field">
                <label for="description" class="label">Description:</label>
                <div class="control">
                    <textarea id="description" name="description" class="textarea" placeholder="Textarea"></textarea>
                    <small id="descriptionHelp" class="form-text text-muted">This is your job description!</small>
                </div>
            </div>
            <div class="field">
                <label for="company" class="label">Company:</label>
                <div class="control">
                    <div class="select">
                        <select name="company" id="company" class="form-select">
                            <option value="" disabled selected>Select a company</option>
                            <c:forEach items="${companies}" var="company">
                                <option value="${company.name}">${company.name}</option>
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
