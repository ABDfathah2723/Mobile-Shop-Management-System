<%@ page import="java.sql.*" %>
<%@ page import="com.mobileshop.DBConnection" %>

<%
String role = (String)session.getAttribute("role");
%>

<%
if(session.getAttribute("admin")==null){

	response.sendRedirect("login.jsp");

}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Mobiles</title>

<link
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>

*{
	margin:0;
	padding:0;
	box-sizing:border-box;
	font-family:Arial;
}

body{

	background:
	linear-gradient(rgba(0,0,0,.7),
	rgba(0,0,0,.7)),

	url('https://images.unsplash.com/photo-1511707171634-5f897ff02aa9');

	background-size:cover;
	background-position:center;
	background-attachment:fixed;

	min-height:100vh;

	color:white;
}

/* NAVBAR */

.navbar{

	background:rgba(0,0,0,.5)!important;

	backdrop-filter:blur(10px);

	padding:15px;

	border-radius:20px;

	margin:20px;

	box-shadow:0 8px 25px rgba(0,0,0,.4);
}

.navbar-brand{

	font-size:28px;
	font-weight:bold;

	color:#00ffd5!important;
}

.nav-link{

	color:white!important;

	font-size:17px;

	margin-left:15px;

	transition:.3s;
}

.nav-link:hover{

	color:#00ffd5!important;

	transform:translateY(-2px);
}

/* MAIN BOX */

.main-box{

	background:rgba(255,255,255,.1);

	backdrop-filter:blur(15px);

	padding:35px;

	border-radius:30px;

	box-shadow:0 10px 35px rgba(0,0,0,.5);

	animation:fadeIn 1s ease;
}

@keyframes fadeIn{

	from{
		opacity:0;
		transform:translateY(-20px);
	}

	to{
		opacity:1;
		transform:translateY(0);
	}
}

/* TITLE */

.page-title{

	text-align:center;

	font-size:50px;

	font-weight:bold;

	color:#00ffd5;

	margin-bottom:35px;
}

/* SEARCH BOX */

.search-box{

	background:rgba(255,255,255,.08);

	padding:20px;

	border-radius:20px;

	margin-bottom:30px;
}

.form-control{

	height:50px;

	border:none;

	border-radius:15px;

	background:rgba(255,255,255,.15);

	color:white;
}

.form-control::placeholder{
	color:#ddd;
}

.form-control:focus{

	box-shadow:0 0 12px #00ffd5;

	background:rgba(255,255,255,.2);

	color:white;
}

/* TABLE */

.table{

	border-radius:20px;

	overflow:hidden;

	background:white;
}

.table th{

	background:#111827;

	color:white;

	font-size:17px;
}

.table td{

	vertical-align:middle;

	font-weight:bold;
}

.table tbody tr:hover{

	background:#e0f7fa;

	transform:scale(1.01);

	transition:.2s;
}

/* BUTTONS */

.btn{

	border-radius:12px;

	font-weight:bold;

	transition:.3s;
}

.btn:hover{

	transform:translateY(-2px);
}

/* FOOTER */

.footer{

	text-align:center;

	margin-top:30px;

	font-size:18px;

	opacity:.8;
}

i{
	margin-right:8px;
}

</style>

</head>

<body>

<!-- NAVBAR -->

<nav class="navbar navbar-expand-lg navbar-dark">

<div class="container-fluid">

<a class="navbar-brand" href="#">
	<i class="fa-solid fa-mobile-screen"></i>
	ASAF MOBILES
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
	<a class="nav-link"
	href="<%= role.equals("admin")
	? "dashboard.jsp"
	: "userdashboard.jsp" %>">

	<i class="fa-solid fa-house"></i>
	Home

	</a>
</li>

<li class="nav-item">
	<a class="nav-link active"
	href="view.jsp">

	<i class="fa-solid fa-eye"></i>
	View Mobiles

	</a>
</li>

<li class="nav-item">
	<a class="nav-link"
	href="<%= role.equals("admin")
	? "allorders.jsp"
	: "myorders.jsp" %>">

	<i class="fa-solid fa-cart-shopping"></i>
	Orders

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

<!-- MAIN CONTENT -->

<div class="container mt-4">

	<div class="main-box">

		<h1 class="page-title">

			<i class="fa-solid fa-mobile-screen-button"></i>

			Mobile Inventory

		</h1>

		<!-- SEARCH -->

		<div class="search-box">

			<form method="get">

				<div class="row g-3">

					<div class="col-md-10">

						<input type="text"
						name="search"
						class="form-control"
						placeholder="Search Mobile Brand..."

						value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>">

					</div>

					<div class="col-md-2">

						<button class="btn btn-info w-100 h-100">

							<i class="fa-solid fa-magnifying-glass"></i>

							Search

						</button>

					</div>

				</div>

			</form>

		</div>

		<!-- TABLE -->

		<div class="table-responsive">

			<table class="table table-bordered table-hover text-center">

				<thead>

					<tr>

						<th>ID</th>
						<th>Brand</th>
						<th>Model</th>
						<th>Price</th>
						<th>Qty</th>
						<th>RAM</th>
						<th>Storage</th>
						<th>Color</th>
						<th>Action</th>

					</tr>

				</thead>

				<tbody>

				<%

				Connection con = DBConnection.getConnection();

				String search = request.getParameter("search");

				PreparedStatement ps;

				if(search != null && !search.trim().equals("")){

					ps = con.prepareStatement(
					"select * from mobiles where brand like ?");

					ps.setString(1, "%" + search + "%");

				}else{

					ps = con.prepareStatement(
					"select * from mobiles");

				}

				ResultSet rs = ps.executeQuery();

				while(rs.next()){
				%>

				<tr>

					<td><%= rs.getInt("id") %></td>

					<td><%= rs.getString("brand") %></td>

					<td><%= rs.getString("model") %></td>

					<td>
					&#8377;<%= rs.getDouble("price") %>
					</td>

					<td><%= rs.getInt("quantity") %></td>

					<td><%= rs.getString("ram") %></td>

					<td><%= rs.getString("storage") %></td>

					<td><%= rs.getString("color") %></td>

					<td>

					<%
					if(role.equals("admin")){
					%>

						<a href="edit.jsp?id=<%=rs.getInt("id")%>"
						class="btn btn-warning btn-sm">

						<i class="fa-solid fa-pen"></i>

						Edit

						</a>

						<a href="delete?id=<%=rs.getInt("id")%>"
						class="btn btn-danger btn-sm"

						onclick="return confirm('Delete this mobile?')">

						<i class="fa-solid fa-trash"></i>

						Delete

						</a>

					<%
					}else{
					%>

						<a href="order.jsp?id=<%=rs.getInt("id")%>"
						class="btn btn-primary btn-sm">

						<i class="fa-solid fa-cart-shopping"></i>

						Order

						</a>

					<%
					}
					%>

					</td>

				</tr>

				<%
				}

				con.close();
				%>

				</tbody>

			</table>

		</div>

		<!-- ADD BUTTON -->

		<div class="text-center mt-4">

			<%
			if(role.equals("admin")){
			%>

			<a href="add.jsp"
			class="btn btn-success btn-lg">

				<i class="fa-solid fa-plus"></i>

				Add New Mobile

			</a>

			<%
			}
			%>

		</div>


	</div>

</div>

<script
src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>

</body>
</html>