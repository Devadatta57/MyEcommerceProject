<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background: #f5f5f5; /* Light gray instead of black */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #333;
            margin: 0;
        }

        .login-box {
            background: #1e1e1e;
            padding: 30px;
            border-radius: 10px;
            border: 1px solid #ffd700;
            box-shadow: 0 0 15px rgba(255, 215, 0, 0.3);
            width: 320px;
            color: #ffd700;
        }

        .login-box h2 {
            margin-bottom: 20px;
            text-align: center;
            color: #ffd700;
        }

        .login-box input[type="text"],
        .login-box input[type="password"],
        .login-box input[type="submit"] {
            width: 100%;
            height: 45px;
            padding: 10px;
            margin: 10px 0;
            font-size: 16px;
            border-radius: 5px;
        }

        .login-box input[type="text"],
        .login-box input[type="password"] {
            background-color: #2c2c2c;
            color: #ffd700;
            border: 1px solid #ffd700;
        }

        .login-box input[type="submit"] {
            background: #ffd700;
            color: #121212;
            font-weight: bold;
            border: none;
            cursor: pointer;
        }

        .login-box input[type="submit"]:hover {
            background: #e6c200;
        }

        .create-account {
            margin-top: 15px;
            text-align: center;
        }

        .create-account a {
            color: #ffd700;
            text-decoration: none;
        }

        .create-account a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="login-box">
		<h2>Ecommerce</h2>
        <h2>Login</h2>
        <form action="login" method="post">
            <input type="text" name="username" placeholder="Username" required />
            <input type="password" name="password" placeholder="Password" required />
            <input type="submit" value="Login" />
        </form>
        <div class="create-account">
            <p>Don't have an account? <a href="/users/create">Create Account</a></p>
        </div>
    </div>
</body>
</html>
