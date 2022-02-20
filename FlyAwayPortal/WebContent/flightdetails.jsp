
<% 
 if(request.getSession().getAttribute("traveldate") == null){
	 response.sendRedirect("index.jsp");
 }else if(request.getSession().getAttribute("traveldate")!=null){ 
 %>
<% Integer customerId = (Integer)session.getAttribute("customerId"); %>

<%@page import="com.flyaway.model.Airport"%>
<%@page import="com.flyaway.dao.DateUtils"%>
<%@page import="java.util.Date"%>
<%@page import="com.flyaway.model.Flight"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://fonts.googleapis.com/css?family=Lato:100,300,400,700,900"
	rel="stylesheet">
<link rel="icon" href="images/header-logo.png">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/login.css">

<title>Fly Away</title>

</head>
<body>

	<!-- header -->
	<header class="d-flex align-items-center">
		<!-- navbar -->
		
			<a  href="index.jsp"><i
				></i></a>
			

			<div>
				<%if (customerId == null){ %>
				
					<a href="index.jsp" class="nav-link">Home|</a>
					
					<a href="adminlogin.jsp" class="nav-link">Admin
							Login|</a>
					<a href="login.jsp" class="nav-link">Customer
							Login</a>
				

				<%}else if(customerId != null){ %>

				
					<a href="customerdetails.jsp"
						class="nav-link">Customer Details</a>
					<a href="changepassword.jsp"
						class="nav-link">Change Password</a>
					<a
						class="text-uppercase text-center p-1 nav-link" href="Logout"><i
							class="fas fa-sign-out-alt fa-2x pr-1 "></i> logout</a>
				

				<% } %>

			</div>
		
		<!-- Navigation -->
	</header>
	<!--Header-->

	<div class="container p-5 m-5">

		<%
        		String fail = (String)request.getAttribute("FAIL");
                if(fail != null){		
        	%>
		<div
			class="alert alert-danger alert-dismissible fade show text-center font-weight-bold"
			role="alert">
			<%= fail %>
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<%}%>

		<%
        		String fail1 = (String)request.getAttribute("FAIL1");
                if(fail1 != null){		
        	%>
		<div
			class="alert alert-danger alert-dismissible fade show text-center font-weight-bold"
			role="alert">
			<%= fail1 %>
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<%}%>



		<table id="BasicExample"
			class="table table-striped table-hover table-light table-bordered">
			<thead class="thead-dark">
				<tr>
					<th class="th text-center py-3">Flight Number</th>
					<th class="th text-center py-3">Airline</th>
					<th class="th text-center py-3">Travel Date</th>
					<th class="th text-center py-3">Source</th>
					<th class="th text-center py-3">Destination</th>
					<th class="th text-center py-3"></th>
				</tr>
			</thead>

			<tbody>
				<% 
         String date = (String)session.getAttribute("traveldate");
         String day = (String)session.getAttribute("day");
         Airport srcAirport = (Airport)request.getAttribute("sourceairport");
         Airport destAirport = (Airport)request.getAttribute("destairport");
         List<Flight> flightList = (List<Flight>)request.getAttribute("flightlist");
         if(flightList != null) {
         for(Flight f: flightList){
  		 %>
				<tr class="text-center">
					<td class="py-3"><%= f.getFlightNumber() %></td>
					<td class="py-3"><%= f.getAirline() %></td>
					<td class="py-3"><%= date %> ( <%= day %> )</td>
					<td class="py-3"><%= srcAirport.getAirport()  %> ( <%= srcAirport.getAirportCode() %>
						) <b> <%= srcAirport.getCountryCode() %>
					</b></td>
					<td class="py-3"><%= destAirport.getAirport() %> ( <%= destAirport.getAirportCode() %>)
						<b> <%= destAirport.getCountryCode() %>
					</b></td>
					<td class="py-3"><form action="showfaredetails" method="post">
							<input name="flightnumber" value="<%= f.getFlightNumber() %>"
								type="hidden"> <input class="btn btn-primary"
								type="submit" value="Book Tickets" />
						</form></td>
				</tr>
				<%} }%>
			</tbody>
		</table>
	</div>

	


	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="https://use.fontawesome.com/releases/v5.5.0/js/all.js"></script>

</body>
</html>

<% } %>