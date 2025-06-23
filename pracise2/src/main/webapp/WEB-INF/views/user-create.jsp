<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create User</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #000; /* Black background */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .form-box {
            background: #1e1e1e;
            padding: 30px;
            border-radius: 10px;
            border: 1px solid #ffd700;
            box-shadow: 0 0 15px rgba(255, 215, 0, 0.4);
            color: #ffd700;
            width: 350px;
        }

        .form-box h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #ffd700;
        }

        .form-box input[type="text"],
        .form-box input[type="email"],
        .form-box input[type="password"],
        .form-box input[type="number"],
        .form-box select {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            background-color: #2c2c2c;
            color: #ffd700;
            border: 1px solid #ffd700;
            border-radius: 5px;
            font-size: 14px;
        }

        .form-box input[type="submit"],
        .form-box .back-btn {
            width: 100%;
            padding: 10px;
            background: #ffd700;
            color: #121212;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
            font-size: 15px;
        }

        .form-box input[type="submit"]:hover,
        .form-box .back-btn:hover {
            background: #e6c200;
        }
    </style>
</head>
<body>
    <div class="form-box">
        <h2>Create User</h2>
        <form action="/users/create" method="post">
            <input type="text" name="username" placeholder="Username" required />
            <input type="email" name="email" placeholder="Email" required />
            <input type="password" name="password" placeholder="Password" required />
            <input type="text" name="phoneNumber" placeholder="Phone Number" required />
            <select name="role" required>
                <option value="" disabled selected>Select Role</option>
                <option value="ADMIN">ADMIN</option>
                <option value="USER">User</option>
            </select>
            <input type="submit" value="Create User" />
        </form>
        <form action="/users">
            <button type="submit" class="back-btn">Back to Users List</button>
        </form>
    </div>
</body>
</html>
