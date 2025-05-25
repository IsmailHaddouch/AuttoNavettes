<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<html>
<head>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/css/header.css" />
</head>

<body>
    <div class="nav">
        <!-- Add logo image on the left -->
        <div class="logo">
            <img src="${pageContext.request.contextPath}/images/logo.png" alt="Logo" />
        </div>
        <div class="menu">
            <c:if test="${not empty sessionScope.user}">
                <c:choose>
                    <c:when test="${sessionScope.user.role eq 'COMPANY'}">
                        <a href="${pageContext.request.contextPath}/companyDashboard">Dashboard</a>
                        <a href="${pageContext.request.contextPath}/profile">Profile</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/offers">Offers</a>
                        <a href="${pageContext.request.contextPath}/profile">Profile</a>
                    </c:otherwise>
                </c:choose>
                <a href="${pageContext.request.contextPath}/logout">Logout</a>
            </c:if>
            <c:if test="${empty sessionScope.user}">
                <a href="${pageContext.request.contextPath}/offers">Offers</a>
                <a href="${pageContext.request.contextPath}/jsp/login.jsp">Login</a>
                <a href="${pageContext.request.contextPath}/jsp/register.jsp">Register</a>
            </c:if>
        </div>
    </div>
</body>
</html>
