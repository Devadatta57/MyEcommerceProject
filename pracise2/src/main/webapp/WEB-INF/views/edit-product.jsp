<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Edit Product</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            padding: 40px;
        }

        .container {
            max-width: 500px;
            margin: auto;
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="number"],
        textarea,
        input[type="file"] {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
        }

        textarea {
            resize: vertical;
        }

        button {
            margin-top: 20px;
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }

        .current-image {
            margin-top: 10px;
            text-align: center;
        }

        .current-image img {
            max-width: 100%;
            height: auto;
            border-radius: 6px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Edit Product</h2>

	Welcome, <c:out value="${loggedInUser.username}" />

    <form action="/products/update/${product.id}" method="post" enctype="multipart/form-data">
        <!-- Hidden ID field -->
        <input type="hidden" name="id" value="${product.id}" />

        <label for="name">Name:</label>
        <input type="text" name="name" id="name" value="${product.name}" required />

        <label for="price">Price (₹):</label>
        <input type="number" name="price" id="price" value="${product.price}" step="0.01" required />

        <label for="description">Description:</label>
        <textarea name="description" id="description" rows="4">${product.description}</textarea>

        <label for="quantity">Quantity:</label>
        <input type="number" name="quantity" id="quantity" value="${product.quantity}" min="0" required />

        <label for="imageFile">Update Image:</label>
        <input type="file" name="imageFile" id="imageFile" />

        <c:if test="${not empty product.imagePath}">
            <div class="current-image">
                <p>Current Image:</p>
                <img src="${product.imagePath}" alt="${product.name}" />
            </div>
        </c:if>

        <button type="submit">Update Product</button>
    </form>
</div>

</body>
</html>
