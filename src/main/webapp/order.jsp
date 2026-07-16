<%@ page import="java.sql.*" %>
<%@ page import="com.mobileshop.DBConnection" %>

<%
String role =
(String)session.getAttribute("role");
%>

<%
int id = Integer.parseInt(request.getParameter("id"));

Connection con = DBConnection.getConnection();

PreparedStatement ps =
con.prepareStatement("select * from mobiles where id=?");

ps.setInt(1,id);

ResultSet rs = ps.executeQuery();

rs.next();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Mobile</title>

<link
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">

<style>
body{
	background:linear-gradient(135deg,#141e30,#243b55);
	font-family:Arial;
	color:white;
	padding:50px;
}

.box{
	background:white;
	color:black;
	padding:30px;
	border-radius:20px;
	width:500px;
	margin:auto;
}
</style>

</head>
<body>

<div class="box">

<h2 class="text-center mb-4">Order Mobile</h2>

<form action="order" method="post">

<input type="hidden"
name="mobile_name"
value="<%=rs.getString("brand")%> <%=rs.getString("model")%>">

<input type="hidden"
name="mobile_id"
value="<%=rs.getInt("id")%>">

<input type="hidden"
name="price"
value="<%=rs.getDouble("price")%>">

<div class="mb-3">
<label>Model</label>

<input type="text"
class="form-control"
value="<%=rs.getString("brand")%> <%=rs.getString("model")%>"
readonly>
</div>

<div class="mb-3">
<label>Price</label>

<input type="text"
class="form-control"
value="<%=rs.getDouble("price")%>"
readonly>
</div>

<div class="mb-3">
<label>Quantity</label>

<input type="number"
name="quantity"
class="form-control"
required>
</div>

<button class="btn btn-primary w-100">
Place Order
</button>

</form>

</div>

</body>
</html>