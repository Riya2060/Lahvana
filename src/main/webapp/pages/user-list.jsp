<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%
    model.User loggedInUser = (model.User) session.getAttribute("user");
    if (loggedInUser == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>User List</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8fafd;
            color: #333;
            margin: 0;
            margin-left: 190px;
            padding: 20px;
            box-sizing: border-box;
        }

        .main-content {
            margin-left: 0;
            padding: 40px;
        }

        h2 {
            text-align: center;
            font-size: 2rem;
            color: #14532d;
            margin-bottom: 25px;
            font-weight: bold;
        }

        .search-container {
            display: flex;
            justify-content: flex-start;
            margin-left: 0;
        }

        .search-container label {
            margin-right: 10px;
            font-weight: 500;
        }

        .search-container input {
            padding: 10px 14px;
            width: 260px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 1rem;
            box-shadow: 0 1px 4px rgba(0,0,0,0.1);
        }

        p {
            text-align: left;
            margin-left: 0;
            margin-bottom: 20px;
        }

        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }

        table {
            width: 100%;
            table-layout: fixed;
            margin-left: 0;
            margin-top: 9px;
            background-color: white;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 12px 16px;
            text-align: left;
        }

        th {
            background-color: #ccebd8;
            color: #0f5132;
            font-weight: 600;
        }

        tr:nth-child(even) {
            background-color: #f2fdf6;
        }

        tr:hover {
            background-color: #e2f5e9;
        }

        .actions {
            text-align: center;
        }

        .actions button {
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 6px 12px;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 600;
            transition: background-color 0.3s ease;
        }

        .actions button:hover {
            background-color: #bd2130;
        }

        #noResults {
            color: #d9534f;
            margin-top: 20px;
            text-align: center;
            font-weight: bold;
            display: none;
        }

        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.5);
        }

        .modal-content {
            background-color: white;
            margin: 12% auto;
            padding: 25px;
            border-radius: 8px;
            width: 350px;
            max-width: 90%;
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
            text-align: center;
        }

        .modal-content h3 {
            color: #d9534f;
            margin-bottom: 15px;
        }

        .modal-actions button {
            padding: 8px 16px;
            margin: 0 10px;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            cursor: pointer;
        }

        #cancelBtn {
            background-color: #6c757d;
            color: white;
        }

        #cancelBtn:hover {
            background-color: #5a6268;
        }

        #confirmDeleteBtn {
            background-color: #dc3545;
            color: white;
        }

        #confirmDeleteBtn:hover {
            background-color: #bd2130;
        }

        @media (max-width: 768px) {
            .main-content {
                margin-left: 0;
                padding: 20px;
            }

            table, thead, tbody, th, td, tr {
                display: block;
            }

            th {
                display: none;
            }

            td {
                position: relative;
                padding-left: 50%;
                border-bottom: 1px solid #ddd;
            }

            td::before {
                position: absolute;
                top: 12px;
                left: 12px;
                width: 45%;
                white-space: nowrap;
                font-weight: bold;
                color: #333;
                content: attr(data-label);
            }

            .actions {
                text-align: left;
            }
        }

        /* Column widths */
        th:nth-child(1), td:nth-child(1) { width: 52px; }
        th:nth-child(2), td:nth-child(2) { width: 140px; }
        th:nth-child(3), td:nth-child(3) { width: 220px; }
        th:nth-child(4), td:nth-child(4) { width: 120px; }
        th:nth-child(5), td:nth-child(5) { width: 65px; }
        th:nth-child(6), td:nth-child(6) { width: 100px; }
        th:nth-child(7), td:nth-child(7) { width: 100px; }
        th:nth-child(8), td:nth-child(8) { width: 90px; }
        th:nth-child(9), td:nth-child(9) { width: 60px; }
        th:nth-child(10), td:nth-child(10) { width: 60px; }
    </style>

    <script>
        function filterById() {
            let input = document.getElementById("idSearch").value.trim().toLowerCase();
            let table = document.getElementById("userTable");
            let rows = table.getElementsByTagName("tr");
            let found = false;

            for (let i = 1; i < rows.length; i++) {
                let userId = rows[i].cells[0].textContent.trim().toLowerCase();
                if (userId === input || input === "") {
                    rows[i].style.display = "";
                    found = true;
                } else {
                    rows[i].style.display = "none";
                }
            }

            document.getElementById("noResults").style.display = found ? "none" : "block";
        }

        document.addEventListener('DOMContentLoaded', () => {
            const modal = document.getElementById('deleteModal');
            const cancelBtn = document.getElementById('cancelBtn');
            const confirmDeleteBtn = document.getElementById('confirmDeleteBtn');
            let formToSubmit = null;

            document.querySelectorAll('.delete-btn').forEach(button => {
                button.addEventListener('click', function () {
                    formToSubmit = this.closest('form');
                    modal.style.display = 'block';
                });
            });

            cancelBtn.addEventListener('click', () => {
                modal.style.display = 'none';
                formToSubmit = null;
            });

            confirmDeleteBtn.addEventListener('click', () => {
                if (formToSubmit) {
                    formToSubmit.submit();
                }
            });

            window.addEventListener('click', (event) => {
                if (event.target === modal) {
                    modal.style.display = 'none';
                    formToSubmit = null;
                }
            });
        });
    </script>
</head>

<body>
    <div class="main-content">
        <h2>User List</h2>

        <div class="search-container">
            <label for="idSearch">Search by User ID:</label>
            <input type="text" id="idSearch" onkeyup="filterById()" placeholder="Type User ID..." />
        </div>

        <%
            java.util.List userList = (java.util.List) request.getAttribute("userList");

            if (userList != null && !userList.isEmpty()) {
        %>
            <p style="color: green;"><strong>Total Users =</strong> <%= userList.size() %></p>
        <%
            } else {
        %>
            <p style="color: red;"><strong>UserList is empty</strong></p>
        <%
            }

            if (userList != null && !userList.isEmpty()) {
        %>
        <table id="userTable">
            <thead>
                <tr>
                    <th>User ID</th>
                    <th>Full Name</th>
                    <th>Email</th>
                    <th>Username</th>
                    <th>Role</th>
                    <th>Phone</th>
                    <th>Address</th>
                    <th>DOB</th>
                    <th>Gender</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Object obj : userList) {
                        model.User user = (model.User) obj;
                %>
                <tr>
                    <td><%= user.getId() %></td>
                    <td><%= user.getFirst_name() %> <%= user.getLast_name() %></td>
                    <td><%= user.getEmail() %></td>
                    <td><%= user.getUser_name() %></td>
                    <td><%= user.getRole() %></td>
                    <td><%= user.getPhone_number() %></td>
                    <td><%= user.getAddress() %></td>
                    <td><%= user.getDob() %></td>
                    <td><%= user.getGender() %></td>
                    <td class="actions">
                        <form action="<%= request.getContextPath() %>/user-list" method="post" class="delete-form">
                            <input type="hidden" name="user_id" value="<%= user.getId() %>" />
                            <button type="button" class="delete-btn">Delete</button>
                        </form>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>

        <p id="noResults">User Not Found.</p>

        <% } %>

        <!-- Delete Confirmation Modal -->
        <div id="deleteModal" class="modal">
            <div class="modal-content">
                <h3>Confirm Delete</h3>
                <p>Are you sure you want to delete this user?</p>
                <div class="modal-actions">
                    <button id="cancelBtn">Cancel</button>
                    <button id="confirmDeleteBtn">Delete</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>