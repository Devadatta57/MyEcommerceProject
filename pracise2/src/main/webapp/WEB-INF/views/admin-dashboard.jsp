<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Admin Dashboard</title>
    <style>
        /* Full height for sticky footer layout */
        html, body {
            height: 100%;
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f7fafc; /* very light blue-gray */
            color: #2d3748; /* dark slate gray */
        }
        
        /* Flex container for full height layout */
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        
        /* Main content wrapper flex-grow */
        .page-wrapper {
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            max-width: 1000px;
            margin: 30px auto;
            padding: 0 15px;
            width: 100%;
        }
        
        /* Header */
        .header {
            background-color: #1a1f36;
            padding: 20px 30px;
            color: #f0f0f0;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 2px solid #4fd1c5;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .header-title {
            font-size: 28px;
            font-weight: bold;
            letter-spacing: 1px;
        }

        .header-right {
            display: flex;
            align-items: center;
            gap: 25px; /* space between username and logout */
            font-size: 18px;
            color: #4fd1c5;
        }

        .logout-btn {
            background-color: #4fd1c5;
            color: #1a1f36;
            padding: 8px 16px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 600;
            transition: background-color 0.3s ease;
        }

        .logout-btn:hover {
            background-color: #38b2ac;
            color: #e6fffa;
        }

        /* Dashboard Container */
        .dashboard-container {
            background-color: #ffffff; /* pure white */
            border-radius: 12px;
            border: 1px solid #e2e8f0; /* light gray border */
            box-shadow: 0 4px 15px rgba(160, 174, 192, 0.4);
            padding: 30px;
            flex-grow: 1;
        }

        .sections-wrapper {
            display: flex;
            gap: 40px;
            justify-content: center;
        }

        .section-box {
            flex: 1 1 0;
            max-width: 450px;
            background-color: #edf2f7; /* very light gray-blue */
            border-radius: 12px;
            padding: 30px 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 250px;
            position: relative;
            box-sizing: border-box;
        }

        /* Outer dark border frame */
        .section-box::before {
            content: "";
            position: absolute;
            top: -8px;
            left: -8px;
            right: -8px;
            bottom: -8px;
            border: 3px solid #1a202c; /* dark navy/gray */
            border-radius: 16px;
            pointer-events: none;
        }

        .section-box h2 {
            margin-bottom: 25px;
            color: #3182ce; /* medium blue */
            font-weight: 700;
            position: relative;
            z-index: 1;
        }

        .actions {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 15px;
            text-align: center;
            flex-grow: 1;
            justify-content: center;
            position: relative;
            z-index: 1;
        }

        .actions a {
            display: inline-block;
            padding: 12px 30px;
            background-color: #63b3ed; /* soft blue */
            color: #fff;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 600;
            font-size: 16px;
            width: 100%;
            max-width: 250px;
            transition: background-color 0.3s ease;
        }

        .actions a:hover {
            background-color: #4299e1; /* slightly darker blue */
        }

        .actions h3 {
            font-weight: normal;
            margin: 0;
            color: #4a5568; /* grayish text */
            font-size: 14px;
            max-width: 300px;
            position: relative;
            z-index: 1;
        }

        /* Footer */
        footer {
            background-color: #1a1f36;
            color: #cbd5e0;
            text-align: center;
            padding: 15px 0;
            font-size: 14px;
            flex-shrink: 0;
        }
    </style>
</head>
<body>

<div class="header">
    <div class="header-title">Ecommerce Admin</div>
    <div class="header-right">
        <c:if test="${loggedInUser != null}">
            <span>Welcome, <strong>${loggedInUser.username}</strong></span>
        </c:if>
        <a href="/logout" class="logout-btn">Logout</a>
    </div>
</div>

<div class="page-wrapper">

    <div class="dashboard-container">
        <div class="sections-wrapper">

            <div class="section-box">
                <h2>Manage Users</h2>
                <div class="actions">
                    <a href="/users">Go to Manage users</a>
                    <h3>Add, edit, or delete users from the list</h3>
                </div>
            </div>

            <div class="section-box">
                <h2>Manage Products</h2>
                <div class="actions">
                    <a href="/products">Go to Manage products</a>
                    <h3>Add, edit, or delete products from the list</h3>
                </div>
            </div>

        </div>
    </div>

</div>

<footer>
    &copy; 2025 Ecommerce Admin. All rights reserved.
</footer>

</body>
</html>
