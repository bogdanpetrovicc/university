<%--
    Document   : job
    Created on : May 10, 2022, 1:20:46 PM
    Author     : BiG
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.bogdan.cs230project.entity.Job" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <jsp:include page="include/head.jsp"/>
    <title>MyBusiness | Subscribed jobs</title>
    <style>
        .card-body {
            color: #111111;
        }

        section {
            text-align: center;
            margin-left: 120px;
            margin-right: 120px;
        }
    </style>
</head>
<body>
<%@include file="include/nav.jsp" %>
<%
    List<Job> jobs = user.getJobs();
    request.setAttribute("jobs", jobs);
%>
<main>
    <section>
        <% if (!jobs.isEmpty()) {%>
        <c:forEach items="${jobs}" var="job" varStatus="loop">
<%--            <form method="get" action="${pageContext.request.contextPath}/subscribed-job">--%>
                <div style="margin-right: 70px; margin-left: 70px" class="card">
                    <div class="card-content">
                        <div class="content">
                            <div class="card-body">
                                <h4 class="card-title">
                                    Radno mesto: ${job.name}
                                </h4>
                                <h5 class="card-title">
                                    Ime kompanije: ${job.company.name}
                                </h5>
                                <div class="firm-description" style="overflow: auto">
                                    <p class="card-text">
                                        Opis posla: ${job.description}
                                    </p>
                                </div>
                            </div>
                            <input type="hidden" name="id-job" value="${job.jobId}"/>
                        </div>
                    </div>
                </div>
<%--            </form>--%>
        </c:forEach>
        <% } else {%>
        <p>There are no jobs in database!</p>
        <% } %>
    </section>
</main>
<script>
    getCategoryIndex = (index) => {
        return index;
    };
</script>
</body>
</html>