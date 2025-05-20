<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Shop Products</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<!-- Navigation with category links -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Shop by Category</a>
  <div class="collapse navbar-collapse">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item"><a class="nav-link" href="ethnicsproducts?category_id=1">Sarees</a></li>
      <li class="nav-item"><a class="nav-link" href="ethnicsproducts?category_id=2">Lehengas</a></li>
      <li class="nav-item"><a class="nav-link" href="ethnicsproducts?category_id=3">Kurthas</a></li>
      <li class="nav-item"><a class="nav-link" href="ethnicsproducts?category_id=4">Gowns</a></li>
    </ul>
  </div>
</nav>

<div class="container my-5">
    <h2>Category: <%= request.getAttribute("category_name") %></h2>
    <div class="row">
    <%
        List<Product> products = (List<Product>) request.getAttribute("products");
        if (products != null && !products.isEmpty()) {
            for (Product p : products) {
    %>
        <div class="col-md-4 mb-4">
            <div class="card">
                <img src="<%=request.getContextPath()%>/photos/<%=p.getImage()%>" class="card-img-top" alt="<%=p.getName()%>">
                <div class="card-body">
                    <h5 class="card-title"><%=p.getName()%></h5>
                    <p class="card-text"><%=p.getDescription()%></p>
                    <p class="card-text"><strong>Price:</strong> Rs <%=p.getPrice()%></p>
                    
                    <!-- Updated Add to Cart as POST form -->
                    <form action="cartservlet" method="post" style="display:inline;">
                      <input type="hidden" name="productId" value="<%= p.getProduct_id() %>" />
                      <input type="hidden" name="quantity" value="1" />
                      <button type="submit" class="btn btn-primary">Add to Cart</button>
                    </form>

                    <a href="ViewDetails.jsp?product_id=<%= p.getProduct_id() %>" class="btn btn-success">View Details</a>
                </div>
            </div>
        </div>
    <%
            }
        } else {
    %>
        <div class="col-12">
            <p>No products available in this category.</p>
        </div>
    <%
        }
    %>
    </div>
</div>

</body>
</html>
