
<% 
 if(request.getSession().getAttribute("customerId") == null){
	 response.sendRedirect("index.jsp");
 }else if(request.getSession().getAttribute("customerId") != null){ 
 %>

<%@page import="com.flyaway.model.Customer"%>
<%@page import="com.flyaway.dao.CustomerDAO"%>
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
	<header >

		
		
			<a  href="customerdetails.jsp"></a>
			

			<div >
				
					<a href="customerdetails.jsp"
						class="nav-link">Customer Details</a>
					<a href="changepassword.jsp"
						class="nav-link">Change Password</a>
					<a
						 href="Logout"> logout</a>
			

			</div>
	
	</header>


	<%

CustomerDAO cust = new CustomerDAO();
Customer customer = null;
Integer customerId = (Integer)session.getAttribute("customerId");
if(customerId != null){
	
	customer = cust.getCustomer(customerId);
	
}

%>

	<div class="container-fluid">

		<div class="row justify-content-center">

			<div class="col-12 col-md-6 col-sm-6">

				<form class="form-container" id="password-form"
					style="background: rgba(255, 255, 255, 0.8)"
					action="updatepassword" method="post">
					<h3
						class="text-center py-4 text-dark banner-heading font-weight-bold">Update
						Password Form</h3>



					<div class="form-group has-feedback">
						<label for="customer-id" class="text-dark font-weight-bold">Customer
							Id</label> <input name="customerid" type="text" class="form-control"
							id="customer-id" value=<%= customer.getCustomerId() %> readonly />
						<div class="invalid-feedback font-weight-bold" id="uError"></div>
					</div>

					<div class="form-group has-feedback">
						<label for="email-id" class="text-dark font-weight-bold">Email
							Address</label> <input name="emailaddress" type="email"
							class="form-control" id="email-id"
							value=<%= customer.getEmail() %> readonly />
						<div class="invalid-feedback font-weight-bold" id="eError"></div>
					</div>

					<div class="form-group mb-3 has-feedback">
						<label for="inputPassword4" class="text-dark font-weight-bold">Password</label>
						<input name="password" type="password" class="form-control"
							id="inputPassword4" placeholder="Enter New Password">
						<div class="invalid-feedback font-weight-bold" id="pError"></div>
					</div>

					<button type="button" class="btn btn-primary btn-block "
						id="passbtn">Change Password</button>

				</form>
			</div>
		</div>
	</div>

	

	
	<script>
  
//Password Validation  ==============================================================================

  let passError = '';

  function validatePassword(id) {
    if (isEmptyPassword(id)) {
      document.getElementById('pError').textContent = passError;
      return false;
    } else if (regexValidateP(id)) {
      document.getElementById('pError').textContent = passError;
      return false;
    } else {
      document.getElementById(id).classList.remove('is-invalid');
      document.getElementById('pError').remove;
      return true;
    }
  }

  function isEmptyPassword(id) {
    let element = document.getElementById(id);
    if (element.value == null || element.value == "" || element.value.trim() == "") {
      element.classList.add('is-invalid');
      passError = `Passoword cannot be empty`;
      return true;
    } else {
      return false;
    }
  }

  function regexValidateP(id) {
    var alphaExp = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})/;
    let element = document.getElementById(id);
    if (alphaExp.test(element.value)) {
      return false;
    } else {
      element.classList.add('is-invalid');
      passError =
        `Must contain at least one number and one uppercase and lowercase letter and one special character, and at least 8 or more characters`;
      return true;
    }
  }


  //Password Validation Ends ==============================================================================


	  $(document).ready(

    function () {

      $("#passbtn").click(function () {
        if (validatePassword('inputPassword4')) {
          $("form#password-form").submit();
        }
      });
    });
  
  </script>



</body>
</html>

<% } %>