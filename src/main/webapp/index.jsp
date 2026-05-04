<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>University Portal - Login</title>
    <link rel="stylesheet" href="CSS/global.css">
    <link rel="stylesheet" href="CSS/index.css">
</head>
<body>
    <header class="uni-header">
        <h1>University LMS</h1>
        <div>Portal Access</div>
    </header>

    <div class="login-portal">
        <h2>Member Login</h2>
        <% if(request.getParameter("error") != null) { %>
            <p style="color: red; text-align: center;">Invalid credentials or database error.</p>
        <% } %>
        <form action="login" method="post">
            <div class="form-group">
                <label for="email">University Email</label>
                <input type="email" id="email" name="email" placeholder="e.g. name@uni.com" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit" class="btn-primary">Login to Portal</button>
        </form>
        <p style="text-align: center; margin-top: 1rem; font-size: 0.9rem;">
           
        </p>
    </div>

    <footer class="uni-footer">
        &copy; 2024 University. All Rights Reserved.
    </footer>
</body>
</html>
