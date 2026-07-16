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

<%
Connection con = DBConnection.getConnection();

Statement st = con.createStatement();

ResultSet rs1 = st.executeQuery("select count(*) from mobiles");
rs1.next();
int totalMobiles = rs1.getInt(1);

ResultSet rs2 = st.executeQuery("select sum(quantity) from mobiles");
rs2.next();
int totalQty = rs2.getInt(1);

ResultSet rs3 = st.executeQuery("select sum(price*quantity) from mobiles");
rs3.next();
double totalValue = rs3.getDouble(1);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Dashboard</title>

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

	overflow-x:hidden;
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

	font-size:30px;
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

/* TOP BANNER */

.top-banner{

	height:240px;

	margin:30px;

	border-radius:30px;

	background:
	linear-gradient(rgba(0,0,0,.6),
	rgba(0,0,0,.6)),

	url('https://images.unsplash.com/photo-1511707171634-5f897ff02aa9');

	background-size:cover;
	background-position:center;

	display:flex;
	justify-content:center;
	align-items:center;

	text-align:center;

	box-shadow:0 10px 30px rgba(0,0,0,.5);

	animation:fadeIn 1s ease;
}

.banner-content h1{

	font-size:55px;
	font-weight:bold;
}

.banner-content span{

	color:#00ffd5;
}

.banner-content p{

	font-size:22px;

	margin-top:10px;

	letter-spacing:2px;
}

/* STATS CARD */

.stats-card{

	padding:35px;

	border-radius:25px;

	text-align:center;

	box-shadow:0 10px 30px rgba(0,0,0,.4);

	transition:.4s;

	animation:fadeIn 1.2s ease;
}

.stats-card:hover{

	transform:translateY(-10px) scale(1.03);

	box-shadow:0 15px 35px rgba(0,0,0,.5);
}

.stats-card h3{

	font-size:28px;

	margin-bottom:15px;
}

.stats-card h1{

	font-size:50px;

	font-weight:bold;
}

/* DASHBOARD TITLE */

.dashboard-title{

	text-align:center;

	font-size:55px;

	font-weight:bold;

	margin-top:50px;
	margin-bottom:15px;
}

.dashboard-subtitle{

	text-align:center;

	font-size:20px;

	opacity:.8;

	margin-bottom:50px;
}

/* ACTION CARDS */

.card-box{

	height:170px;

	border-radius:25px;

	display:flex;
	align-items:center;
	justify-content:center;

	font-size:25px;
	font-weight:bold;

	box-shadow:0 10px 25px rgba(0,0,0,.4);

	transition:.4s;

	animation:fadeIn 1.5s ease;
}

.card-box:hover{

	transform:translateY(-12px) scale(1.04);

	box-shadow:0 15px 35px rgba(0,0,0,.6);
}

a{

	text-decoration:none;
	color:white;
}

i{

	margin-right:10px;
}

/* FOOTER */

footer{

	text-align:center;

	margin-top:60px;

	padding:25px;

	background:rgba(0,0,0,.5);

	backdrop-filter:blur(10px);

	font-size:18px;

	border-radius:20px;

	box-shadow:0 8px 25px rgba(0,0,0,.4);
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

</style>

</head>

<body>

<!-- NAVBAR -->

<nav class="navbar navbar-expand-lg navbar-dark">

<div class="container-fluid">

<a class="navbar-brand" href="#">
	<i class="fa-solid fa-mobile-screen"></i>
	ASAF MOBILE
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
	href="<%= role.equals("admin")
	? "dashboard.jsp"
	: "userdashboard.jsp" %>">

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
	<a class="nav-link"
	href="<%= role.equals("admin")
	? "allorders.jsp"
	: "myorders.jsp" %>">

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

<!-- TOP BANNER -->

<div class="top-banner">

	<div class="banner-content">

		<h1>

			Welcome,
			<span>
				<%=session.getAttribute("admin")%>
			</span>

		</h1>

		<p>
			Explore Latest Mobiles & Place Orders 
		</p>

	</div>

</div>

<div class="container">

	<!-- ANALYTICS -->

	<div class="row g-4 mb-5">

		<div class="col-md-4">

			<div class="stats-card bg-primary text-white">

				<h3>

				<i class="fa-solid fa-mobile-screen"></i>

				Available Mobiles

				</h3>

				<h1>
					<%= totalMobiles %>
				</h1>

			</div>

		</div>

		<div class="col-md-4">

			<div class="stats-card bg-success text-white">

				<h3>

				<i class="fa-solid fa-box"></i>

				Stock Quantity

				</h3>

				<h1>
					<%= totalQty %>
				</h1>

			</div>

		</div>

		<div class="col-md-4">

			<div class="stats-card bg-danger text-white">

				<h3>

				<i class="fa-solid fa-indian-rupee-sign"></i>

				Inventory Value

				</h3>

				<h1>

				&#8377;<%= String.format("%.2f", totalValue) %>

				</h1>

			</div>

		</div>

	</div>

	<!-- TITLE -->

	<h1 class="dashboard-title">

		User Dashboard

	</h1>

	<p class="dashboard-subtitle">

		View mobiles, order products and track your purchases

	</p>

	<!-- ACTION CARDS -->

	<div class="row g-4 justify-content-center">

		<div class="col-md-4">

			<a href="view.jsp">

				<div class="card-box bg-primary">

					<h2>

					<i class="fa-solid fa-eye"></i>

					View Mobiles

					</h2>

				</div>

			</a>

		</div>

		<div class="col-md-4">

			<a href="myorders.jsp">

				<div class="card-box bg-warning text-dark">

					<h2>

					<i class="fa-solid fa-cart-shopping"></i>

					My Orders

					</h2>

				</div>

			</a>

		</div>

	</div>

</div>

<script
src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>

</body>
</html>