<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<title>Login Form</title>
<link rel="stylesheet" href="css/style.css">
</head>

<body>
<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
<div class="container" id="container">
<div class="form-container sign-up">
<form action="register" method="post">
<h1>Create Account</h1>
<div class="social-icons">
<a href="#" class="icon"><i class="fa-brands fa-google-plus-g"></i></a>
<a href="#" class="icon"><i class="fa-brands fa-facebook-f"></i></a>
<a href="#" class="icon"><i class="fa-brands fa-instagram"></i></a>

</div>
<span>or use your email for registration</span>
<input type="text" placeholder="username" name="name" class="input">
<input type="text" placeholder="email" name="email" class="input">
<input type="password" placeholder="create a password" name="pass" class="input">
<input type="text" placeholder="country" name="country" class="input">
<input type="submit" value="sign up" class="button">

</form>
</div>

<div class="form-container sign-in">
<form action="Login" method="post">
<h1>Login</h1>
<div class="social-icons">
<a href="#" class="icon"><i class="fa-brands fa-google-plus-g"></i></a>
<a href="#" class="icon"><i class="fa-brands fa-facebook-f"></i></a>
<a href="#" class="icon"><i class="fa-brands fa-instagram"></i></a>

</div>
<span>or use your email password</span>
<input type="text" placeholder="username" name="username" class="input">
<input type="password" placeholder="password" name="password" class="input">
 
<a href="#">Forgot your password?</a>
<input type="submit" value="Log in" class="button">

</form>
</div>

<div class="toggle-container">
<div class="toggle">
<div class="toggle-panel toggle-left">
<h1>Welcome Back!</h1>
<p>Enter your personal details to use all of site features</p>
<input type="submit" class="hidden button" id="login" value="Login">
</div>
<div class="toggle-panel toggle-right">
<h1>Hello, Kpopper!</h1>
<p>Register with your personal details to use all of site features</p>
<input type="submit" class="hidden button" id="register" value="Sign Up">
</div>
</div>
</div>

</div>
<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	
	<script type="text/javascript">
	var status = document.getElementById("status").value;
	if(status=="success"){
		swal("Congrats","Account Created Successfully!","success");
	}
	</script>
	
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	
	<script type="text/javascript">
	var status = document.getElementById("status").value;
	if(status=="failed"){
		swal("Sorry","Wrong username or password","failed");
	}
	
	
	
	
	</script>
	
	
	
	<script type="text/javascript">
	var status = document.getElementById("status").value;
	if(status=="wrongCountry"){
		swal("Sorry","Your location is currently unavilable","failed");
	}
	
	
	
	
	</script>
	
	




<script src="js/login.js">
</script>
</body>
</html>