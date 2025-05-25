<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Add Offer</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/addOffer.css" />
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
        input[type="date"],
        input[type="time"],
        textarea {
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
        input[type="date"]:focus,
        input[type="time"]:focus,
        textarea:focus {
            border-color: #33b5ff;
            outline: none;
        }

        textarea {
            height: 100px;
            resize: vertical;
        }

        input[type="submit"] {
            background-color: #320fbf; /* Corrected color code */
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
            background-color: #2800a6; /* Darker color on hover */
        }

        p.error {
            color: #ff4c33;
            font-weight: bold;
            text-align: center;
            margin-top: 20px;
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

        /* Gestion des marges pour améliorer l'apparence générale */
        .container form {
            width: 100%;
            max-width: 600px;
            margin: 0 auto;
        }

        .container form input,
        .container form textarea {
            margin-bottom: 20px;
        }
        
        
        
        
         .center-link {
            text-align: center;
            display: inline-block;
           margin-left: 5px;
           margin-bottom:30;
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
        <h2>Add Offer</h2>
        <c:if test="${not empty errorMessage}">
            <p class="error">${errorMessage}</p>
        </c:if>
        <form action="${pageContext.request.contextPath}/addOffer" method="post">
            <label for="departureCity">Departure City:</label>
            <input type="text" name="departureCity" id="departureCity" required />
            
            <label for="arrivalCity">Arrival City:</label>
            <input type="text" name="arrivalCity" id="arrivalCity" required />
            
            <label for="departureTime">Departure Time:</label>
            <input type="time" name="departureTime" id="departureTime" required />
            
            <label for="arrivalTime">Arrival Time:</label>
            <input type="time" name="arrivalTime" id="arrivalTime" required />
            
            <label for="startDate">Start Date:</label>
            <input type="date" name="startDate" id="startDate" required />
            
            <label for="endDate">End Date:</label>
            <input type="date" name="endDate" id="endDate" required />
            
            <label for="targetSubscribers">Target Subscribers:</label>
            <input type="text" name="targetSubscribers" id="targetSubscribers" required />
            
            <label for="description">Description:</label>
            <textarea name="description" id="description" required></textarea>
            
            <input type="submit" value="Add Offer" />
        </form>
        <p>
            <a href="${pageContext.request.contextPath}/companyDashboard" class="center-link">Back to Dashboard</a>
        </p>
    </div>
</body>
</html>
