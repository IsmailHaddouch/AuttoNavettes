<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css" />
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap" rel="stylesheet"> <!-- Lien pour la police Roboto -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #e4ecf1;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            width: 100%;
            max-width: 400px;
            background-color: #5d8fae; /* Couleur identique à celle du body */
            padding: 50px;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h2 {
            color: rgba(255, 255, 255, 0.6); /* Transparence de 60% */
            font-size: 36px; /* Augmenter la taille du texte */
            font-weight: 500; /* Plus gras */
            text-transform: uppercase; /* Mettre le texte en majuscules pour un effet plus percutant */
            margin-bottom: 25px; /* Espacement plus grand sous le titre */
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3); /* Ombre légère pour faire ressortir le texte */
            letter-spacing: 2px; /* Espacement des lettres pour un effet plus aéré */
            font-family: 'Roboto', sans-serif; /* Utilisation d'une police moderne */
        }

        .container label {
            display: block;
            text-align: left;
            font-weight: bold;
            margin: 10px 0 5px;
            color: white !important; /* Ajout de !important pour forcer la couleur blanche */
        }

        input[type="text"], input[type="password"], input[type="submit"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 10px !important;  /* Ajout de !important pour forcer le radius de 25px */
            font-size: 16px;
            background-color: #f4f8fd;
            opacity: 0.85;  /* Réduire légèrement l'opacité pour un effet plus léger */
            transition: opacity 0.3s ease;  /* Ajouter une transition pour l'effet d'opacité */
        }

        input[type="text"]:focus, input[type="password"]:focus, input[type="submit"]:hover {
            opacity: 1;  /* Remettre l'opacité à 1 quand l'input est focalisé ou hover sur le bouton */
            border-color: #320fbf;  /* Changer la couleur de la bordure au focus */
        }

        input[type="submit"] {
            background-color: #320fbf;
            color: white;
            font-weight: bold;
            border: none;
            padding: 12px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width: 100%;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #2800a6;
        }

        .error {
            color: white;
            font-weight: bold;
            background: #e74c3c;
            padding: 12px;
            border-radius: 8px;
            margin-top: 15px;
        }

        p {
            color: white;
        }

        p a {
            color: white;
            text-decoration: none;
            font-weight: bold;
        }

        p a:hover {
            text-decoration: underline;
        }

        .logo {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            margin-bottom: 30px;
            object-fit: cover;
            display: block;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Logo circulaire -->
        <img class="logo" src="<%= request.getContextPath() %>/images/logo.png" alt="Logo de mon projet">
        
        <h2>Login</h2>
        <form action="${pageContext.request.contextPath}/login" method="post">
            <label for="username">Username:</label>
            <input type="text" name="username" id="username" required />

            <label for="password">Password:</label>
            <input type="password" name="password" id="password" required />

            <input type="submit" value="Login" />
        </form>

        <c:if test="${not empty errorMessage}">
            <p class="error">${errorMessage}</p>
        </c:if>

        <p>Don't have an account? <a href="${pageContext.request.contextPath}/jsp/register.jsp">Register here</a>.</p>
    </div>
</body>
</html>
