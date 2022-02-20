
<%
if (request.getSession().getAttribute("customerId") != null) {
	response.sendRedirect("customerdetails.jsp");
} else if (request.getSession().getAttribute("customerId") == null) {
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!doctype html>
<html lang="en">

<head>

<meta charset="utf-8">


<title>Fly Away</title>

</head>

<body>
	<header>
		<a href="index.jsp"><i></i></a>
		<div>

			<a href="index.jsp">Home |</a> <a href="bookflight.jsp"> Book
				Flight |</a> <a href="adminlogin.jsp"> Admin Login |</a> <a
				href="login.jsp"> Customer Login</a>
		</div>
		<div class="col text-center">
			<h1>Welcome to flyaway</h1>
			<h1>Your Journey Is One Click Away</h1>
			<a href="bookflight.jsp"> Click to book flight</a>
		</div>

	</header>

</body>

</html>

<%
}
%>