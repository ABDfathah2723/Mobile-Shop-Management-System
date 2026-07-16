<%@ page import="java.sql.*" %>
<%@ page import="com.mobileshop.DBConnection" %>
<%
if(session.getAttribute("admin")==null){

	response.sendRedirect("login.jsp");

}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Mobile</title>

<link
 href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
 rel="stylesheet">
 
 <link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

</head>
<body class="bg-light">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-lg rounded mb-4">

<div class="container-fluid">

<a class="navbar-brand fw-bold" href="#">
	<i class="fa-solid fa-mobile-screen"></i>
	Mobile Shop
</a>

<button class="navbar-toggler"
type="button"
data-bs-toggle="collapse"
data-bs-target="#navbarNav">

<span class="navbar-toggler-icon"></span>

</button>

<div class="collapse navbar-collapse"
id="navbarNav">

<ul class="navbar-nav ms-auto">

<li class="nav-item">
	<a class="nav-link active"
	href="dashboard.jsp">

	<i class="fa-solid fa-house"></i>
	Home

	</a>
</li>

<li class="nav-item">
	<a class="nav-link"
	href="dashboard.jsp">

	<i class="fa-solid fa-gauge"></i>
	Dashboard

	</a>
</li>

<li class="nav-item">
	<a class="nav-link"
	href="view.jsp">

	<i class="fa-solid fa-mobile-screen"></i>
	Mobiles

	</a>
</li>

<li class="nav-item">
	<a class="nav-link"
	href="allorders.jsp">

	<i class="fa-solid fa-cart-shopping"></i>
	Orders

	</a>
</li>

<li class="nav-item">
	<a class="nav-link"
	href="#">

	<i class="fa-solid fa-circle-info"></i>
	About

	</a>
</li>

<li class="nav-item">
	<a class="nav-link text-danger"
	href="login.jsp">

	<i class="fa-solid fa-right-from-bracket"></i>
	Logout

	</a>
</li>

</ul>

</div>

</div>

</nav>


<div class="container mt-5">

<%
int id = Integer.parseInt(request.getParameter("id"));

Connection con = DBConnection.getConnection();
PreparedStatement ps =
con.prepareStatement("select * from mobiles where id=?");

ps.setInt(1,id);

ResultSet rs = ps.executeQuery();
rs.next();
%>

<div class="card shadow p-4">

<h2 class="text-center mb-4">Edit Mobile</h2>

<form action="update" method="post">

<input type="hidden" name="id"
value="<%=rs.getInt("id")%>">

Brand:
<input type="text" name="brand"
value="<%=rs.getString("brand")%>"
class="form-control mb-3">

Model:
<input type="text" name="model"
value="<%=rs.getString("model")%>"
class="form-control mb-3">

Price:
<input type="number" name="price"
value="<%=rs.getDouble("price")%>"
class="form-control mb-3"
min="1">

Quantity:
<input type="number" name="quantity"
value="<%=rs.getInt("quantity")%>"
class="form-control mb-3"
min="1">

RAM:
<input type="text" name="ram"
value="<%=rs.getString("ram")%>"
class="form-control mb-3"
min="1"
pattern="[0-9A-Za-z ]+">

Storage:
<input type="text" name="storage"
value="<%=rs.getString("storage")%>"
class="form-control mb-3"
min="1"
pattern="[0-9A-Za-z ]+">

Color:
<input type="text" name="color"
value="<%=rs.getString("color")%>"
class="form-control mb-3">

<button class="btn btn-primary w-100">
	Update Mobile
</button>

</form>

</div>
</div>
<script
src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>

</body>
</html>