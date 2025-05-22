<style>
  /* Sidebar styles */
  .sidebar {
    width: 190px;
    height: 100vh;
    background-color: #ffffff;
    border-right: 1px solid #ddd;
    padding: 20px;
    box-sizing: border-box;
    position: fixed;
    top: 0;
    left: 0;
    overflow-y: auto;
    flex: 0 0 250px;
  }

  .sidebar__title {
    color: #28a745;
    font-weight: bold;
    font-size: 1.5rem;
    margin-bottom: 1.5rem;
  }

  .sidebar__nav {
    list-style: none;
    padding: 0;
    margin: 0;
  }

  .sidebar__item {
    margin-bottom: 15px;
  }

  .sidebar__link {
    display: block;
    text-decoration: none;
    color: #2e1e4d;
    font-size: 1rem;
    padding: 8px 12px;
    border-radius: 5px;
    transition: background-color 0.2s, color 0.2s;
  }

  .sidebar__link:hover {
    background-color: #f1f2f6;
    color: #6c5ce7;
  }

  .sidebar__link.active {
    font-weight: bold;
    background-color: #f1f2f6;
    color: #6c5ce7 !important;
  }
</style>

<%
  // Get the current URI for active link highlighting
  String currentURI = request.getRequestURI();
%>

<aside class="sidebar">
  <h2 class="sidebar__title">LEHVANA</h2>
  <ul class="sidebar__nav">
    <li class="sidebar__item">
      <a href="customerdashboard.jsp"
         class="sidebar__link<%= currentURI.endsWith("customerdashboard.jsp") ? " active" : "" %>">
        Dashboard
      </a>
    </li>
    <li class="sidebar__item">
      <a href="editprofiles.jsp"
         class="sidebar__link<%= currentURI.endsWith("editprofiles.jsp") ? " active" : "" %>">
        Account
      </a>
    </li>
	<li class="sidebar__item">
	    <a href="<%= request.getContextPath() %>/user-list"
		   class="sidebar__link<%= currentURI.endsWith("/user-list.jsp") ? " active" : "" %>">
		  Users
		</a>
    </li>
    <li class="sidebar__item">
      <a href="orders.html"
         class="sidebar__link<%= currentURI.endsWith("orders.html") ? " active" : "" %>">
        Orders
      </a>
    </li>
    <li class="sidebar__item">
      <a href="reports.jsp"
         class="sidebar__link<%= currentURI.endsWith("reports.jsp") ? " active" : "" %>">
        Reports
      </a>
    </li>
    <li class="sidebar__item">
      <a href="logout.jsp"
         class="sidebar__link<%= currentURI.endsWith("logout.jsp") ? " active" : "" %>">
        Logout
      </a>
    </li>
  </ul>
</aside>