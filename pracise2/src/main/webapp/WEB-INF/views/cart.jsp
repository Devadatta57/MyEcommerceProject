<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Shopping Cart</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center">Your Shopping Cart</h2>

    <c:if test="${not empty cartItems}">
        <table class="table table-bordered mt-4">
            <thead class="thead-dark">
                <tr>
                    <th>ID</th>
                    <th>Product Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${cartItems}">
                    <tr>
                        <td>${item.products.id}</td>
                        <td>${item.products.name}</td>
                        <td>${item.price}</td>
                        <td>
                            <form action="cart/update" method="post" class="form-inline">
                                <input type="hidden" name="id" value="${item.products.id}">
                                <input type="number" name="quantity" value="${item.quantity}" min="1" class="form-control mr-2" style="width: 80px;">
                                <button type="submit" class="btn btn-primary btn-sm">Update</button>
                            </form>
                        </td>
                        <td>
                            <form action="cart/update" method="post">
                                <input type="hidden" name="id" value="${item.products.id}">
                                <input type="hidden" name="quantity" value="0">
                                <button type="submit" class="btn btn-danger btn-sm">Remove</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <h4 class="text-right">Total Price: Rs ${totalPrice}</h4>
        <div class="text-right">
            <a href="/checkout" class="btn btn-success">Proceed to Checkout</a>
        </div>
    </c:if>

    <c:if test="${empty cartItems}">
        <p class="text-center mt-5">Your cart is empty. <a href="/products">Shop Now</a></p>
    </c:if>

    <div class="mt-4">
        <a href="/products" class="btn btn-secondary">Continue Shopping</a>
    </div>
</div>
</body>
</html>
