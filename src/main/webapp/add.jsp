<%
String role =
(String)session.getAttribute("role");
%>

<%
if(session.getAttribute("admin")==null){

	response.sendRedirect("login.jsp");

}
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Mobile</title>

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

/* FORM CONTAINER */

.main-container{

	display:flex;
	justify-content:center;
	align-items:center;

	padding:40px;
}

/* FORM CARD */

.form-card{

	width:650px;

	padding:40px;

	border-radius:30px;

	background:rgba(255,255,255,.1);

	backdrop-filter:blur(15px);

	box-shadow:0 10px 35px rgba(0,0,0,.5);

	animation:fadeIn 1s ease;
}

/* TITLE */

.form-title{

	text-align:center;

	font-size:45px;

	font-weight:bold;

	margin-bottom:35px;

	color:#00ffd5;
}

/* INPUTS */

.form-control{

	height:50px;

	border:none;

	border-radius:15px;

	background:rgba(255,255,255,.15);

	color:white;

	margin-bottom:20px;
}

.form-control::placeholder{
	color:#ddd;
}

.form-control:focus{

	box-shadow:0 0 12px #00ffd5;

	background:rgba(255,255,255,.2);

	color:white;
}

/* LABEL */

.form-label{

	font-size:17px;

	margin-bottom:8px;

	font-weight:bold;
}

/* BUTTON */

.btn-save{

	height:55px;

	border:none;

	border-radius:15px;

	background:#00ffd5;

	color:black;

	font-size:20px;

	font-weight:bold;

	transition:.4s;
}

.btn-save:hover{

	background:white;

	transform:scale(1.03);

	box-shadow:0 8px 20px rgba(0,255,213,.5);
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

/* ICONS */

i{
	margin-right:10px;
}

/* FOOTER */

.footer{

	text-align:center;

	margin-top:30px;

	font-size:18px;

	opacity:.8;
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
	href="dashboard.jsp">

	<i class="fa-solid fa-house"></i>
	Home

	</a>
</li>

<li class="nav-item">
	<a class="nav-link"
	href="view.jsp">

	<i class="fa-solid fa-eye"></i>
	View Mobiles

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

<!-- FORM -->

<div class="main-container">

	<div class="form-card">

		<h1 class="form-title">

			<i class="fa-solid fa-mobile-screen-button"></i>

			Add New Mobile

		</h1>

		<form action="add" method="post">

			<div class="row">

				<div class="col-md-6">

					<label class="form-label">

						Brand

					</label>

					<input type="text"
					name="brand"
					class="form-control"
					placeholder="Enter Brand"
					required>

				</div>

				<div class="col-md-6">

					<label class="form-label">

						Model

					</label>

					<input type="text"
					name="model"
					class="form-control"
					placeholder="Enter Model"
					required>

				</div>

			</div>

			<div class="row">

				<div class="col-md-6">

					<label class="form-label">

						Price

					</label>

					<input type="number"
					name="price"
					class="form-control"
					placeholder="Enter Price"
					min="1"
					required>

				</div>

				<div class="col-md-6">

					<label class="form-label">

						Quantity

					</label>

					<input type="number"
					name="quantity"
					class="form-control"
					placeholder="Enter Quantity"
					min="1"
					required>

				</div>

			</div>

			<div class="row">

				<div class="col-md-6">

					<label class="form-label">

						RAM

					</label>

					<input type="text"
					name="ram"
					class="form-control"
					placeholder="Enter RAM in GB"
					min="1"
					pattern="[0-9A-Za-z ]+"
					required>

				</div>

				<div class="col-md-6">

					<label class="form-label">

						Storage

					</label>

					<input type="text"
					name="storage"
					class="form-control"
					min="1"
					pattern="[0-9A-Za-z ]+"
					placeholder="Enter Storage in GB"
					required>

				</div>

			</div>

			<label class="form-label">

				Color

			</label>

			<input type="text"
			name="color"
			class="form-control"
			placeholder="Enter Color"
			required>

			<button type="submit"
			class="btn btn-save w-100 mt-4">

				<i class="fa-solid fa-floppy-disk"></i>

				Save Mobile

			</button>

		</form>


	</div>

</div>

<script
src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>

</body>
</html>