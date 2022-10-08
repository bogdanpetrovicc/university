<%--
    Document   : addCompany
    Created on : May 10, 2022, 1:22:42 PM
    Author     : BiG
--%>
<%@ page import="com.bogdan.cs230project.entity.Company" %>
<%@ page import="com.bogdan.cs230project.dao.CompanyDao" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <jsp:include page="include/head.jsp"/>
    <title>MyBusiness | Add company</title>
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
    String name = request.getParameter("company-name");
    String address = request.getParameter("company-address");
    String pwErr = "";
    if (request.getParameter("company-name") != null) {
        Company company = new CompanyDao().findByName(name);
        if (company == null) {
            company = new Company();
            company.setName(name);
            company.setAddress(address);
            CompanyDao companyDao = new CompanyDao();
            companyDao.create(company);
        } else {
            pwErr = "Company already exists in database!";
        }
    }
%>
<jsp:include page="/include/nav.jsp"/>
<div class="form-control">
    <div class="card-header">
        <h4>Add company:</h4>
    </div>
    <br>
    <div style="margin-right: 70px; margin-left: 70px">
        <form method="post" action="addCompany.jsp">
            <div class="field">
                <label for="company-name" class="label">Name:</label>
                <div class="control">
                    <input id="company-name" name="company-name" class="input" type="text" placeholder="Text input">
                </div>
            </div>

            <div class="field">
                <label for="company-address" class="label">Address:</label>
                <div class="control">
                    <input id="company-address" name="company-address" class="input" type="text"
                           placeholder="Text input">
                </div>
            </div>

            <div class="field is-grouped">
                <span style="color: red"><%= pwErr %></span>
                <div class="control">
                    <input type="submit" class="button is-link" value="Submit"/>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>