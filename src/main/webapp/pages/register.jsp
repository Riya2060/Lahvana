<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Register</title>
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      margin: 0;
      padding: 0;
      background-color: #d2b48c; /* Light brown */
    }

    .container {
      max-width: 900px;
      margin: 50px auto;
      padding: 20px;
      background-color: #ffffff;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
      border-radius: 10px;
    }

    h2 {
      text-align: center;
      font-weight: bold;
      margin-bottom: 30px;
      color: #6b4f3b;
    }

    form {
      display: flex;
      flex-wrap: wrap;
      justify-content: space-between;
      gap: 20px;
    }

    .col {
      width: 100%;
      max-width: 45%;
    }

    .form-label {
      display: block;
      margin-bottom: 5px;
      font-weight: bold;
      color: #6b4f3b;
    }

    .form-control {
      width: 100%;
      padding: 10px;
      margin-bottom: 10px;
      font-size: 1rem;
      border: none;
      background-color: #333;
      color: #fff;
      border-radius: 6px;
      box-sizing: border-box;
    }

    .btn-success {
      background-color: #8b6d5c;
      color: white;
      padding: 10px 25px;
      border: none;
      border-radius: 6px;
      font-size: 1rem;
      cursor: pointer;
    }

    .btn-success:hover {
      background-color: #6b4f3b;
    }

    .text-center {
      text-align: center;
    }

    .mt-2 {
      margin-top: 0.5rem;
    }

    a {
      color: #6b4f3b;
      text-decoration: none;
    }

    a:hover {
      text-decoration: underline;
    }

    @media (max-width: 768px) {
      .col {
        max-width: 100%;
      }
    }

    .error {
      color: red;
      text-align: center;
      font-weight: bold;
    }

    .photo-field {
      width: 100%;
    }

    .form-footer {
      width: 100%;
      text-align: center;
      margin-top: 20px;
    }
  </style>
</head>
<body>
  <div class="container">
    <h2>Register</h2>

    <% String error = (String) request.getAttribute("errorMessage"); if (error != null) { %>
      <p class="error"><%= error %></p>
    <% } %>

    <form action="<%= request.getContextPath() %>/Register" method="post" enctype="multipart/form-data">
      <div class="col">
        <label class="form-label" for="first_name">First Name:</label>
        <input class="form-control" type="text" name="first_name" required />

        <label class="form-label" for="user_name">Username:</label>
        <input class="form-control" type="text" name="user_name" required />

        <label class="form-label" for="phone_number">Phone Number:</label>
        <input class="form-control" type="text" name="phone_number" required />

        <label class="form-label" for="gender">Gender:</label>
        <select class="form-control" name="gender" required>
          <option value="Male">Male</option>
          <option value="Female">Female</option>
          <option value="Other">Other</option>
        </select>
      </div>

      <div class="col">
        <label class="form-label" for="last_name">Last Name:</label>
        <input class="form-control" type="text" name="last_name" required />

        <label class="form-label" for="dob">Date of Birth:</label>
        <input class="form-control" type="date" name="dob" required />

        <label class="form-label" for="email">Email:</label>
        <input class="form-control" type="email" name="email" required />

        <label class="form-label" for="address">Address:</label>
        <input class="form-control" type="text" name="address" required />
      </div>

      <div class="col">
        <label class="form-label" for="password">Password:</label>
        <input class="form-control" type="password" name="password" required />
      </div>

      <div class="col">
        <label class="form-label" for="confirm_password">Confirm Password:</label>
        <input class="form-control" type="password" name="confirm_password" required />
      </div>

      <div class="photo-field">
        <label class="form-label" for="photo">Photo:</label>
        <input class="form-control" type="file" name="photo" required />
      </div>

      <div class="form-footer">
        <button type="submit" class="btn-success">REGISTER</button>
        <p class="mt-2">Already registered? <a href="login.jsp">Login</a></p>
      </div>
    </form>
  </div>
</body>
</html>
