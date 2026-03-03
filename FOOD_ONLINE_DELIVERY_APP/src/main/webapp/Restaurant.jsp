<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.daomodel.Restaurant,com.daomodel.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>𝓼𝓢𝓻𝓑𝓲𝓽𝓮𝓼💖⚡ Available Restaurants</title>
    <style>
     body {
        margin: 0;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(120deg, #FFF9F0, #FFE7D0);
        min-height: 100vh;
     }

        /* Navbar - light café style */
        .navbar {
            background: rgba(255, 255, 255, 0.9);
            padding: 12px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: sticky;
            top: 0;
            z-index: 1000;
            box-shadow: 0px 4px 16px rgba(0,0,0,0.08);
        }
        .navbar .logo {
            font-size: 22px;
            font-weight: bold;
            color: #D87300;
            text-decoration: none;
        }
        .navbar ul {
            list-style: none;
            display: flex;
            gap: 25px;
            margin: 0;
            padding: 0;
        }
        .navbar ul li {
            display: inline;
        }
        .navbar ul li a {
            text-decoration: none;
            color: #5A4633;
            font-weight: 500;
            font-size: 14px;
            transition: color 0.2s, transform 0.15s;
        }
        .navbar ul li a:hover {
            color: #D87300;
            transform: translateY(-1px);
        }
        .search-box {
            margin-left: 20px;
            flex: 1;
            display: flex;
            justify-content: center;
        }
        .search-box input {
            width: 60%;
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 14px;
            outline: none;
            border: 1px solid #E5C9A1;
            background: #FFF9F0;
        }
        .search-box input:focus {
            border-color: #D87300;
            box-shadow: 0 0 0 2px rgba(216,115,0,0.15);
        }
        .menu-toggle {
            display: none;
            flex-direction: column;
            cursor: pointer;
        }
        .menu-toggle span {
            height: 3px;
            width: 25px;
            background: #5A4633;
            margin: 4px 0;
            border-radius: 3px;
            transition: 0.3s;
        }
        @media (max-width: 768px) {
            .navbar {
                flex-wrap: wrap;
            }
            .navbar ul {
                position: absolute;
                top: 60px;
                right: 0;
                width: 220px;
                background: rgba(255, 255, 255, 0.97);
                flex-direction: column;
                gap: 0;
                display: none;
                box-shadow: 0 6px 18px rgba(0,0,0,0.12);
            }
            .navbar ul li {
                text-align: left;
                padding: 12px 16px;
                border-bottom: 1px solid rgba(0,0,0,0.05);
            }
            .navbar ul li:last-child {
                border-bottom: none;
            }
            .menu-toggle {
                display: flex;
            }
            .navbar.active ul {
                display: flex;
            }
            .search-box {
                width: 100%;
                margin-top: 10px;
                order: 3;
            }
            .search-box input {
                width: 90%;
            }
        }

        /* Title */
        h2 {
            text-align: center;
            margin: 30px 0 20px;
            font-size: 30px;
            color: #5C3B1E;
            letter-spacing: 0.5px;
        }

        /* Container */
        .container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 25px;
            width: 90%;
            margin: 0 auto 40px;
        }

        /* Card - pastel café theme */
        .card {
            background: #FFFFFF;
            border: 1px solid #FFE0B5;
            border-radius: 16px;
            box-shadow: 0px 6px 16px rgba(0,0,0,0.05);
            padding: 16px;
            transition: transform 0.25s ease, box-shadow 0.25s ease;
            text-align: left;
            overflow: hidden;
        }
        .card:hover {
            transform: translateY(-6px);
            box-shadow: 0px 10px 24px rgba(0,0,0,0.12);
        }
        .card img {
            width: 100%;
            height: 170px;
            object-fit: cover;
            border-radius: 12px;
            margin-bottom: 12px;
            transition: transform 0.3s ease;
        }
        .card:hover img {
            transform: scale(1.03);
        }
        .card h3 {
            margin: 6px 0;
            font-size: 19px;
            color: #D87300;
        }
        .card p {
            margin: 4px 0;
            font-size: 14px;
            color: #5A4633;
        }
        .highlight {
            font-weight: bold;
            color: #D87300;
        }

        .status {
            display: inline-block;
            padding: 4px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: bold;
        }
        .status.active {
            background: #27ae60;
            color: #fff;
        }
        .status.inactive {
            background: #e74c3c;
            color: #fff;
        }

        a {
            text-decoration: none;
        }

        /* Empty state */
        .empty-msg {
            grid-column: 1 / -1;
            text-align: center;
            font-size: 16px;
            color: #7A6652;
            padding: 30px 0;
        }
    </style>
    <script>
        function toggleMenu() {
            document.querySelector(".navbar").classList.toggle("active");
        }
        function filterRestaurants() {
            let input = document.getElementById("searchInput").value.toLowerCase();
            let cards = document.getElementsByClassName("card");
            for (let i = 0; i < cards.length; i++) {
                let name = cards[i].querySelector("h3").innerText.toLowerCase();
                cards[i].style.display = name.includes(input) ? "block" : "none";
            }
        }
    </script>
</head>
<body>

<%
    com.daomodel.User name = (com.daomodel.User)session.getAttribute("user");
%>

    <!-- Navbar -->
    <nav class="navbar">
        <a href="#" class="logo">𝓼𝓢𝓻𝓑𝓲𝓽𝓮𝓼💖⚡</a>
        <div class="search-box">
            <input type="text" id="searchInput" onkeyup="filterRestaurants()" placeholder="🔍 Search restaurants...">
        </div>
        <ul>
            <li><a href="getAllRestaurant">Restaurants</a></li>
            <li><a href="cart.jsp">Cart</a></li>
            <li><a href="login.jsp">Logout</a></li>
        </ul>
        <div class="menu-toggle" onclick="toggleMenu()">
            <span></span><span></span><span></span>
        </div>
    </nav>

    <!-- Title -->
    <h2>🍴 Available Restaurants</h2>

    <!-- Cards -->
    <div class="container">
    <%
        List<Restaurant> restaurantList = (List<Restaurant>) request.getAttribute("Restaurant_list");

        if (restaurantList != null && !restaurantList.isEmpty()) {
            for (Restaurant r : restaurantList) {

                String img = r.getimage_path();
                String finalImage;

                // HANDLE IMAGE SOURCE LOGIC
                if (img == null || img.trim().isEmpty()) {
                    // DB has no path -> use default
                    finalImage = request.getContextPath() + "/images/default.jpg";

                } else if (img.startsWith("http://") || img.startsWith("https://")) {
                    // DB has full external URL -> use directly
                    finalImage = img.trim();

                } else {
                    // DB contains relative path like 'images/default.jpg'
                    finalImage = request.getContextPath() + "/" + img.trim();
                }
    %>

        <div class="card">

            <!-- Restaurant Image -->
            <img src="<%= finalImage %>"
                 alt="Restaurant Image"
                 onerror="this.src='<%= request.getContextPath() %>/images/default.jpg'">

            <!-- Restaurant View -->
            <a href="menu?restaurant_id=<%= r.getrestaurant_id() %>">
                <h3><%= r.getname() %></h3>
                <p><span class="highlight">🍲 </span><%= r.getcusine_type() %></p>
                <p><span class="highlight">⭐ </span><%= r.getrating() %></p>
                <p><span class="highlight">⏱ </span><%= r.getestimated_time_arival() %></p>
            </a>

        </div>

    <%
            }
        } else {
    %>

        <p class="empty-msg">No restaurants available.</p>

    <%
        }
    %>
</div>


</body>
</html>
