
<%
if (request.getSession().getAttribute("customerId") == null || request.getSession().getAttribute("flightobject") == null
		|| request.getSession().getAttribute("fareobject") == null) {
	response.sendRedirect("index.jsp");
} else if (request.getSession().getAttribute("customerId") != null
		&& request.getSession().getAttribute("flightobject") != null
		&& request.getSession().getAttribute("fareobject") != null) {
%>

<%@page import="com.flyaway.model.Reservation"%>
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

<title>Fly Away</title>

</head>
<body>

	<%
	Flight flight = (Flight) session.getAttribute("flightobject");
	Fare fare = (Fare) session.getAttribute("fareobject");
	String travelDate = (String) session.getAttribute("traveldate");
	int passengers = (int) session.getAttribute("passengers");
	String day = (String) session.getAttribute("day");
	int customerId = (int) session.getAttribute("customerId");
	int bookingId = (int) session.getAttribute("bookingId");
	CustomerDAO cust = new CustomerDAO();
	Airport srcAirport = cust.getAirportObject(flight.getSource());
	Airport destAirport = cust.getAirportObject(flight.getDestination());
	Customer customer = cust.getCustomer(customerId);
	Reservation reservation = cust.getReservation(bookingId);
	String cardName = (String) session.getAttribute("cardname");
	String cardNo = (String) session.getAttribute("cardno");
	String paymentDate = (String) session.getAttribute("paymentdate");
	%>


	
	<header>
		
		
			<a  href="customerdetails.jsp">
				</a>
			

			<div>
					<a href="customerdetails.jsp"
						class="nav-link">Customer Details</a>
					<a href="changepassword.jsp"
						class="nav-link">Change Password</a>
					<a
						 href="Logout">
							 logout</a>
				

			</div>
		

			</header>
	<!--Header-->

	<section class="mt-4">
		<a href="bookflight.jsp" class="btn btn-primary pl-3 ml-3 mt-5">Book
			a new Journey</a>

		<h2
			class="text-center text-uppercase text-primary font-weight-bold pt-3 mt-3">Ticket
			Details</h2>

		<div class="container jumbotron py-2">
			<dl class="row pt-3">

				<dt class="col-sm-3">Booking Id:</dt>
				<dd class="col-sm-9"><%=reservation.getBookingId()%></dd>

				<dt class="col-sm-3">Flight Number:</dt>
				<dd class="col-sm-9"><%=flight.getFlightNumber()%></dd>

				<dt class="col-sm-3">Airline:</dt>
				<dd class="col-sm-9"><%=flight.getAirline()%></dd>

				<dt class="col-sm-3">Travel Class:</dt>
				<dd class="col-sm-9"><%=fare.getTravelClass()%></dd>

				<dt class="col-sm-3">Source:</dt>
				<dd class="col-sm-9"><%=srcAirport.getAirport()%>
					(<%=srcAirport.getAirportCode()%>) <b><%=srcAirport.getCountry()%></b>
				</dd>

				<dt class="col-sm-3">Destination:</dt>
				<dd class="col-sm-9"><%=destAirport.getAirport()%>
					(<%=destAirport.getAirportCode()%>) <b><%=destAirport.getCountry()%></b>
				</dd>

				<dt class="col-sm-3">Travel Date:</dt>
				<dd class="col-sm-9"><%=travelDate%>
					| <b> (<%=day%>)
					</b>
				</dd>

				<dt class="col-sm-3">No of Passengers:</dt>
				<dd class="col-sm-9"><%=passengers%></dd>

				<dt class="col-sm-3">Total Amount paid:</dt>
				<dd class="col-sm-9"><%=reservation.getTotalFare()%></dd>

				<dt class="col-sm-3">Passenger Details:</dt>
				<dd class="col-sm-9">
					<dl class="row">
						<dt class="col-sm-4">Customer Id:</dt>
						<dd class="col-sm-8"><%=customer.getCustomerId()%></dd>

						<dt class="col-sm-4">Customer Name:</dt>
						<dd class="col-sm-8"><%=customer.getFirstName()%>
							&nbsp;
							<%=customer.getLastName()%>
						</dd>

						<dt class="col-sm-4">Email Address:</dt>
						<dd class="col-sm-8"><%=customer.getEmail()%></dd>

						<dt class="col-sm-4">Phone Number:</dt>
						<dd class="col-sm-8"><%=customer.getPhone()%></dd>

					</dl>
				</dd>

				<dt class="col-sm-3">Payment Details:</dt>
				<dd class="col-sm-9">
					<dl class="row">
						<dt class="col-sm-4">Card Number:</dt>
						<dd class="col-sm-8"><%=cardNo%></dd>

						<dt class="col-sm-4">Card Holder Name:</dt>
						<dd class="col-sm-8"><%=cardName%></dd>

						<dt class="col-sm-4">Payment Date:</dt>
						<dd class="col-sm-8"><%=paymentDate%></dd>

					</dl>
				</dd>

			</dl>

			<input type="submit" class="btn btn-primary btn-block"
				value="Print Ticket" name="download" onclick="window.print()" />

		</div>

	</section>
	

	

</body>
</html>

<%
}
%>