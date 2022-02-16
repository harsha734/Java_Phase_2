<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head >
<meta charset="ISO-8859-1">
<title>Product Details</title>
<style >
body{
text-align:center;
}
h1{
color:darkblue;
}

</style>
</head>
<body >

<h1 style="color:blue">Enter Product Details</h1><br>
<hr>
<form action="app"  >
PRODUCT  ID <input type="text" name="productId" placeholder=""><br><br>
PRODUCT NAME<input type="text" name="productName" placeholder=""><br><br>
PRODUCT PRICE<input type="text" name="productPrice" placeholder=""><br><br>
PRODUCT RAM<input type="text" name="productRam" placeholder=""><br><br>
  <input type="submit" value="INSERT" style="text-align:center">
</form>

</body>
</html>
