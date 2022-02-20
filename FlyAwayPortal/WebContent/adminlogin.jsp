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

			<a  href="index.jsp"><i
				></i></a>
			

			<div >
				
					<a href="index.jsp" class="nav-link">Home |</a>
					

					<a href="bookflight.jsp" class="nav-link">Book
							Flight|</a>

					<a href="adminlogin.jsp" class="nav-link">Admin
							Login|</a>


					<a href="login.jsp" class="nav-link">Customer
							Login</a>
				

			</div>
		

		
	</header>
	

				<form  id="login-form" action="adminlogin" method="post">
					<h3
						>Admin
						Login Form</h3>

					<%
        		String fail = (String)request.getAttribute("loginerr1");
                if(fail != null){		
        	%>
					<div
						>
						<%= fail %>
						<button type="button" class="close" data-dismiss="alert"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<%}%>

					<div >
						<label for="email-id" >Email
							Address</label> <input name="emailaddress" type="email"
							class="form-control" placeholder=" Enter Email Address"
							id="email-id" />
						<div  id="eError"></div>
					</div>

					<div >
						<label for="password" class="text-dark font-weight-bold">Password</label>
						<input name="password" type="password" class="form-control "
							placeholder="Enter Password" id="password">
						<div  id="pError"></div>

						<%
        		String password = (String)request.getAttribute("loginerr");
                if(password != null){
                	
        	%>

						<div class="text-danger"><%=request.getAttribute("loginerr") %></div>

						<% } %>
					</div>

					<button type="button" 
						id="loginbtn">Login</button>


				</form>
			</div>
		</div>
	</div>

	<script>
  
//Email Address Validation  ==============================================================================

  let addError = '';

  function validateAddress(id) {
    if (isEmptyAddress(id)) {
      document.getElementById('eError').textContent = addError;
      return false;
    } else if (regexValidateE(id)) {
      document.getElementById('eError').textContent = addError;
      return false;
    } else {
      document.getElementById(id).classList.remove('is-invalid');
      document.getElementById('eError').remove;
      return true;
    }
  }

  function isEmptyAddress(id) {
    let element = document.getElementById(id);
    if (element.value == null || element.value == "" || element.value.trim() == "") {
      element.classList.add('is-invalid');
      addError = "Email Address cannot be empty";
      return true;
    } else {
      return false;
    }
  }

  function regexValidateE(id) {
    var alphaExp = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
    let element = document.getElementById(id);
    if (alphaExp.test(element.value)) {
      return false;
    } else {
      element.classList.add('is-invalid');
      addError = 'Please provide a valid email address';
      return true;
    }
  }



  //Email Address Validation Ends ==============================================================================

	  
 let passError = '';

  function validatePassword(id) {
    if (isEmptyPassword(id)) {
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
    if (element.value == null || element.value == "") {
      element.classList.add('is-invalid');
      passError = `Password Cannot be Empty`;
      return true;
    } else {
      return false;
    }
  }
	  
  $(document).ready(

		    function () {

		      $("#loginbtn").click(function () {
		        if (
		         validateAddress('email-id') &&
		          validatePassword('password')) {
		          $("form#login-form").submit();
		        }
		      });
		    });
  
  </script>
</body>
</html>