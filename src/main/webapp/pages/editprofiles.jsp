<%@ page import="model.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String success = request.getParameter("success");
    String error = (String) request.getAttribute("error");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f3f4f6;
            margin: 0;
            padding: 0;
            display: flex;
        }

        .d-flex {
            display: flex;
            min-height: 100vh;
        }

        #accountContainer {
            padding: 30px;
            flex-grow: 1;
            margin-left: 250px;
        }

        .container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.1);
            max-width: 1000px;
            margin: auto;
        }

        #profileHeading, #editHeading {
            margin-bottom: 30px;
            color: #2c3e50;
            font-size: 30px;
            font-weight: bold;
            border-bottom: 2px solid #eee;
            padding-bottom: 10px;
            text-align: center;
        }

        #editHeading { display: none; }

        .profile-info {
            display: flex;
            flex-direction: column;
            gap: 15px;
            width: 650px;
            align-items: center;
            margin-bottom: 20px;
        }

        .profile-info label {
            font-weight: bold;
            color: #34495e;
            font-size: 14px;
        }

        .profile-info span {
            font-size: 16px;
            color: #34495e;
        }

        .form-group input,
        .form-group select {
            padding: 10px 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
            width: 100%;
            height: 45px;
        }

        .form-group label {
            font-weight: bold;
            color: #34495e;
            font-size: 15px;
            display: block;
            margin-bottom: 6px;
        }

        .row {
            display: flex;
            gap: 20px;
            margin-bottom: 20px;
            flex-wrap: wrap;
        }

        .col-md-6 {
            flex: 1;
            min-width: 300px;
        }

        .edit-profile {
            display: none;
        }

        .edit-mode .profile-info,
        .edit-mode #profileHeading {
            display: none;
        }

        .edit-mode .edit-profile,
        .edit-mode #editHeading {
            display: block;
        }

        .success-message {
            background-color: #d4edda;
            color: #155724;
            padding: 10px;
            border: 1px solid #c3e6cb;
            border-radius: 5px;
            margin-bottom: 15px;
        }

        .alert-danger {
            margin-bottom: 15px;
            color: #b22222;
        }

        button {
            padding: 10px 20px;
            background-color: #2ecc71;
            color: white;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            margin: 5px;
        }

        button:hover {
            background-color: #27ae60;
        }

        .form-actions {
            text-align: center;
            margin-top: 30px;
        }

        .edit-only-message {
		    display: none;
		    font-size: 13px;
		    color: red;
		    text-align: center; /* Ensure the text is centered */
		    margin-top: 10px;
		    width: 100%; /* Take the full width of the parent container */
		}
		
		.edit-mode .edit-only-message {
		    display: block;
		    text-align: center; /* Ensure that text inside error messages is centered */
		    margin: 0 auto; /* Center the container itself */
		    width: 80%; /* Optionally, limit the width */
		    padding: 5px; /* Add padding for spacing */
		}

    </style>
</head>
<body>

<div class="d-flex">
<%
  // Get the current URI for active link highlighting
  String currentURI = request.getRequestURI();
%>
  
<aside class="bg-white border-end p-3" style="width: 250px; height: 100vh;">
    <h2 class="text-success fw-bold">Lehvana</h2>
    <ul class="nav flex-column mt-4">
        <li class="nav-item"><a href="admindashboard.jsp" class="nav-link text-dark">Dashboard</a></li>
        <li class="nav-item"><a href="editprofiles.jsp" class="nav-link text-dark">Account</a></li>
		<li class="sidebar__item">
	    <li class="nav-item">
		  <a href="<%= request.getContextPath() %>/user-list" 
		     class="nav-link text-dark<%= currentURI.endsWith("/user-list.jsp") ? " active" : "" %>">
		    Users
		  </a>
		</li>
        <li class="nav-item"><a href="product.jsp" class="nav-link text-dark">Products</a></li>
        <li class="nav-item"><a href="orders.jsp" class="nav-link text-dark">Orders</a></li>
        <li class="nav-item"><a href="reports.jsp" class="nav-link text-dark">Reports</a></li>
        <li class="nav-item"><a href="logout.jsp" class="nav-link text-dark">Logout</a></li>
    </ul>
</aside>

    <main class="container-box" id="accountContainer">
        <div class="container" id="profileContainer">
            <h2 id="profileHeading">Admin Profile</h2>
            <h2 id="editHeading">Edit Profile</h2>

            <form id="editProfileForm" action="<%= request.getContextPath() %>/profile" method="post" enctype="multipart/form-data">
                <div class="profile-info">
                    <% if ("true".equals(success)) { %>
                        <div class="success-message" id="successMessage">Profile updated successfully!</div>
                    <% } %>

                    <img src="uploads/<%= user.getPhoto() %>" alt="Profile Image" style="width: 100px; height: 100px; border-radius: 50%; object-fit: cover;">
                    <div><label>Full Name:</label> <span><%= user.getFirst_name() %> <%= user.getLast_name() %></span></div>
                    <div><label>Username:</label> <span><%= user.getUser_name() %></span></div>
                    <div><label>Phone Number:</label> <span><%= user.getPhone_number() %></span></div>
                    <div><label>Email:</label> <span><%= user.getEmail() %></span></div>
                    <div><label>Address:</label> <span><%= user.getAddress() %></span></div>
                    <div><label>Gender:</label> <span><%= user.getGender() %></span></div>
                    <div><label>Date of Birth:</label> <span><%= user.getDob() %></span></div>
                    <button type="button" onclick="toggleEditMode(true)">Edit Profile</button>
                </div>

                <% if (error != null) { %>
                    <div class="alert-danger"><%= error %></div>
                <% } %>

                <div class="edit-profile">
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label>First Name:</label>
                            <input type="text" name="first_name" value="<%= user.getFirst_name() %>" required>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Last Name:</label>
                            <input type="text" name="last_name" value="<%= user.getLast_name() %>" required>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label>Email:</label>
                            <input type="email" name="email" value="<%= user.getEmail() %>" required>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Phone Number:</label>
                            <input type="tel" name="phone_number" pattern="\d{10}" title="Phone number must be 10 digits" value="<%= user.getPhone_number() %>" required oninput="validatePhoneNumber()">
                            <div id="phoneError" class="edit-only-message">Phone number must be exactly 10 digits.</div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label>Address:</label>
                            <input type="text" name="address" value="<%= user.getAddress() %>" required>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Username:</label>
                            <input type="text" name="username" value="<%= user.getUser_name() %>" required>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label>Gender:</label>
                            <select name="gender" required>
                                <option value="Male" <%= "Male".equals(user.getGender()) ? "selected" : "" %>>Male</option>
                                <option value="Female" <%= "Female".equals(user.getGender()) ? "selected" : "" %>>Female</option>
                                <option value="Other" <%= "Other".equals(user.getGender()) ? "selected" : "" %>>Other</option>
                            </select>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Date of Birth:</label>
                            <input type="date" name="dob" id="dob" value="<%= user.getDob() %>" required>
                            <div id="dobError" class="edit-only-message">Date of birth cannot be in the future.</div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label>Current Password:</label>
                            <input type="password" name="current_password" id="currentPassword">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>New Password:</label>
                            <input type="password" name="new_password" id="newPassword">
                            <div id="passwordError" class="edit-only-message">New password must be different from current password.</div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label>Profile Photo:</label>
                            <input type="file" name="profile_photo" accept="image/*">
                        </div>
                    </div>

                    <div class="form-actions">
                        <button type="submit" id="saveBtn" disabled>Save Changes</button>
                        <button type="button" onclick="toggleEditMode(false)">Cancel</button>
                    </div>
                </div>
            </form>
        </div>
    </main>
</div>

<script>
    function toggleEditMode(isEditing) {
        const profileHeading = document.getElementById('profileHeading');
        const editHeading = document.getElementById('editHeading');
        const profileInfo = document.querySelector('.profile-info');
        const editProfile = document.querySelector('.edit-profile');
        const saveBtn = document.getElementById('saveBtn');

        if (isEditing) {
            profileHeading.style.display = 'none';
            editHeading.style.display = 'block';
            profileInfo.style.display = 'none';
            editProfile.style.display = 'block';
        } else {
            profileHeading.style.display = 'block';
            editHeading.style.display = 'none';
            profileInfo.style.display = 'block';
            editProfile.style.display = 'none';
        }

        validateAll();
    }

    function validatePhoneNumber() {
        const phone = document.querySelector('input[name="phone_number"]');
        const phoneError = document.getElementById("phoneError");
        if (!/^\d{10}$/.test(phone.value)) {
            phoneError.style.display = "block";
            phone.setCustomValidity("Phone number must be 10 digits.");
        } else {
            phoneError.style.display = "none";
            phone.setCustomValidity("");
        }
    }

    function validateDob() {
        const dob = document.getElementById("dob");
        const dobError = document.getElementById("dobError");
        const date = new Date(dob.value);
        if (dob.value && date > new Date()) {
            dobError.style.display = "block";
            dob.setCustomValidity("Date cannot be in the future.");
        } else {
            dobError.style.display = "none";
            dob.setCustomValidity("");
        }
    }

    function validatePasswordDifference() {
        const current = document.getElementById("currentPassword").value.trim();
        const newPass = document.getElementById("newPassword").value.trim();
        const error = document.getElementById("passwordError");

        if (current && newPass && current === newPass) {
            error.style.display = "block";
            document.getElementById("newPassword").setCustomValidity("Passwords must be different.");
        } else {
            error.style.display = "none";
            document.getElementById("newPassword").setCustomValidity("");
        }
    }

    function enableSaveIfValid() {
        const form = document.getElementById("editProfileForm");
        const saveBtn = document.getElementById("saveBtn");

        if (form.checkValidity()) {
            saveBtn.disabled = false;
        } else {
            saveBtn.disabled = true;
        }
    }

    function validateAll() {
        validatePhoneNumber();
        validateDob();
        validatePasswordDifference();
        enableSaveIfValid();
    }

    document.addEventListener("DOMContentLoaded", () => {
        if ("<%= error != null %>" === "true") {
            toggleEditMode(true);
        }

        // Validate on every input and when the page is ready
        document.querySelectorAll("#editProfileForm input, #editProfileForm select").forEach(input => {
            input.addEventListener("input", validateAll);
        });

        validateAll(); // Run validation immediately on page load
    });
</script>

</body>
</html>