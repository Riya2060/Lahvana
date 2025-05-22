<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String error = (String) request.getAttribute("error");
    String success = request.getParameter("success");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Customer Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0e0c6;
            margin: 0;
            padding: 30px;
        }
		.profile-details {
		    display: flex;
		    flex-direction: column;
		    align-items: center;
		    text-align: center;
		    margin-top: 20px;
		}
		
        .container {
            max-width: 800px;
            margin: auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            border: 2px solid #a19d9d;
        }

        h2 {
            text-align: center;
        }

        img.profile-pic {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid #000;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px 30px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
        }

        input, select {
            padding: 8px;
            font-size: 14px;
        }

        .buttons {
            text-align: center;
            margin-top: 20px;
        }

        button {
            padding: 10px 20px;
            font-size: 15px;
            cursor: pointer;
            margin: 5px;
        }

        .success-message, .error-message {
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 5px;
            text-align: center;
        }

        .success-message {
            background-color: #d4edda;
            color: #155724;
        }

        .error-message {
            background-color: #f8d7da;
            color: #721c24;
        }

        #phoneError, #dobError, #passwordError {
            color: red;
            font-size: 13px;
            display: none;
        }

        .row {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
            margin-bottom: 20px;
        }

        .col-md-6 {
            flex: 1;
            min-width: 300px;
        }

        .form-actions {
            text-align: center;
            margin-top: 30px;
        }
    </style>
</head>
<body>

<!-- PROFILE VIEW -->
<!-- PROFILE VIEW -->
<div id="profileView" class="container">
    <h2>Customer Profile</h2>

    <% if ("true".equals(success)) { %>
        <div class="success-message">Profile updated successfully!</div>
    <% } %>

    <!-- Centered image -->
    <div style="text-align: center;">
        <img src="<%= request.getContextPath() %>/uploads/<%= (user.getPhoto() != null && !user.getPhoto().isEmpty()) ? user.getPhoto() : "default.png" %>" 
             class="profile-pic" alt="Profile Photo">
    </div>

    <!-- ✅ New wrapper for details -->
    <div class="profile-details">
        <p><strong>First Name:</strong> <%= user.getFirst_name() %></p>
        <p><strong>Last Name:</strong> <%= user.getLast_name() %></p>
        <p><strong>Username:</strong> <%= user.getUser_name() %></p>
        <p><strong>Email:</strong> <%= user.getEmail() %></p>
        <p><strong>Phone Number:</strong> <%= user.getPhone_number() %></p>
        <p><strong>Address:</strong> <%= user.getAddress() %></p>
        <p><strong>Gender:</strong> <%= user.getGender() %></p>
        <p><strong>Date of Birth:</strong> <%= user.getDob() %></p>
    </div>

    <div class="buttons">
    <button onclick="toggleEditForm()">Edit Profile</button>
    <button onclick="window.location.href='logout.jsp'">Logout</button>
</div>


<!-- EDIT FORM VIEW -->
<div id="editFormContainer" class="container" style="display: none;">
    <h2>Edit Profile</h2>

    <% if (error != null) { %>
        <div class="error-message"><%= error %></div>
    <% } %>

    <form id="editProfileForm" action="<%= request.getContextPath() %>/profile" method="post" enctype="multipart/form-data">
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
                <label>Username:</label>
                <input type="text" name="username" value="<%= user.getUser_name() %>" required>
            </div>
            <div class="col-md-6 form-group">
                <label>Email:</label>
                <input type="email" name="email" value="<%= user.getEmail() %>" required>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6 form-group">
                <label>Phone Number:</label>
                <input type="tel" name="phone_number" pattern="\d{10}" value="<%= user.getPhone_number() %>" required oninput="validatePhoneNumber()">
                <div id="phoneError">Phone number must be exactly 10 digits.</div>
            </div>
            <div class="col-md-6 form-group">
                <label>Address:</label>
                <input type="text" name="address" value="<%= user.getAddress() %>" required>
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
                <input type="date" name="dob" id="dob" value="<%= user.getDob() %>" required oninput="validateDob()">
                <div id="dobError">Date of birth cannot be in the future.</div>
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
                <div id="passwordError">New password must be different from current password.</div>
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
            <button type="button" onclick="cancelEdit()">Cancel</button>
        </div>
    </form>
</div>

<script>
    function toggleEditForm() {
        document.getElementById('profileView').style.display = 'none';
        document.getElementById('editFormContainer').style.display = 'block';
        validateAll(); // Validate immediately on opening the form
    }

    function cancelEdit() {
        document.getElementById('editFormContainer').style.display = 'none';
        document.getElementById('profileView').style.display = 'block';
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
            toggleEditForm();
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