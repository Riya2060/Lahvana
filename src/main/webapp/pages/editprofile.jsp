<%@ page import="model.User" %>
<%@ page session="true" %>
<%
    User user = (User) request.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Your Profile</title>
</head>
<body>
    <h2>Edit Your Profile</h2>
    
    <form action="${pageContext.request.contextPath}/editprofile" method="post">
        <input type="hidden" name="email" value="<%= user.getEmail() %>"/>
        
        First Name: <input type="text" name="first_name" value="<%= user.getFirstname() %>" required /><br/>
        Last Name: <input type="text" name="last_name" value="<%= user.getLastname() %>" required /><br/>
        Password: <input type="password" name="password" value="<%= user.getPassword() %>" required /><br/>
        Address: <input type="text" name="address" value="<%= user.getAddress() %>" required /><br/>
        
        <input type="submit" value="Update Profile"/>
    </form>

    <p style="color:green;"><%= request.getAttribute("successMessage") != null ? request.getAttribute("successMessage") : "" %></p>
    <p style="color:red;"><%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "" %></p>
</body>
</html>
