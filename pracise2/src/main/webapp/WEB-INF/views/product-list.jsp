<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Product List</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f7f7f7;
            margin: 0;
            padding: 0;
        }

        .welcome-banner {
            background: linear-gradient(90deg, #4b6cb7 0%, #182848 100%);
            color: white;
            padding: 15px 30px;
            font-size: 20px;
            font-weight: 600;
            text-align: center;
            box-shadow: 0 3px 8px rgba(0,0,0,0.2);
            letter-spacing: 0.05em;
            margin-bottom: 20px;
        }

        .header-buttons {
            display: flex;
            justify-content: space-between;
            margin: 0 5% 20px;
        }

        .card-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 0 20px 40px;
        }

        .card {
            width: 260px;
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            padding: 18px;
            text-align: center;
            transition: transform 0.2s ease-in-out;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
        }

        .card img {
            width: 100%;
            height: 200px;  /* changed to match your first JSP */
            object-fit: cover;
            border-radius: 8px;
            margin-bottom: 12px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }

        .card h3 {
            margin: 8px 0 5px;
            color: #222;
            font-size: 18px;
        }

        .card p {
            font-size: 14px;
            color: #666;
            min-height: 42px; /* Keep descriptions aligned */
            margin: 0 0 10px;
        }

        .card .price {
            font-weight: bold;
            color: #28a745;
            margin: 10px 0 12px;
            font-size: 16px;
        }

        input[type="number"] {
            width: 65px;
            padding: 5px;
            margin: 6px 0 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .btn {
            padding: 9px 15px;
            margin: 5px 4px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            color: white;
            font-weight: 600;
            font-size: 14px;
            transition: background-color 0.3s ease;
            box-shadow: 0 2px 5px rgba(0,0,0,0.12);
        }

        .edit-btn { background-color: #007bff; }
        .edit-btn:hover { background-color: #0056b3; }

        .delete-btn { background-color: #dc3545; }
        .delete-btn:hover { background-color: #a71d2a; }

        .cart-btn { background-color: #28a745; }
        .cart-btn:hover { background-color: #1e7e34; }

        .add-btn { background-color: #17a2b8; }
        .add-btn:hover { background-color: #117a8b; }

        .view-btn { background-color: #6c757d; }
        .view-btn:hover { background-color: #565e64; }
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
    </style>
</head>
<body>


<c:if test="${not empty loggedInUser}">
    <div class="welcome-banner">
        Welcome ${loggedInUser.username},
        <c:if test="${loggedInUser.role == 'ADMIN'}">
            have a great day managing your products!
        </c:if> <a href="/logout" class="logout-btn">Logout</a>
    </div>
</c:if>

<h2 align="center">Product Catalog</h2>
<div class="header-buttons">
    <c:if test="${loggedInUser.role == 'ADMIN'}">
        <form action="/products/add">
            <button class="btn add-btn" type="submit">Add New Product</button>
        </form>
    </c:if>

    <!-- Link to View Cart (Only for User) -->
    <c:if test="${loggedInUser.role != 'ADMIN'}">
        <a href="/cart" class="btn btn-secondary mt-3 float-right">View Cart</a>
    </c:if>
</div>

<div class="card-container">
    <c:forEach var="product" items="${products}">
        <div class="card">
            <!-- Changed image tag to match your first JSP -->
            <img src="${product.imagePath}" alt="${product.name}" />

            <h3>${product.name}</h3>
            <p>${product.description}</p>
            <div class="price">₹${product.price}</div>
            <p>Quantity: ${product.quantity}</p>

            <c:if test="${loggedInUser.role == 'ADMIN'}">
				<!-- Admin Actions (Edit & Delete) -->
				
				<!-- Edit Button -->
				<a href="/products/edit/${product.id}" class="btn edit-btn">Edit</a>

				<!-- Delete Button -->
				<a href="/products/delete/${product.id}" class="btn delete-btn" onclick="return confirm('Are you sure you want to delete this product?');">Delete</a>

            </c:if>

            <c:if test="${loggedInUser.role != 'ADMIN'}">
                <form action="cart/add" method="post">
                    <input type="hidden" name="id" value="${product.id}" />
                    <input type="number" name="quantity" value="1" min="1" max="${product.quantity}" required />
                    <button type="submit" class="btn cart-btn">Add to Cart</button>
                </form>
            </c:if>
        </div>
    </c:forEach>
</div>

</body>
</html>
