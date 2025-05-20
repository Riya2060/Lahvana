<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Login</title>
  <style>
  .error {
            color: red;
            font-weight: bold;
        }
    body {
      font-family: 'Segoe UI', sans-serif;
      background-color: #d2b48c;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
    .login-container {
      background-color: #ffffff;
      padding: 30px;
      border-radius: 10px;
      width: 350px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    }
    .login-form h2 {
      margin-bottom: 8px;
      color: #6b4f3b;
      font-size: 24px;
      text-align: center;
    }
    .login-form p {
      font-size: 13px;
      margin-bottom: 20px;
      color: #666;
      text-align: center;
    }
    .login-form input {
      width: 100%;
      padding: 10px;
      margin-bottom: 14px;
      border: none;
      background-color: #333;
      color: #fff;
      border-radius: 6px;
      font-size: 14px;
    }
    .login-form button {
      width: 100%;
      padding: 10px;
      background-color: #8b6d5c;
      color: white;
      font-weight: bold;
      border: none;
      border-radius: 6px;
      font-size: 15px;
      cursor: pointer;
    }
    .login-form button:hover {
      background-color: #6b4f3b;
    }
    .register-link {
      font-size: 12px;
      margin-top: 10px;
      text-align: center;
    }
    .register-link a {
      color: #6b4f3b;
      text-decoration: none;
    }
  </style>
</head>
<body>
  <div class="login-container">
    <form class="login-form" action="${pageContext.request.contextPath}/Login" method="post">
      <h2>Login</h2>
      <!-- Display error message if available -->
    <c:if test="${not empty errorMessage}">
        <div class="error">${errorMessage}</div>
    </c:if>
    <c:if test="${param.message == 'registered'}">
    <p style="color: green;">Registration successful. Please log in.</p>
</c:if>
      <p>Access your account</p>

      <input type="email" name="email" placeholder="Email" required>
      <input type="password" name="password" placeholder="Password" required>

      <button type="submit">LOGIN</button>

      <div class="register-link">
        <p>Don't have an account? <a href="register.jsp">Register</a></p>
      </div>
    </form>
  </div>
</body>
</html>
