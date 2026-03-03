<%@page import="com.daoimpl.MenuImpl"%>
<%@page import="com.daomodel.cart_item"%>
<%@page import="com.daoimpl.cartImpl"%>
<%@page import="com.servlet.cart_servlet" %>
<%@page import="com.daomodel.Menu,java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>𝓼𝓢𝓻𝓑𝓲𝓽𝓮𝓼💖⚡ cart</title>

<style>
body {
    font-family: "Segoe UI", sans-serif;
    background-color: #f4f5f7;
    margin: 0;
    padding: 0;
}

/* HEADER */
.header {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    height: 64px;
    background: #ffffff;
    box-shadow: 0 2px 8px rgba(0,0,0,0.06);
    z-index: 1000;
    display: flex;
    align-items: center;
}

.header-inner {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.logo {
    font-size: 22px;
    font-weight: 700;
    letter-spacing: 0.5px;
    color: #111827;
}

.logo span {
    color: #0a8f38;
}

/* BACK TO RESTAURANTS link in top-right corner */
/* BACK TO RESTAURANTS / LOGOUT links in top-right corner */
.back-link {
    position: absolute;
    text-decoration: none;
    padding: 8px 16px;
    border-radius: 999px;
    border: 1px solid #e5e7eb;
    font-size: 14px;
    font-weight: 500;
    color: #111827;
    background: #f9fafb;
    cursor: pointer;
    transition: background 0.15s ease, transform 0.05s ease;
}

.back-link:hover {
    background: #eef2ff;
    transform: translateY(-1px);
}



.cart-chip {
    padding: 6px 12px;
    border-radius: 999px;
    background: #ecfdf3;
    color: #166534;
    font-size: 13px;
    font-weight: 600;
}

/* MAIN WRAPPER */
.page {
    display: flex;
    justify-content: center;
    padding: 88px 12px 100px; /* header + bottom bar space */
}

.container {
    width: 100%;
    max-width: 1200px;
    display: grid;
    grid-template-columns: minmax(0, 2.2fr) minmax(280px, 1fr);
    gap: 24px;
}

/* CART LIST CARD */
.cart-card {
    background: #ffffff;
    border-radius: 16px;
    padding: 16px 20px;
    box-shadow: 0 4px 10px rgba(15, 23, 42, 0.05);
}

/* ITEM CARD */
.item-card {
    display: flex;
    justify-content: space-between;
    padding: 16px 0;
    border-bottom: 1px solid #e5e7eb;
}

.item-card:last-child {
    border-bottom: none;
}

.left {
    width: 65%;
}

.left h2 {
    margin: 0;
    font-size: 18px;
    font-weight: 600;
    color: #111827;
}

.price {
    font-size: 16px;
    margin: 6px 0;
    font-weight: 600;
    color: #0a8f38;
}

.unit-price {
    font-size: 13px;
    color: #6b7280;
}

.desc {
    color: #6b7280;
    line-height: 1.4;
    max-width: 90%;
    font-size: 13px;
    margin-top: 4px;
}

.right {
    width: 30%;
    position: relative;
    text-align: center;
}

.right img {
    width: 110px;
    height: 110px;
    border-radius: 14px;
    object-fit: cover;
}

/* QUANTITY + REMOVE */
.qty-box {
    position: absolute;
    bottom: -10px;
    left: 50%;
    transform: translateX(-50%);
    display: flex;
    background: white;
    border-radius: 999px;
    overflow: hidden;
    border: 1px solid #d1d5db;
}

.qty-box button {
    width: 32px;
    border: none;
    background: white;
    font-size: 18px;
    cursor: pointer;
    font-weight: bold;
    line-height: 1;
}

.qty-box span {
    padding: 6px 12px;
    font-weight: 600;
    font-size: 14px;
}

.remove-btn {
    margin-top: 12px;
    background: #fee2e2;
    color: #b91c1c;
    padding: 6px 14px;
    font-size: 13px;
    border: none;
    border-radius: 999px;
    cursor: pointer;
    font-weight: 600;
    display: inline-flex;
    align-items: center;
    gap: 4px;
}

.remove-btn:hover {
    background: #fecaca;
}

/* BILL BOX */
.bill-container {
    background: #ffffff;
    border-radius: 16px;
    box-shadow: 0 4px 10px rgba(15, 23, 42, 0.05);
    padding: 18px 20px;
    position: sticky;
    top: 88px;
}

.bill-container h3 {
    margin: 0 0 14px 0;
    font-size: 18px;
    font-weight: 600;
    color: #111827;
}

.bill-row {
    display: flex;
    justify-content: space-between;
    margin: 8px 0;
    font-size: 14px;
    color: #4b5563;
}

.bill-row span:last-child {
    font-weight: 500;
}

.bill-row.muted {
    color: #9ca3af;
}

.total-pay {
    margin-top: 16px;
    padding-top: 12px;
    border-top: 2px solid #111827;
    display: flex;
    justify-content: space-between;
    font-weight: 700;
    font-size: 18px;
    color: #111827;
}

/* EMPTY STATE */
.empty-state {
    text-align: center;
    padding: 40px 16px;
    color: #6b7280;
    font-size: 15px;
}

/* Sticky bottom action bar */
.button-row-sticky {
    position: fixed;
    left: 0;
    right: 0;
    bottom: 0;
    background: #ffffff;
    box-shadow: 0 -6px 18px rgba(0, 0, 0, 0.06);
    padding: 12px;
    z-index: 999;
    display: flex;
    justify-content: center;
}

.button-row-sticky .inner {
    width: 100%;
    max-width: 1200px;
    display: flex;
    gap: 12px;
}

.button-row-sticky .btn-wrapper {
    width: 50%;
}

.checkout-btn, .addmore-btn {
    width: 100%;
    padding: 12px 0;
    font-size: 16px;
    border-radius: 999px;
    border: none;
    cursor: pointer;
    font-weight: 600;
}

/* color variants */
.checkout-btn {
    background: #0a8f38;
    color: #fff;
}

.checkout-btn:hover {
    background: #066c2b;
}

.addmore-btn {
    background: #2563eb;
    color: #fff;
}

.addmore-btn:hover {
    background: #1d4ed8;
}

/* Responsive */
@media (max-width: 900px) {
    .container {
        grid-template-columns: minmax(0, 1fr);
    }

    .bill-container {
        position: static;
    }

    .item-card {
        flex-direction: row;
        gap: 12px;
    }
}

@media (max-width: 640px) {
    .item-card {
        flex-direction: column;
    }

    .left, .right {
        width: 100%;
    }

    .right {
        margin-top: 12px;
    }
}
</style>
</head>
<body>

<%
    cartImpl cart = (cartImpl) session.getAttribute("cart");
    Integer restaurant_id = (Integer) session.getAttribute("restaurant_id");

    double grandTotal = 0.0;
    int totalItems = 0;

    if (cart != null && cart.getCartItems() != null && !cart.getCartItems().isEmpty()) {
        for (Object obj : cart.getCartItems().values()) {
            cart_item ci = (cart_item) obj;
            grandTotal += ci.getPrice() * ci.getQuantity();
            totalItems += ci.getQuantity();
        }
    }

    // >>> GST & DELIVERY CALCULATION <<<
    double gstRate = 0.05;              // 5%
    double gstAmount = grandTotal * gstRate;
    double deliveryCharge = (grandTotal > 0) ? 30.0 : 0.0;   // 30 only if there is an order
    double totalPay = grandTotal + gstAmount + deliveryCharge;
%>

<!-- HEADER -->
<header class="header">
    <div class="header-inner">
        <div class="logo">𝓼𝓢𝓻𝓑𝓲𝓽𝓮𝓼<span>💖⚡</span></div>

        <%
            // read logged in user from session
            com.daomodel.User loggedUser =
                    (com.daomodel.User) session.getAttribute("user");
            if (loggedUser != null) {
        %>
            <div class="cart-chip">
                Hi, <%= loggedUser.getname() %>
            </div>
        <%
            }
        %>
    </div>

    <!-- Top-right: Back to Restaurants -->
    <a href="<%=request.getContextPath()%>/getAllRestaurant" class="back-link"
       style="right: 24px;">
        Back To Restaurants
    </a>

    <!-- Top-right: Logout (shifted a bit left) -->
    <a href="<%=request.getContextPath()%>/logout" class="back-link"
       style="right: 190px;">
        Logout
    </a>
</header>


<div class="page">
    <div class="container">

        <!-- LEFT: CART ITEMS -->
        <div class="cart-card">
            <%
                if (cart == null || cart.getCartItems() == null || cart.getCartItems().isEmpty()) {
            %>
                <div class="empty-state">
                    Your cart is empty. Add some tasty food from the restaurants.
                </div>
            <%
                } else {
                    for (Object obj : cart.getCartItems().values()) {
                        cart_item item = (cart_item) obj;
            %>
                <div class="item-card">
                    <div class="left">
                        <h2><%= item.getItem_name() %></h2>

                        <!-- TOTAL PRICE BASED ON QUANTITY -->
                        <div class="price">
                            ₹<%= item.getPrice() * item.getQuantity() %>
                        </div>
                        <div class="unit-price">
                            ₹<%= item.getPrice() %> x <%= item.getQuantity() %> item<%= (item.getQuantity() > 1 ? "s" : "") %>
                        </div>

                        <div class="desc">
                            Freshly prepared, served hot. Perfect for your meal.
                        </div>

                        <form action="cart_servlet" method="post">
                            <input type="hidden" name="menu_id" value="<%= item.getMenu_id() %>">
                            <input type="hidden" name="restaurant_id" value="<%= item.getRestaurant_id() %>">
                            <input type="hidden" name="action" value="remove">
                            <button type="submit" class="remove-btn">✕ Remove</button>
                        </form>
                    </div>

                    <div class="right">
                     <%
        MenuImpl mImpl = new MenuImpl();
        Menu menuItem = mImpl.getMenu(item.getMenu_id()); 
    %>
                        <img src="<%= menuItem.getImagePath() %>" alt="Food image" />

                        <div class="qty-box">
                            <form action="cart_servlet" method="post">
                                <input type="hidden" name="menu_id" value="<%=item.getMenu_id() %>">
                                <input type="hidden" name="restaurant_id" value="<%= item.getRestaurant_id()%>">
                                <input type="hidden" name="action" value="update">
                                <input type="hidden" name="quantity" value="<%=item.getQuantity()-1 %>">
                                <button <%= (item.getQuantity() == 1) ? "disabled" : "" %>>-</button>
                            </form>

                            <span><%= item.getQuantity() %></span>

                            <form action="cart_servlet" method="post">
                                <input type="hidden" name="menu_id" value="<%=item.getMenu_id() %>">
                                <input type="hidden" name="restaurant_id" value="<%= item.getRestaurant_id()%>">
                                <input type="hidden" name="action" value="update">
                                <input type="hidden" name="quantity" value="<%=item.getQuantity()+1 %>">
                                <button>+</button>
                            </form>
                        </div>
                    </div>
                </div>
            <%
                    } // for
                } // else
            %>
        </div>

        <!-- RIGHT: BILL SUMMARY -->
        <div class="bill-container">
            <h3>Bill Summary</h3>

            <div class="bill-row">
                <span>Items (<%= totalItems %>)</span>
                <span>₹<%= String.format("%.2f", grandTotal) %></span>
            </div>

            <div class="bill-row">
                <span>GST (@ 5%)</span>
                <span>₹<%= String.format("%.2f", gstAmount) %></span>
            </div>

            <div class="bill-row">
                <span>Delivery</span>
                <span>₹<%= String.format("%.2f", deliveryCharge) %></span>
            </div>

            <div class="total-pay">
                <span>To Pay</span>
                <span>₹<%= String.format("%.2f", totalPay) %></span>
            </div>
        </div>
    </div>
</div>

<!-- STICKY BOTTOM BUTTON BAR -->
<div class="button-row-sticky" role="region" aria-label="Cart actions">
    <div class="inner">
        <div class="btn-wrapper">
            <form action="checkout.jsp" method="post">
    <input type="hidden" name="restaurant_id" value="<%=session.getAttribute("restaurant_id")%>">
    <button type="submit" class="checkout-btn">
        Proceed to Checkout (₹<%= String.format("%.2f", totalPay) %>)
    </button>
</form>
            
        </div>

        <div class="btn-wrapper">
            <form action="menu" method="get">
                <input type="hidden" name="restaurant_id"
                       value="<%=session.getAttribute("restaurant_id") %>">
                <button class="addmore-btn" type="submit">
                    Add More Items / Restaurants
                </button>
            </form>
        </div>
    </div>
</div>

</body>
</html>
