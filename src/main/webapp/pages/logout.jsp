<%@ page import="model.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%
    // Check if session exists and user is logged in
    HttpSession currentSession = request.getSession(false); // Don't create new session
    if (currentSession == null || currentSession.getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Logout</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
            display: flex; 
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        main {
		  margin-left: 250px;
		  padding: 30px;
		}
        

        .modal {
            display: block;
            position: fixed;
            z-index: 999;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.4);
        }

        .modal-content {
            background-color: #fff;
            margin: 15% auto;
            padding: 30px 20px;
            width: 350px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0px 4px 8px rgba(0,0,0,0.2);
        }

        .modal-content h3 {
            margin-top: 0;
            color: #333;
        }

        .modal-content p {
            color: #666;
        }

        .modal-actions {
            margin-top: 20px;
        }

        .modal-actions button {
            margin: 0 10px;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            cursor: pointer;
        }

        .modal-actions .cancel-btn {
            background-color: #ccc;
            color: #333;
        }

        .modal-actions .logout-btn {
            background-color: #e74c3c;
            color: white;
        }
    </style>
</head>
<body>
<div class="d-flex">
<%
  // Get the current URI for active link highlighting
  String currentURI = request.getRequestURI();
%>
  

<main style="margin-left: 250px; padding: 30px;">
<div id="logoutModal" class="modal">
    <div class="modal-content">
        <h3>Confirm Logout</h3>
        <p>Are you sure you want to log out?</p>
        <div class="modal-actions">
            <button class="cancel-btn" onclick="cancelLogout()">Cancel</button>
            <form action="<%= request.getContextPath() %>/Logout" method="get" style="display: inline;">
                <button type="submit" class="logout-btn">Logout</button>
            </form>
        </div>
    </div>
</div>
</main>
</div>
<script>
    function cancelLogout() {
        window.history.back(); // go back to the previous page
    }
</script>

</body>
</html>