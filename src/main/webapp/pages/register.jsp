<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Register</title>
  <style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      font-family: 'Segoe UI', sans-serif;
      background-color: #d2b48c; /* Light brown */
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .register-container {
      background-color: #ffffff;
      padding: 30px;
      border-radius: 10px;
      width: 350px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    }

    .register-form h2 {
      margin-bottom: 8px;
      color: #6b4f3b;
      font-size: 24px;
      text-align: center;
    }

    .register-form p {
      font-size: 13px;
      margin-bottom: 20px;
      color: #666;
      text-align: center;
    }

    .register-form input,
    .register-form select {
      width: 100%;
      padding: 10px;
      margin-bottom: 14px;
      border: none;
      background-color: #333;
      color: #fff;
      border-radius: 6px;
      font-size: 14px;
    }

    .register-form button {
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

    .register-form button:hover {
      background-color: #6b4f3b;
    }

    .login-link {
      font-size: 12px;
      margin-top: 10px;
      text-align: center;
    }

    .login-link a {
      color: #6b4f3b;
      text-decoration: none;
    }
  </style>
</head>
<body>
  <div class="register-container">
    <form class="register-form" action="/Testing/Register" method="post">
  <h2>Register</h2>
  <p>Create your account</p>

  <input type="text" name="first_name" placeholder="Firstname" required>
  <input type="text" name="last_name" placeholder="Lastname" required>
  <input type="email" name="email" placeholder="Email" required>
  <input type="password" name="password" placeholder="Password" required>
  <input type="password" name="confirm_password" placeholder="Confirm Password" required>
  <input type="text" name="address" placeholder="Address" required>

  <select name="role" required>
    <option value="">Select Role</option>
    <option value="customer">Customer</option>
    <option value="admin">Admin</option>
  </select>

  <button type="submit">REGISTER</button>
  <div class="login-link">
    <p>Already registered? <a href="login.jsp">Login</a></p>
  </div>
</form>
</div>
</body>
</html>

