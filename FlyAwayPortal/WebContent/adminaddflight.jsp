
<% 
 if(request.getSession().getAttribute("adminId") == null){
	 response.sendRedirect("index.jsp");
 }else if(request.getSession().getAttribute("adminId") != null){ 
 %>

<%@page import="com.flyaway.dao.Utils"%>
<%@page import="com.flyaway.model.Airport"%>
<%@page import="java.util.List"%>
<%@page import="com.flyaway.dao.CustomerDAO"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
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
	<!-- header -->
	<header>
		<!-- navbar -->
		
			<a href="admindetails.jsp"><i
				></i></a>
			

			<div >
				
					<a href="admindetails.jsp"
						>Admin Details</a>
					<a href="adminupdatepassword.jsp"
						>Change Password</a>
					<a
						href="Logout"><i
							></i> logout</a>

			

			</div>
		

		<!-- Navigation -->
	</header>
	<!--Header-->



	<%
	Map<String,String>weekMap = new LinkedHashMap<>();
	weekMap = Utils.getWeekDays(); 
	CustomerDAO cust = new CustomerDAO();
	List<String>codeList = cust.listAirportCode();
	List<String>airList = cust.listAirline();
%>

	<div class="container-fluid ">
		<div class="row justify-content-center">

			<div class="col-12 col-md-8 col-sm-6">
				<form id="form-flight" class="form-container"
					style="background: rgba(255, 255, 255, 0.8)"
					action="addflightadmin" method="post">
					<h2
						class="text-center py-4 text-dark banner-heading font-weight-bold">Add
						New Flight</h2>
					<div class="form-group has-feedback">

						<label for="Airline" class="text-dark font-weight-bold">Airline</label>
						<select class="form-control" id="Airline" name="airline">
							<option selected value="selected">Select</option>
							<% 
        		if(airList.size() != 0){
        			for(String code: airList){
        		%>
							<option value=<%= code %>><%= code %></option>
							<% } }%>
						</select>
						<div class="invalid-feedback font-weight-bold" id="s1Error"></div>
					</div>


					<label for="weekdays"><b>Select Weekdays</b></label>
					<table id="weekdays">
						<tr>
							<% for(Map.Entry<String , String> wm : weekMap.entrySet()){ %>
							<td><input class="pr-3 mr-2" type="checkbox" name="weekdays"
								value=<%= wm.getKey() %> /><%= wm.getValue() %></td>
							<% } %>
						</tr>
					</table>



					<div class="form-group has-feedback">
						<label for="Source" class="text-dark font-weight-bold">Source
							Airport</label> <select class="form-control" id="Source" name="source">
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

					<div class="form-group has-feedback">
						<label for="Destination" class="text-dark font-weight-bold">Destination
							Airport</label> <select class="form-control" id="Destination"
							name="destination">
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
						<div class="invalid-feedback font-weight-bold" id="s3Error"></div>
					</div>

					<div class="form-group mt-4 has-feedback">
						<button type="button" class="btn btn-success btn-block "
							id="addbtn">Add Flight</button>
					</div>

				</form>
			</div>
		</div>
	</div>

	

	
	<script>


//Select Validate =======================================================================================

let sel1Error = '';

  function validateSelect(id) {
    if (isEmptySelect(id)) {
      document.getElementById('s1Error').textContent = sel1Error;
      return false;
    }else {
      document.getElementById(id).classList.remove('is-invalid');
      document.getElementById('s1Error').remove;
      return true;
    }
  }

  function isEmptySelect(id) {
    let element = document.getElementById(id);
    if (element.value === 'selected') {
      element.classList.add('is-invalid');
      sel1Error = `Please Select an Option`;
      return true;
    } else {
      return false;
    }
  }
	
  
let sel2Error = '';

  function validateSourceSelect(id) {
    if (isEmptySourceSelect(id)) {
      document.getElementById('s2Error').textContent = sel2Error;
      return false;
    }else if(checkSameDestination(id)) {
    	document.getElementById('s2Error').textContent = sel2Error;
        return false;
    }else {
      document.getElementById(id).classList.remove('is-invalid');
      document.getElementById('s2Error').remove;
      return true;
    }
  }

  function isEmptySourceSelect(id) {
    let element = document.getElementById(id);
    if (element.value === 'selected') {
      element.classList.add('is-invalid');
      sel2Error = `Please Select an Option`;
      return true;
    } else {
      return false;
    }
  }

  function checkSameDestination(id) {
	    let Source = document.getElementById(id).value;
	    let Destination = document.getElementById('Destination').value;

	    if (Source !== Destination) {
	      return false;
	    } else {
	      document.getElementById(id).classList.add('is-invalid');
	      sel2Error = `Source Cannot be same as Destination`;
	      return true;
	    }
	  }

  

  let sel3Error = '';

  function validateDestSelect(id) {
    if (isEmptyDestSelect(id)) {
      document.getElementById('s3Error').textContent = sel3Error;
      return false;
    }else if(checkSameSource(id)) {
    	document.getElementById('s3Error').textContent = sel3Error;
        return false;
    }else {
      document.getElementById(id).classList.remove('is-invalid');
      document.getElementById('s3Error').remove;
      return true;
    }
  }

  function isEmptyDestSelect(id) {
    let element = document.getElementById(id);
    if (element.value === 'selected') {
      element.classList.add('is-invalid');
      sel3Error = `Please Select an Option`;
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
	      sel3Error = `Destination Cannot be same as Source`;
	      return true;
	    }
	  }

        

  $(document).ready(

		    function () {

		      $("#addbtn").click(function () {
		        if (
		        		validateSelect('Airline') &&
		        		validateSourceSelect('Source') &&
		        		validateDestSelect('Destination')) {
		          $("form#form-flight").submit();
		        }
		      });
		    });
  

  </script>


</body>


</html>

<% } %>