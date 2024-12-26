<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <title>Footer</title>
  <style>
  	*{
  margin: 0;
  padding: 0;
  font-family: 'Poppins',sans-serif;

}

body{
  background: #fcfcfc;
}
footer{
  width: 100%;
  background-color: skyblue;
  color: purple;
  bottom: 0;
  position: absolute;padding: 10px 0 30px;border-top-left-radius: 125px;line-height: 20px;
}

.footer-content{
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  padding: 20px 10px;
}
.footer-content h2{
  size: 2rem;
  text-transform: uppercase;
}
.footer-content p{
  max-width: 700px;
  opacity: 0.7;
  margin: 10px 0;
  cursor:pointer;
}
.footer-bottom{
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  padding: 0;
}
  </style>
</head>
<body>
  <footer>
    <div class="footer-content">
      <h2>K-Town</h2>
      <p><h4>We all want you to give better KPop albums selling website!</h4><br>
      <h5>Thanks for shopping with us!Have a nice day!</h5></p>
    </div>
    <div class="footer-bottom"><p>Copyright &copy; 2024 K-Town designed by WintWah Team</p></div>
  </footer>
</body>