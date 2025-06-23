<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
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

    .header-user {
        font-size: 18px;
        color: #4fd1c5;
        margin-right: 20px;
    }

    .actions a {
        padding: 8px 18px;
        background-color: #4fd1c5;
        color: #1a1f36;
        text-decoration: none;
        font-weight: 600;
        border-radius: 5px;
        transition: background-color 0.3s ease;
    }

    .actions a:hover {
        background-color: #38b2ac;
    }
</style>

<div class="header">
    <div class="header-title">Ecommerce </div>

    <div style="display: flex; align-items: center;">
        <c:if test="${loggedInUser != null}">
            <div class="header-user">
                Welcome, <strong>${loggedInUser.username}</strong>
            </div>
        </c:if>

        <div class="actions">
            <a href="/logout">Logout</a>
        </div>
    </div>
</div>
