<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Company Dashboard</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/companyDashboard.css" />
    <style>
        .button {
            display: inline-block;
            padding: 8px 12px;
            margin: 5px;
            text-decoration: none;
            color: white;
            font-weight: bold;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            text-align: center;
            min-width: 80px; /* Taille uniforme des boutons */
        }

        .update-button {
            background-color: #33b5ff; /* Bleu foncé (marine) */
        }

        .delete-button {
            background-color: #ff4c33;
        }

        .button:hover {
            opacity: 0.8;
        }

        /* Centrer les boutons dans la colonne Actions */
        .actions-column {
            text-align: center; /* Centre le contenu horizontalement */
        }

        /* Aligner les éléments sur la même ligne */
        .container-header {
            display: flex;
            justify-content: space-between; /* Espace entre le texte et le bouton */
            align-items: center; /* Aligne verticalement le texte et le bouton */
        }

        .container-header p {
            margin: 0; /* Supprime les marges autour du texte */
        }

        .button-container {
            text-align: right; /* Aligne le bouton à droite */
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Company Dashboard</h2>
        
        <div class="container-header">
            <p>Welcome, <strong>${sessionScope.user.username}</strong>.</p>
            <div class="button-container">
                <a href="${pageContext.request.contextPath}/addOffer" class="button">Add New Offer</a>
            </div>
        </div>

        <c:if test="${not empty sessionScope.message}">
            <p class="success">${sessionScope.message}</p>
            <c:remove var="message" scope="session" />
        </c:if>
        <c:if test="${not empty sessionScope.errorMessage}">
            <p class="error">${sessionScope.errorMessage}</p>
            <c:remove var="errorMessage" scope="session" />
        </c:if>
        
        <c:if test="${not empty companyOffers}">
            <table border="1" width="100%" cellpadding="5" cellspacing="0">
                <thead>
                    <tr>
                        <th>Route</th>
                        <th>Departure</th>
                        <th>Arrival</th>
                        <th>Period</th>
                        <th>Description</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="offer" items="${companyOffers}">
                        <tr>
                            <td>${offer.departureCity} to ${offer.arrivalCity}</td>
                            <td>${offer.departureTime}</td>
                            <td>${offer.arrivalTime}</td>
                            <td>${offer.startDate} - ${offer.endDate}</td>
                            <td>${offer.description}</td>
                            <td class="actions-column">
                                <a href="${pageContext.request.contextPath}/updateOffer?offerId=${offer.id}" class="button update-button">Update</a>
                                <a href="${pageContext.request.contextPath}/deleteOffer?offerId=${offer.id}" 
                                   class="button delete-button"
                                   onclick="return confirm('Are you sure you want to delete this offer?');">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        <c:if test="${empty companyOffers}">
            <p>You have not provided any offers yet.</p>
        </c:if>
    </div>
</body>
</html>
