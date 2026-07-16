<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mobile Matrix Signup</title>

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

	height:100vh;

	display:flex;
	justify-content:center;
	align-items:center;

	background:
	linear-gradient(rgba(0,0,0,.5),
	rgba(0,0,0,.5)),

	url('https://images.unsplash.com/photo-1511707171634-5f897ff02aa9');

	background-size:cover;
	background-position:center;

	overflow:hidden;
}

/* BLUR CIRCLES */

.circle1,
.circle2,
.circle3{

	position:absolute;
	border-radius:50%;
	filter:blur(40px);
	opacity:.5;
}

.circle1{
	width:250px;
	height:250px;
	background:#00ffd5;
	top:50px;
	left:80px;
}

.circle2{
	width:300px;
	height:300px;
	background:#7c3aed;
	bottom:50px;
	right:100px;
}

.circle3{
	width:200px;
	height:200px;
	background:#38bdf8;
	top:250px;
	right:300px;
}

/* MAIN CONTAINER */

.signup-container{

	width:950px;
	height:550px;

	display:flex;

	border-radius:30px;

	overflow:hidden;

	backdrop-filter:blur(10px);

	background:rgba(255,255,255,.08);

	box-shadow:0 10px 40px rgba(0,0,0,.5);
}

/* LEFT SIDE */

.left-side{

	width:50%;

	display:flex;
	flex-direction:column;

	justify-content:center;
	align-items:center;

	padding:40px;

	color:white;

	text-align:center;
}

.left-side h1{

	font-size:55px;
	font-weight:bold;

	color:#00ffd5;

	margin-bottom:15px;
}

.left-side p{
	font-size:20px;
	opacity:.9;
}

.mobile-img{

	width:90%;
	margin-top:30px;

	filter:drop-shadow(0 10px 20px rgba(0,0,0,.5));
}

/* RIGHT SIDE */

.right-side{

	width:50%;

	background:rgba(255,255,255,.12);

	backdrop-filter:blur(15px);

	display:flex;
	justify-content:center;
	align-items:center;
}

.signup-card{

	width:80%;

	padding:40px;

	border-radius:25px;

	background:rgba(255,255,255,.1);

	box-shadow:0 8px 25px rgba(0,0,0,.3);

	color:white;
}

.signup-card h2{

	text-align:center;

	font-size:42px;

	font-weight:bold;

	margin-bottom:30px;
}

.form-control{

	height:50px;

	border:none;

	border-radius:12px;

	margin-bottom:20px;
}

.form-control:focus{

	box-shadow:0 0 10px #00ffd5;
	border:none;
}

.btn-signup{

	height:50px;

	border:none;

	border-radius:12px;

	background:#00ffd5;

	color:black;

	font-size:20px;
	font-weight:bold;

	transition:.3s;
}

.btn-signup:hover{

	background:white;

	transform:scale(1.03);
}

.login-link{

	text-align:center;
	margin-top:20px;
}

.login-link a{

	color:#00ffd5;
	text-decoration:none;
	font-weight:bold;
}

.login-link a:hover{
	color:white;
}

</style>

</head>

<body>

<div class="circle1"></div>
<div class="circle2"></div>
<div class="circle3"></div>

<div class="signup-container">

	<!-- LEFT SIDE -->

	<div class="left-side">
<br>
		<h1>ASAF MOBILE</h1>

		<p>
			Create Your Account & Explore Mobiles
		</p>

		<img
		src="https://cdn-icons-png.flaticon.com/512/3659/3659899.png"
		class="mobile-img">

	</div>

	<!-- RIGHT SIDE -->

	<div class="right-side">

		<div class="signup-card">

			<h2>

				<i class="fa-solid fa-user-plus"></i>

				Sign Up

			</h2>

			<form action="signup" method="post">

				<input type="text"
				name="username"
				placeholder="Enter Username"
				class="form-control"
				required>

				<input type="password"
				name="password"
				placeholder="Enter Password"
				class="form-control"
				required>

				<input type="hidden"
				name="role"
				value="user">

				<button class="btn btn-signup w-100">

					<i class="fa-solid fa-user-check"></i>

					Create Account

				</button>

			</form>

			<div class="login-link">

				Already have account ?

				<a href="login.jsp">

					Login

				</a>

			</div>

		</div>

	</div>

</div>

</body>
</html>