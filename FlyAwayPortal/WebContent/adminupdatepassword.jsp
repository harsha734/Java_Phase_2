
<% 
 if(request.getSession().getAttribute("adminId") == null){
	 response.sendRedirect("index.jsp");
 }else if(request.getSession().getAttribute("adminId") != null){ 
 %>

<%@page import="com.flyaway.model.Admin"%>
<%@page import="com.flyaway.dao.AdminDAO"%>
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
<link rel="stylesheet" href="css/register.css">

<title>Fly Away</title>

</head>

<body>

	<!-- header -->
	<header class="d-flex align-items-center">

		<!-- navbar -->
		
			<a  href="admindetails.jsp"><i
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

AdminDAO admin = new AdminDAO();
Admin adm = null;
Integer adminId = (Integer)session.getAttribute("adminId");
if(adminId != null){
	
	adm = admin.getAdmin(adminId);
	
}

%>

	<div class="container-fluid">

		<div class="row justify-content-center">

			<div class="col-12 col-md-6 col-sm-6">

				<form class="form-container" id="password-form"
					style="background: rgba(255, 255, 255, 0.8)"
					action="adminupdatepassword" method="post">
					<h3
						class="text-center py-4 text-dark banner-heading font-weight-bold">Update
						Password Form</h3>

					<div class="form-group has-feedback">
						<label for="customer-id" class="text-dark font-weight-bold">Admin
							Id</label> <input name="customerid" type="text" class="form-control"
							id="customer-id" value=<%= adm.getAdminId() %> readonly />
						<div class="invalid-feedback font-weight-bold" id="uError"></div>
					</div>

					<div class="form-group has-feedback">
						<label for="email-id" class="text-dark font-weight-bold">Email
							Address</label> <input name="emailaddress" type="email"
							class="form-control" id="email-id" value=<%= adm.getEmail() %>
							readonly />
						<div class="invalid-feedback font-weight-bold" id="eError"></div>
					</div>

					<div class="form-group mb-3 has-feedback">
						<label for="inputPassword4" class="text-dark font-weight-bold">New
							Password</label> <input name="password" type="password"
							class="form-control" id="inputPassword4"
							placeholder="Enter New Password">
						<div class="invalid-feedback font-weight-bold" id="pError"></div>
					</div>

					<button type="button" class="btn btn-primary btn-block "
						id="passbtn">Change Password</button>

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
