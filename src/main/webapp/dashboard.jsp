<%@ page import="java.sql.*" %>
<%@ page import="com.mobileshop.DBConnection" %>

<%
String role =
(String)session.getAttribute("role");
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
<title>Mobile Dashboard</title>

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

/* ANIMATED BACKGROUND CIRCLES */

.circle1,
.circle2,
.circle3{

	position:fixed;
	border-radius:50%;
	filter:blur(60px);
	opacity:.3;
	z-index:-1;

	animation:float 8s infinite alternate;
}

.circle1{
	width:250px;
	height:250px;
	background:#00ffd5;
	top:100px;
	left:50px;
}

.circle2{
	width:300px;
	height:300px;
	background:#7c3aed;
	bottom:50px;
	right:50px;
}

.circle3{
	width:200px;
	height:200px;
	background:#38bdf8;
	top:300px;
	right:300px;
}

@keyframes float{

	from{
		transform:translateY(0px);
	}

	to{
		transform:translateY(30px);
	}
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

	font-size:18px;

	margin-left:15px;

	transition:.3s;
}

.nav-link:hover{

	color:#00ffd5!important;

	transform:translateY(-2px);
}

/* TOP BANNER */

.top-banner{

	height:260px;

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

	font-size:60px;
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

/* STATS CARD */

.stats-card{

	padding:35px;

	border-radius:25px;

	text-align:center;

	backdrop-filter:blur(10px);

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

	font-size:55px;
	font-weight:bold;
}

/* DASHBOARD CARDS */

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

	backdrop-filter:blur(10px);

	animation:fadeIn 1.5s ease;
}

.card-box:hover{

	transform:translateY(-12px) scale(1.04);

	box-shadow:0 15px 35px rgba(0,0,0,.6);
}

.dashboard-title{

	text-align:center;

	font-size:55px;

	font-weight:bold;

	margin-top:50px;
	margin-bottom:20px;
}

.dashboard-subtitle{

	text-align:center;

	font-size:20px;

	opacity:.8;

	margin-bottom:50px;
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

</style>

</head>

<body>

<!-- ANIMATED CIRCLES -->

<div class="circle1"></div>
<div class="circle2"></div>
<div class="circle3"></div>

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
	href="dashboard.jsp">

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
	href="allorders.jsp">

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
			Mobile Shop Management System 
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

				Total Mobiles

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

				Total Quantity

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

				Total Value

				</h3>

				<h1>

				&#8377;<%= String.format("%.2f", totalValue) %>

				</h1>

			</div>

		</div>

	</div>

	<!-- TITLE -->

	<h1 class="dashboard-title">

		Mobile Control Panel

	</h1>

	<p class="dashboard-subtitle">

		Manage mobiles, orders and inventory efficiently

	</p>

	<!-- DASHBOARD BOXES -->

	<div class="row g-4 justify-content-center">

		<div class="col-md-4">

			<a href="add.jsp">

				<div class="card-box bg-success">

					<h2>

					<i class="fa-solid fa-plus"></i>

					Add Mobile

					</h2>

				</div>

			</a>

		</div>

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

			<a href="allorders.jsp">

				<div class="card-box bg-warning text-dark">

					<h2>

					<i class="fa-solid fa-cart-shopping"></i>

					Orders

					</h2>

				</div>

			</a>

		</div>

	</div>

	<!-- FOOTER -->

	<footer>

		Made by ABD

	</footer>

</div>

<script
src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>

</body>
</html>