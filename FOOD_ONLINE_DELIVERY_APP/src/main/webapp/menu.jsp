<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.daomodel.Menu" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>😍💞💘 𝓼𝓢𝓻𝓑𝓲𝓽𝓮𝓼 💔💏💖 Menu</title>

    <style>
    :root{
      --bg: linear-gradient(120deg, #FFF9F0, #FFE7D0);
      --card-bg: #fff;
      --muted: #8b8b8b;
      --accent: #D87300;
      --radius: 14px;
      --shadow: 0 8px 22px rgba(0,0,0,0.08);
    }

    *{
      box-sizing: border-box;
    }

    body{
      margin:0;
      padding:0;
      background:var(--bg);
      font-family: "Segoe UI", Arial, sans-serif;
      min-height: 100vh;
    }

    /* Navbar (match restaurant.jsp feel) */
    .navbar {
        background: rgba(255, 255, 255, 0.94);
        padding: 12px 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        position: sticky;
        top: 0;
        z-index: 100;
        box-shadow: 0px 4px 16px rgba(0,0,0,0.08);
    }
    .navbar .logo {
        font-size: 20px;
        font-weight: 700;
        color: var(--accent);
        text-decoration: none;
    }
    .navbar ul {
        list-style: none;
        display: flex;
        gap: 18px;
        margin: 0;
        padding: 0;
    }
    .navbar ul li a {
        text-decoration: none;
        color: #5A4633;
        font-weight: 500;
        font-size: 14px;
        transition: color 0.2s, transform 0.15s;
    }
    .navbar ul li a:hover {
        color: var(--accent);
        transform: translateY(-1px);
    }

    @media (max-width: 768px) {
        .navbar {
            flex-wrap: wrap;
            row-gap: 8px;
        }
        .navbar ul {
            width: 100%;
            justify-content: flex-end;
            flex-wrap: wrap;
        }
    }

    .wrap{
      max-width:1200px;
      margin:20px auto 40px;
      padding:0 16px 30px;
    }

    header{
      display:flex;
      justify-content:space-between;
      align-items:flex-end;
      flex-wrap:wrap;
      gap:8px;
      margin-bottom:18px;
    }

    header h1{
      margin:0;
      font-size:26px;
      font-weight:700;
      color:#5C3B1E;
    }

    .subtitle{
      margin:0;
      font-size:13px;
      color:var(--muted);
    }

    .restaurant-chip{
      background:#FFE7C2;
      padding:6px 12px;
      border-radius:999px;
      font-size:13px;
      color:#5A4633;
      font-weight:500;
    }

    .menu-grid{
      display:grid;
      grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
      gap:22px;
    }

    .card{
      background:var(--card-bg);
      border-radius:var(--radius);
      box-shadow:var(--shadow);
      overflow:hidden;
      transition:0.2s ease;
      display:flex;
      flex-direction:column;
      border:1px solid #FFE0B5;
    }

    .card:hover{
      transform:translateY(-5px);
      box-shadow:0 10px 28px rgba(0,0,0,0.12);
    }

    .media{
      width:100%;
      height:160px;
      object-fit:cover;
      background:#eee;
      display:block;
    }

    .card-content{
      padding:14px 16px 6px;
      flex:1;
    }

    .title{
      margin:0;
      font-size:18px;
      font-weight:700;
      color:#4A321B;
    }

    .desc{
      margin-top:6px;
      font-size:13px;
      color:var(--muted);
      line-height:1.4;
      max-height:3.2em;
      overflow:hidden;
    }

    .card-footer{
      padding:0 16px 14px 16px;
      display:flex;
      justify-content:space-between;
      align-items:center;
      column-gap:8px;
    }

    .price{
      color:var(--accent);
      font-weight:700;
      font-size:15px;
    }

    .btn-cart{
      background:var(--accent);
      color:#fff;
      border:none;
      padding:8px 16px;
      border-radius:999px;
      cursor:pointer;
      font-size:13px;
      font-weight:600;
      box-shadow:0 4px 12px rgba(216,115,0,0.25);
      transition:0.18s ease;
      white-space:nowrap;
    }

    .btn-cart:hover{
      filter:brightness(0.95);
    }

    .btn-cart:active{
      transform:scale(0.96);
    }

    .empty-msg{
      text-align:center;
      padding:40px 0;
      color:#7A6652;
      font-size:15px;
      grid-column:1 / -1;
    }
    </style>
</head>
<body>

<%
    // Optional: show restaurant name if you stored it in session like in checkout.jsp
    String restaurantName = (String) session.getAttribute("restaurant_name");
    List<Menu> menu = (List<Menu>)request.getAttribute("Menu_details");
%>

<!-- Navbar -->
<nav class="navbar">
    <a href="getAllRestaurant" class="logo">𝓼𝓢𝓻𝓑𝓲𝓽𝓮𝓼💖⚡</a>
    <ul>
        <li><a href="getAllRestaurant">Restaurants</a></li>
        <li><a href="cart.jsp">Cart</a></li>
        <li><a href="login.jsp">Logout</a></li>
    </ul>
</nav>

<div class="wrap">
    <header>
        <div>
            <h1>Best Menu for You</h1>
            <p class="subtitle">Freshly curated dishes from our kitchen.</p>
        </div>
        <% if (restaurantName != null && !restaurantName.trim().isEmpty()) { %>
            <div class="restaurant-chip">
                🍽 Menu at <strong><%= restaurantName %></strong>
            </div>
        <% } %>
    </header>

    <%
        if (menu != null && !menu.isEmpty()) {
    %>
    <div class="menu-grid">
        <%
            for(Menu m : menu){
        %>
        <div class="card">
            <!-- Replace image path as needed; you can map per-item images later -->
          <img class="media" src="<%= m.getImagePath() %>" alt="<%= m.getItem_name() %>">


            <div class="card-content">
                <h2 class="title"><%= m.getItem_name() %></h2>
                <p class="desc"><%= m.getDescription() %></p>
            </div>

            <div class="card-footer">
                <div class="price">Rs. <%= m.getPrice() %></div>

                <form action="cart_servlet" method="POST">
                    <input type="hidden" name="menu_id" value="<%= m.getMenu_id() %>">
                    <input type="hidden" name="itemName" value="<%= m.getItem_name() %>">
                    <input type="hidden" name="restaurant_id" value="<%= m.getRestaurant_id() %>">
                    <input type="hidden" name="price" value="<%= m.getPrice() %>">
                    <input type="hidden" name="quantity" value="1">
                    <input type="hidden" name="action" value="add">
                    <button type="submit" class="btn-cart">Add to cart</button>
                </form>
            </div>
        </div>
        <%
            } // end for
        %>
    </div>
    <%
        } else {
    %>
        <div class="menu-grid">
            <div class="empty-msg">No menu items available for this restaurant.</div>
        </div>
    <%
        }
    %>
</div>

</body>
</html>
