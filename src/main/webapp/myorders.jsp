<%@ page import="java.sql.*" %>
<%@ page import="com.mobileshop.DBConnection" %>

<%
String role =
(String)session.getAttribute("role");
%>

<%
String username =
(String)session.getAttribute("admin");

Connection con =
DBConnection.getConnection();

PreparedStatement ps =
con.prepareStatement(
"select * from orders where username=?");

ps.setString(1, username);

ResultSet rs = ps.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Orders</title>

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

/* TITLE */

.page-title{

	text-align:center;

	font-size:50px;

	font-weight:bold;

	color:#00ffd5;

	margin-bottom:35px;
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

/* EMPTY MESSAGE */

.empty-box{

	text-align:center;

	padding:40px;

	font-size:25px;

	font-weight:bold;

	color:#00ffd5;
}

/* FOOTER */

.footer{

	text-align:center;

	margin-top:30px;

	font-size:18px;

	opacity:.8;
}

/* ANIMATION */

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
	href="userdashboard.jsp">

	<i class="fa-solid fa-house"></i>
	Home

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
	<a class="nav-link active"
	href="myorders.jsp">

	<i class="fa-solid fa-cart-shopping"></i>
	My Orders

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

<!-- CONTENT -->

<div class="container mt-4">

	<div class="main-box">

		<h1 class="page-title">

			<i class="fa-solid fa-cart-shopping"></i>

			My Orders

		</h1>

		<div class="table-responsive">

			<table class="table table-bordered table-hover text-center">

				<thead>

					<tr>

						<th>Order ID</th>
						<th>Mobile</th>
						<th>Price</th>
						<th>Quantity</th>
						<th>Total</th>
						<th>Date & Time</th>

					</tr>

				</thead>

				<tbody>

				<%
				boolean hasOrders = false;

				while(rs.next()){

				hasOrders = true;
				%>

				<tr>

					<td>
					<%=rs.getInt("order_id")%>
					</td>

					<td>
					<%=rs.getString("mobile_name")%>
					</td>

					<td>

					&#8377;<%=rs.getDouble("price")%>

					</td>

					<td>
					<%=rs.getInt("quantity")%>
					</td>

					<td>

					&#8377;<%=rs.getDouble("total")%>

					</td>
					
					<td>
					<%= rs.getTimestamp("order_date") %>
					</td>

				</tr>

				<%
				}
				%>

				</tbody>

			</table>

		</div>

		<%
		if(!hasOrders){
		%>

		<div class="empty-box">

			<i class="fa-solid fa-box-open"></i>

			No Orders Found

		</div>

		<%
		}
		%>


	</div>

</div>

<script
src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>

</body>
</html>