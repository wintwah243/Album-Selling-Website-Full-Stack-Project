<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Responsive contact us page</title>
  <link rel="stylesheet"  type="text/css" href="stylee.css">
  <link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
  
  
  <style>
  @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&displsy=swap');
  	*{
  margin: 0px;
  padding: 0px;
  box-sizing: border-box;
  font-family: sans-serif;

}


.contact{
  min-height: 100vh;
  background-color: #e8f0fe;
  padding: 50px;
  text-align: center;
  background: linear-gradient(to right, purple,skyblue);
}

.container{
  max-width: 800px;
  margin: 0 auto;
}

.container h2{
  font-size: 36px;
  margin-bottom: 40px;
  color: #333;
}

.contact-wrapper{
  dispaly: grid;
  grid-template-columns: repeat(2, 1fr);
  grid-gap: 30px;
}

.contact-form{
  text-align: left;
}


.contact-form h3{
  font-size: 24px;
  margin-bottom: 20px;
  color: #333;
}

.form-group{
  margin-bottom: 20px;
}
input, textarea{
  width: 50%;
  padding: 12px;
  border-radius: 8px;
  border: none;
  background-color: #f8f9fa;  
  color: #333;
}

input:focus,
textarea:focus{
  outline: none;
  box-shadow: 0 0 8px #bbb;
}

button{
  display: inline-block ;
  padding: 12px 24px;
  background-color: black;
  color: #fff;
  border: none;
  cursor: pointer;
  transition: 0.3s ease;
  border-radius:20px;
}

button:hover{
  background-color: #45a049;
}

.contact-info{
  text-align: left;
  margin-top:-250px;
  justify-content: center;
  margin-left: 800px;

}

.contact-info h3{
  font-size: 24px;
  margin-bottom: 10px;
  color: #555;
}

.contact-info i{
    color: #4caf50;
    margin-right: 10px;
    padding: 10px;
}

@media screen and (max-width: 768px){
  .container{
    padding: 20px;
  }
  .contact-wrapper{
  grid-template-columns:  1fr;
  }

}
header{
	max-width: var(--max-width);
	margin:auto;
	padding:2rem 1rem;
	display:flex;
	align-items: center;
	justify-content: space-between;
}

.nav_logo{
	font-size: 1.5rem;
	font-weight: 600;
	color:var(--text-dark);
}

.nav_links{
	list-style: none;
	display: flex;
	align-items: center;
	gap:2rem;
}

.link a{
	font-weight: 500;
	color: var(--text-light);
	transition: 0.3s;
}

.link a:hover{
	color:var(--primary-color);
}
a{
	text-decoration: none;
}
.color{
background:linear-gradient(to right, purple,skyblue);
}

  </style>

</head>
<body>
<header class="color">
<div class="nav_logo">K-town</div>
<ul class="nav_links">
<li class="link"><a href="homepagestyle.jsp">Home</a></li>
<li class="link"><a href="cart.jsp">Your cart</a></li>
<li class="link"><a href="contactus.jsp">Contact</a></li>
<li class="link"><a href="userProfile.jsp"><i class="fa-solid fa-circle-user"></i></a></li>
</ul>
</header>

  <section class="contact">
    <div class="container">
      <h2>Contact Us</h2>
      <div class="contact-wrapper">
        <div class="contact-form">
          <h3>Send us a message</h3>
          <form>
            <div class="form-group">
                <input type="text" name="name" placeholder="Your name">
            </div> 
            <div class="form-group">
                <input type="email" name="email" placeholder="Your email">
            </div>
            <div class="form-group">
                <textarea name="message"  placeholder="Your message"></textarea>
            </div>
            <button type="submit">Send message</button>
          </form>
        </div>
      </div>
    </div>
        <div class="contact-info">
          <h3>Contact Information</h3>
          <p><i class="fas fa-phone"></i>+1 123 456 789</p>
          <p><i class="fas fa-envelope"></i>ktown@gmail.com</p>
          <p><i class="fas fa-map-marker-alt"></i>123 Street ,Yangon ,Myanmar</p>
        </div>
      
    
  </section>
</body>
</html>