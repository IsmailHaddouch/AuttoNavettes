<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<html>
<head>
    <title>Your Profile</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/profile.css" />
    
    <style>
        /* Style général du formulaire */
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
        }

        label {
            display: block;
            font-size: 14px;
            font-weight: bold;
            margin: 10px 0 5px;
            color: #555;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            background-color: #fff;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #33b5ff;
            outline: none;
        }

        /* Style pour les zones de texte */
        input[type="text"],
        input[type="password"] {
            background-color: #f4f8fd;  /* Light blue background */
            color: #333;
        }

        /* Bouton de soumission */
        input[type="submit"] {
            background-color: #320fbf; /* Couleur bleu vif */
            color: white;
            font-weight: bold;
            border: none;
            padding: 12px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            text-align: center;
            display: inline-block;
            width: 100%;
        }

        input[type="submit"]:hover {
            background-color: #2800a6; /* Couleur plus foncée au survol */
        }

        /* Gestion des marges pour améliorer l'apparence générale */
        .container form {
            width: 100%;
            max-width: 600px;
            margin: 0 auto;
        }

        .container form input {
            margin-bottom: 20px;
        }

        .success {
            color: #28a745;
            font-weight: bold;
            text-align: center;
        }

        .error {
            color: #ff4c33;
            font-weight: bold;
            text-align: center;
        }

        p {
            text-align: center;
            margin-top: 15px;
        }

        a {
            color: #33b5ff;
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }

        /* Centrer les liens et donner la même largeur et hauteur que le bouton */
        .center-link {
            text-align: center;
            display: inline-block;
            margin-top: 8px;
           margin-left: 130px;
            color: white;
            background-color: #320fbf; /* Couleur de fond du bouton */
            padding: 12px 20px; /* Espacement autour du texte pour imiter un bouton */
            border-radius: 5px; /* Coins arrondis */
            text-decoration: none;
            font-weight: bold;
            transition: background-color 0.3s ease;
            width: 60%; /* Largeur égale à celle du bouton de soumission */
            box-sizing: border-box; /* Inclure les marges et padding dans la largeur totale */
        }

        /* Ajouter l'effet hover */
        .center-link:hover, .back-to-dashboard:hover {
            background-color: #2800a6;
            text-decoration:none /* Couleur de fond plus foncée au survol */
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Your Profile</h2>
        <c:if test="${not empty message}">
            <p class="success">${message}</p>
        </c:if>
        <c:if test="${not empty errorMessage}">
            <p class="error">${errorMessage}</p>
        </c:if>

        <form action="${pageContext.request.contextPath}/profile" method="post">
            <label for="username">Username:</label>
            <input type="text" name="username" id="username" value="${user.username}" required />

            <label for="password">Password:</label>
            <input type="password" name="password" id="password" value="${user.password}" required />

            <input type="submit" value="Update Profile" />
        </form>

        <c:if test="${user.role ne 'COMPANY'}">
            <h3>Your Subscriptions</h3>
            <c:choose>
                <c:when test="${not empty subscriptions}">
                    <ul>
                        <c:forEach var="offer" items="${subscriptions}">
                            <li>
                                <strong>${offer.departureCity} to ${offer.arrivalCity}</strong><br /> 
                                Departure Time: ${offer.departureTime} - Arrival Time: ${offer.arrivalTime}
                            </li>
                        </c:forEach>
                    </ul>
                </c:when>
                <c:otherwise>
                    <p>You have not subscribed to any offers yet.</p>
                </c:otherwise>
            </c:choose>
            <a href="${pageContext.request.contextPath}/offers" class="center-link">Back to Offers</a>
        </c:if>
        
        <c:if test="${user.role ne 'USER'}">
            <a href="${pageContext.request.contextPath}/companyDashboard" class="center-link back-to-dashboard">Back to Dashboard</a>
        </c:if>

        <!-- Ajouter un lien "Back to Login" avec la même largeur et hauteur que le bouton -->
    </div>
</body>
</html>
