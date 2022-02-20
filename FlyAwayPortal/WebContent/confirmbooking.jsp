
<% 
 if(request.getSession().getAttribute("customerId") == null || 
 	request.getSession().getAttribute("flightobject") == null || 
 	request.getSession().getAttribute("fareobject") == null){
	 response.sendRedirect("index.jsp");
 }else if(request.getSession().getAttribute("customerId") != null && 
		 request.getSession().getAttribute("flightobject") != null &&
		 request.getSession().getAttribute("fareobject") != null
		 ){ 
 %>

<%@page import="com.flyaway.model.Customer"%>
<%@page import="com.flyaway.model.Airport"%>
<%@page import="com.flyaway.dao.CustomerDAO"%>
<%@page import="com.flyaway.model.Fare"%>
<%@page import="com.flyaway.model.Flight"%>
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

	<% 
Flight flight = (Flight)session.getAttribute("flightobject");
Fare fare = (Fare)session.getAttribute("fareobject");
String travelDate = (String)session.getAttribute("traveldate");
int passengers = (int)session.getAttribute("passengers");
String day = (String)session.getAttribute("day");
int customerId = (int)session.getAttribute("customerId");
CustomerDAO cust = new CustomerDAO();
Airport srcAirport = cust.getAirportObject(flight.getSource());
Airport destAirport = cust.getAirportObject(flight.getDestination());
double totalFare = cust.calculateFare(flight.getFlightNumber(), 
		fare.getTravelClass(), passengers);
Customer customer = cust.getCustomer(customerId);
session.setAttribute("totalfare", totalFare);
%>

	<!-- header -->
	<header class="d-flex align-items-center">
		<!-- navbar -->
		
			<a  href="customerdetails.jsp"><i
				></i></a>
			
			<div >
				
					<a href="customerdetails.jsp"
						class="nav-link">Customer Details</a>
					<a href="changepassword.jsp"
						class="nav-link">Change Password</a>
					<a
						 href="Logout"><i
							></i> logout</a>
				

			</div>
		

		<!-- Navigation -->
	</header>
	<!--Header-->

	<h2
		class="text-center text-uppercase text-primary font-weight-bold pt-5 mt-5">Booking
		Details</h2>

	<%
        		String fail = (String)request.getAttribute("Error");
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

	<div>
		<ul class="row pt-3">
			<li>Flight Number:
			<%= flight.getFlightNumber() %></li>

			<li>Airline:
			<%= flight.getAirline() %></li>

			<li>Travel Class:
			<%= fare.getTravelClass() %></li>

			<li>Source:
			<%= srcAirport.getAirport() %>
				(<%= srcAirport.getAirportCode() %>) <b><%= srcAirport.getCountry() %></b>
			</li>

			<li>Destination:
			<%= destAirport.getAirport() %>
				(<%= destAirport.getAirportCode() %>) <b><%= destAirport.getCountry() %></b>
			</li>

			<li>Travel Date:
			<%= travelDate %>
				| <b>(<%= day %>)
				</b>
			</li>

			<li>No of Passengers:
			<%= passengers %></li>

			<li>Total Amount to be paid:
			<%= fare.getFare() %>
				<span>&#215;</span>
				<%= passengers %>
				<span>&#61;</span>
				<%= totalFare %>
			</li>
</ul>

			<ul >Passenger Details:
			
					<li>Customer Id:
					<%= customer.getCustomerId() %></li>

					<li>Customer Name:
					<%= customer.getFirstName() %>
						&nbsp;
						<%= customer.getLastName() %>
					</li>

					<li>Email Address:
					<%= customer.getEmail() %></li>

					<li>Phone Number:
					<%=customer.getPhone() %></li>

				
		
		</ul>

		<form class="pb-3" action="confirmbooking" method="post">
			<input class="btn btn-primary btn-block" type="submit"
				value="Confirm Booking" />
		</form>
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