<%@page import="com.flyaway.model.Airport"%>
<%@page import="java.util.List"%>
<%@page import="com.flyaway.dao.CustomerDAO"%>
<%@page import="com.flyaway.dao.DateUtils"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<% Date date = new Date();  
	String dateStr = DateUtils.formatDate(date);  
	
	Integer customerId = (Integer)session.getAttribute("customerId");
	
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
	

			<a  href="index.jsp"><i
				></i></a>
			
			<div >

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
						 href="Logout"><i
							></i> logout</a>
				

				<% } %>

			</div>
		

		
	</header>
	

	<% 
	CustomerDAO cust = new CustomerDAO();
	List<String>codeList = cust.listAirportCode();
%>

	<div class="container-fluid">

		<div class="row justify-content-center">

			<div class="col-12 col-md-8 col-sm-6">

				<form id="form-book" class="form-container"
					style="background: rgba(255, 255, 255, 0.8)" action="bookflight"
					method="post">

					<h2
						class="text-center py-4 text-dark banner-heading font-weight-bold">Journey
						Details</h2>

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

					<div class="form-row">
						<div class="form-group has-feedback">
							<label for="Source" class="text-dark font-weight-bold">From</label>
							<select class="form-control" id="Source" name="source">
								<option selected value="selected">Select</option>
								<% 
        		if(codeList.size() != 0){
        			for(String code: codeList){
        				Airport airport = cust.getAirportObject(code);
        		%>
								<option value=<%= code %>><%= airport.getAirport() %>(<%= code %>)
									<b><%= airport.getCountryCode() %></b></option>
								<% } }%>
							</select>
							<div class="invalid-feedback font-weight-bold" id="s1Error"></div>
						</div>
						<div class="form-group has-feedback pl-5 ml-5">
							<label for="Dest" class="text-dark font-weight-bold">To</label> <select
								class="form-control" id="Dest" name="destination">
								<option selected value="selected">Select</option>
								<% 
        		if(codeList.size() != 0){
        			for(String code: codeList){
        				Airport airport = cust.getAirportObject(code);
        		%>
								<option value=<%= code %>><%= airport.getAirport() %>(<%= code %>)
									<b><%= airport.getCountryCode() %></b></option>
								<% } }%>
							</select>
							<div class="invalid-feedback font-weight-bold" id="s2Error"></div>
						</div>
					</div>

					<div class="form-group  has-feedback">
						<label for="travel_date" class="text-dark font-weight-bold">Travel
							Date</label> <input name="traveldate" type="date" class="form-control"
							id="travel_date" value=<%= dateStr %> min=<%= dateStr %> />
						<div class="invalid-feedback font-weight-bold" id="dError"></div>
					</div>

					<div class="form-group has-feedback">
						<label for="passengers_no" class="text-dark font-weight-bold">No
							Of Travellers</label> <input name="passengers" type="number"
							class="form-control " placeholder="Enter No of Travellers"
							id="passengers_no">
						<div class="invalid-feedback font-weight-bold" id="tError"></div>
					</div>


					<div class="form-group mt-4 has-feedback">
						<button type="button" class="btn btn-success btn-block "
							id="searchbtn">Search Flights</button>
					</div>

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
  
//Select Validate =======================================================================================
  let sel1Error = '';

  function validateSourceSelect(id) {
    if (isEmptySourceSelect(id)) {
      document.getElementById('s1Error').textContent = sel1Error;
      return false;
    }else if(checkSameDestination(id)) {
    	document.getElementById('s1Error').textContent = sel1Error;
        return false;
    }else {
      document.getElementById(id).classList.remove('is-invalid');
      document.getElementById('s1Error').remove;
      return true;
    }
  }

  function isEmptySourceSelect(id) {
    let element = document.getElementById(id);
    if (element.value === 'selected') {
      element.classList.add('is-invalid');
      sel1Error = `Please Select an Option`;
      return true;
    } else {
      return false;
    }
  }

  function checkSameDestination(id) {
	    let Source = document.getElementById(id).value;
	    let Destination = document.getElementById('Dest').value;

	    if (Source !== Destination) {
	      return false;
	    } else {
	      document.getElementById(id).classList.add('is-invalid');
	      sel1Error = `Source Cannot be same as Destination`;
	      return true;
	    }
	  }

  

  let sel2Error = '';

  function validateDestSelect(id) {
    if (isEmptyDestSelect(id)) {
      document.getElementById('s2Error').textContent = sel2Error;
      return false;
    }else if(checkSameSource(id)) {
    	document.getElementById('s2Error').textContent = sel2Error;
        return false;
    }else {
      document.getElementById(id).classList.remove('is-invalid');
      document.getElementById('s2Error').remove;
      return true;
    }
  }

  function isEmptyDestSelect(id) {
    let element = document.getElementById(id);
    if (element.value === 'selected') {
      element.classList.add('is-invalid');
      sel2Error = `Please Select an Option`;
      return true;
    } else {
      return false;
    }
  }
  
  function checkSameSource(id) {
	    let Source = document.getElementById('Source').value;
	    let Destination = document.getElementById(id).value;

	    if (Source !== Destination) {
	      return false;
	    } else {
	      document.getElementById(id).classList.add('is-invalid');
	      sel2Error = `Destination Cannot be same as Source`;
	      return true;
	    }
	  }
  
//Date Validation
  
  let dateError = '';

   function validateDate(id) {
     if (isEmptyDate(id)) {
       document.getElementById('dError').textContent = dateError;
       return false;
     } else {
       document.getElementById(id).classList.remove('is-invalid');
       document.getElementById('dError').remove;
       return true;
     }
   }

   function isEmptyDate(id) {
     let element = document.getElementById(id);
     if (element.value == null || element.value == "") {
       element.classList.add('is-invalid');
       dateError = `Please provide a valid date`;
       return true;
     } else {
       return false;
     }
   }

  
  // Validate Number
  
  let numError = '';

   function validatePassengers(id) {
     if (checkNum(id)) {
       document.getElementById('tError').textContent = numError;
       return false;
     }else if (checkNegNumAndZero(id)){
    	 document.getElementById('tError').textContent = numError;
         return false; 
     }else {
       document.getElementById(id).classList.remove('is-invalid');
       document.getElementById('tError').remove;
       return true;
     }
   }
  
   function checkNum(id) {
	     let element = document.getElementById(id);
	     if (isNaN(element.value)) {
	       element.classList.add('is-invalid');
	       numError = `Please provide a Number`;
	       return true;
	     } else {
	       return false;
	     }
	   }  
  
   function checkNegNumAndZero(id) {
	     let element = document.getElementById(id);
	     if (element.value <= 0) {
	       element.classList.add('is-invalid');
	       numError = `Number of passesgers should be a non-zero positive number`;
	       return true;
	     } else {
	       return false;
	     }
	   }  

  
   
   $(document).ready(

		    function () {

		      $("#searchbtn").click(function () {
		        if (
		        	validateSourceSelect('Source') &&
		        	validateDestSelect('Dest') &&
		        	validateDate('travel_date') &&
		        	validatePassengers('passengers_no')) {
		          $("form#form-book").submit();
		        }
		      });
		    });
  
  
  </script>

</body>
</html>