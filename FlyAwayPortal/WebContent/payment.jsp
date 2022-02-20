
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

<%@page import="com.flyaway.dao.DateUtils"%>
<%@page import="java.util.Date"%>
<%@page import="com.flyaway.dao.CustomerDAO"%>
<%@page import="com.flyaway.model.Reservation"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<% 
double totalFare = (double)session.getAttribute("totalfare");
Date date = new Date();
String dateStr = DateUtils.formatDate(date);
%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">

<title>Fly Away</title>

</head>

<body>

	<!-- header -->
	<header class="d-flex align-items-center">

		<!-- navbar -->
		
			<a  href="customerdetails.jsp"><i
				></i></a>
			

			<div >
				
					<a href="customerdetails.jsp"
						>Customer Details  |</a>
					<a href="changepassword.jsp"
						class="nav-link">Change Password |</a>
					<a
						 href="Logout"><i
							></i> logout</a>

				

			</div>
	
		<!-- Navigation -->
	</header>
	<!--Header-->

	<div class="container-fluid">

		<div class="row justify-content-center">

			<div class="col-12 col-md-6 col-sm-6">
				<form class="form-container" id="payment-form"
					style="background: rgba(255, 255, 255, 0.8)"
					action="confirmpayment" method="post">
					<h3
						class="text-center py-4 text-dark banner-heading font-weight-bold">Payment
						Form</h3>

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



					<div class="form-group  has-feedback">
						<label for="cardName" class="text-dark font-weight-bold">Card
							Holder Name</label> <input name="cardname" type="text"
							class="form-control" id="cardName"
							placeholder="Enter Card Holder Name">
						<div class="invalid-feedback font-weight-bold" id="cError"></div>
					</div>

					<div class="form-group  has-feedback">
						<label for="cardNo" class="text-dark font-weight-bold">Card
							Number</label> <input name="cardno" type="text" class="form-control"
							id="cardNo" placeholder="Enter Card Number">
						<div class="invalid-feedback font-weight-bold" id="nError"></div>
					</div>

					<div class="form-group  has-feedback">
						<label for="totalFare" class="text-dark font-weight-bold">Total
							Amount to be Paid</label> <input name="totalfare" type="text"
							class="form-control" id="totalFare" value=<%= totalFare %>
							readonly>
						<div class="invalid-feedback font-weight-bold" id="tError"></div>
					</div>

					<input type="hidden" value=<%= dateStr %> name="paymentdate">

					<button type="button" class="btn btn-primary btn-block "
						id="paybtn">Confirm Payment</button>

				</form>
			</div>
		</div>
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


	<script>
//Card Name Validation  ==============================================================================

let nameError = '';

function validateCardName(id) {
  if (isEmptyCardName(id)) {
    document.getElementById('cError').textContent = nameError;
    return false;
  } else if (regexValidateCN(id)) {
    document.getElementById('cError').textContent = nameError;
    return false;
  } else {
    document.getElementById(id).classList.remove('is-invalid');
    document.getElementById('cError').remove;
    return true;
  }
}

function isEmptyCardName(id) {
  let element = document.getElementById(id);
  if (element.value == null || element.value == "" || element.value.trim() == "") {
    element.classList.add('is-invalid');
    nameError = `Card Holder Name cannot be empty`;
    return true;
  } else {
    return false;
  }
}

function regexValidateCN(id) {
  var alphaExp = /^[a-zA-Z]+$/;
  let element = document.getElementById(id);
  if (alphaExp.test(element.value)) {
    return false;
  } else {
    element.classList.add('is-invalid');
    nameError = `Please enter a valid Card Holder Name (only Alphabets)`;
    return true;
  }
}


// Card Number Validation


let cnError = '';

  function validateCard(id) {
    if (isEmptyCard(id)) {
      document.getElementById('nError').textContent = cnError;
      return false;
    } else if (regexValidateCard(id)) {
      document.getElementById('nError').textContent = cnError;
      return false;
    } else {
      document.getElementById(id).classList.remove('is-invalid');
      document.getElementById('nError').remove;
      return true;
    }
  }

  function isEmptyCard(id) {
    let element = document.getElementById(id);
    if (element.value == null || element.value == "" || element.value.trim() == "") {
      element.classList.add('is-invalid');
      cnError = `Card Number cannot be empty`;
      return true;
    } else {
      return false;
    }
  }

  function regexValidateCard(id) {
    var alphaExp = /^[0-9]+$/;
    let element = document.getElementById(id);
    if (alphaExp.test(element.value)) {
      return false;
    } else {
      element.classList.add('is-invalid');
      cnError = `Please enter a valid Card Number (Only Digits (0-9)))`;
      return true;
    }
  }

  $(document).ready(

		    function () {

		      $("#paybtn").click(function () {
		        if (
		        		validateCardName('cardName')&&
		        		validateCard('cardNo')) {
		          $("form#payment-form").submit();
		        }
		      });
		    });

  


</script>

</body>
</html>
<% } %>