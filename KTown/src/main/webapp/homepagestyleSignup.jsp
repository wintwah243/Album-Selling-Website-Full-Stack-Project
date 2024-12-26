<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<link rel="stylesheet" href="css/homepagestyle.css">
<title>Insert title here</title>
<style>
footer{
  width: 100%;
  background-color: skyblue;
  color: purple;
  bottom: 0;
  padding: 10px 0 30px;
  border-top-left-radius: 125px;
  line-height: 20px;
  position:relative;
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

<nav>
<div class="nav_logo">K-town</div>
<ul class="nav_links">
<li class="link"><a href="homepagestyleSignup.jsp">Home</a></li>
<li class="link"><a href="cartSignup.jsp">Your Cart</a></li>
<li class="link"><a href="contactusSignup.jsp">Contact</a></li>
<li class="link"><a href="login.jsp">Sign in</a></li>
</ul>
</nav>

<header class="section_container header_container">
<div class="header_image_container">
<div class="header_content">
<h1>Choose your favorite idol group</h1>
<p>Relax your mind by listening kpop songs and also learn to love yourself</p>
</div>

</div>
</header>

<section class="section_container popular_container">
<h2 class="section_header">Choose Your Favorite Artist</h2>
<div class="popular_grid">
<div class="popular_card">
<a href="albumSignup.jsp"><img src="https://www.geo.tv/assets/uploads/updates/2021-05-12/l_349864_031522_updates.jpg"></a>
<div class="popular_content">
<div class="popular_card_header">
<h4>BTS</h4>
</div>
<p>BigHit Entertainment</p>
</div>
</div>

<div class="popular_card">
<a href="blackpinkSignup.jsp"><img src="https://m.media-amazon.com/images/I/618H5Ys4kUL.jpg"></a>
<div class="popular_content">
<div class="popular_card_header">
<h4>Blackpink</h4>
</div>
<p>YG Entertainment</p>
</div>
</div>

<div class="popular_card">
<a href="twiceSignup.jsp"><img src="https://www.allkpop.com/upload/2021/01/content/231752/web_data/allkpop_1611442396_twice.png"></a>
<div class="popular_content">
<div class="popular_card_header">
<h4>Twice</h4>
</div>
<p>JYP Entertainment</p>
</div>
</div>

<div class="popular_card">
<a href="#"><img src="https://m.media-amazon.com/images/I/61vYWe4JkNL.jpg"></a>
<div class="popular_content">
<div class="popular_card_header">
<h4>Enhypen</h4>
</div>
<p>BigHit Entertainment</p>
</div>
</div>

<div class="popular_card">
<a href="#"><img src="https://qph.cf2.quoracdn.net/main-qimg-e66f010d6cf8a8ace33e0530b1791917"></a>
<div class="popular_content">
<div class="popular_card_header">
<h4>TXT</h4>
</div>
<p>BigHit Entertainment</p>
</div>
</div>

<div class="popular_card">
<a href="#"><img src="https://6.soompi.io/wp-content/uploads/image/20231013030229_Stray-Kids-2.jpg?s=900x600&e=t"></a>
<div class="popular_content">
<div class="popular_card_header">
<h4>Stray Kids</h4>
</div>
<p>JYP Entertainment</p>
</div>
</div>


<div class="popular_card">
<a href="#"><img src="https://external-preview.redd.it/230531-le-sserafim-becomes-5th-k-pop-girl-group-in-v0-9hwX4G_28DXN9lm97Cj-AZSP28VQ93Wi9lHpL7otw6o.jpg?auto=webp&s=4f71385e045e2527731c93d34098f8bb0cfa2d29"></a>
<div class="popular_content">
<div class="popular_card_header">
<h4>LE SSERAFIM</h4>
</div>
<p>BigHit Entertainment</p>
</div>
</div>


<div class="popular_card">
<a href="#"><img src="https://ss-images.saostar.vn/wp700/2020/01/01/6742287/e.jpg"></a>
<div class="popular_content">
<div class="popular_card_header">
<h4>EXO</h4>
</div>
<p>SM Entertainment</p>
</div>
</div>


<div class="popular_card">
<a href="#"><img src="https://cdn.shopify.com/s/files/1/0267/0896/7478/files/timg_04b5167a-980c-4248-a6f9-16cda9aa96c3_480x480.jpg?v=1597912805"></a>
<div class="popular_content">
<div class="popular_card_header">
<h4>ITZY</h4>
</div>
<p>JYP Entertainment</p>
</div>
</div>


<div class="popular_card">
<a href="#"><img src="https://dbkpop.com/wp-content/uploads/2023/04/ive_ive_ive_concept_all_group.jpg"></a>
<div class="popular_content">
<div class="popular_card_header">
<h4>IVE</h4>
</div>
<p>Starship Entertainment</p>
</div>
</div>


<div class="popular_card">
<a href="#"><img src="https://thebiaslistcom.files.wordpress.com/2020/10/nct-dream-deja-vu.jpg?w=610&h=363"></a>
<div class="popular_content">
<div class="popular_card_header">
<h4>NCT Dream</h4>
</div>
<p>SM Entertainment</p>
</div>
</div>


<div class="popular_card">
<a href="#"><img src="https://kpopping.com/documents/f9/4/800/NCT-127-STICKER-Concept-Teaser-Images-documents-1(1).jpeg?v=5cfcf"></a>
<div class="popular_content">
<div class="popular_card_header">
<h4>NCT 127</h4>
</div>
<p>SM Entertainment</p>
</div>
</div>


<div class="popular_card">
<a href="#"><img src="https://dbkpop.com/wp-content/uploads/2020/11/aespa_group_profile_3.jpg"></a>
<div class="popular_content">
<div class="popular_card_header">
<h4>Aespa</h4>
</div>
<p>SM Entertainment</p>
</div>
</div>


<div class="popular_card">
<a href="#"><img src="https://6.soompi.io/wp-content/uploads/image/8f708def7f6647ffab1d003368247aab/dummy.jpeg?s=900x600&e=t"></a>
<div class="popular_content">
<div class="popular_card_header">
<h4>Newjeans</h4>
</div>
<p>BigHit Entertainment</p>
</div>
</div>


<div class="popular_card">
<a href="#"><img src="https://imageio.forbes.com/specials-images/imageserve/6216ce269d56d8083bea4192/Treasure--Courtesy-of-YG-Entertainment-/960x0.jpg?format=jpg&width=960"></a>
<div class="popular_content">
<div class="popular_card_header">
<h4>Treasure</h4>
</div>
<p>YG Entertainment</p>
</div>
</div>


<div class="popular_card">
<a href="#"><img src="https://www.nme.com/wp-content/uploads/2021/08/red-velvet-queendom-sm-entertainment-facebook-130821-e1628837013464-696x442.jpg"></a>
<div class="popular_content">
<div class="popular_card_header">
<h4>Red Velvet</h4>
</div>
<p>SM Entertainment</p>
</div>
</div>


<div class="popular_card">
<a href="#"><img src="https://assets.teenvogue.com/photos/6244c16075709353c7d39298/16:9/w_6560,h_3690,c_limit/%5BATEEZ%5D%20%EB%A9%8B%20%EB%8B%A8%EC%B2%B4%20%ED%8B%B0%EC%A0%80%20%EC%9D%B4%EB%AF%B8%EC%A7%80%201.jpg"></a>
<div class="popular_content">
<div class="popular_card_header">
<h4>Ateez</h4>
</div>
<p>KQ Entertainment</p>
</div>
</div>


<div class="popular_card">
<a href="#"><img src="https://cdn.platinumlist.net/upload/artist/seventeen_976-orig1570352677.jpg"></a>
<div class="popular_content">
<div class="popular_card_header">
<h4>Seventeen</h4>
</div>
<p>BigHit Entertainment</p>
</div>
</div>



<div class="popular_card">
<a href="#"><img src="https://kpopping.com/documents/8d/1/BABYMONSTER-fullPicture(9).webp?v=8cb34"></a>
<div class="popular_content">
<div class="popular_card_header">
<h4>BabyMonster</h4>
</div>
<p>YG Entertainment</p>
</div>
</div>

<div class="popular_card">
<a href="#"><img src="https://6.soompi.io/wp-content/uploads/image/a8005ab58d064a2087e57d152c668fec.jpeg?s=900x600&e=t"></a>
<div class="popular_content">
<div class="popular_card_header">
<h4>B.I</h4>
</div>
<p>131 Entertainment</p>
</div>
</div>

<div class="popular_card">
<a href="#"><img src="https://media.allure.com/photos/5f1876fa8a8a206371a63978/master/w_1600%2Cc_limit/somi%2520blushed%2520look.png"></a>
<div class="popular_content">
<div class="popular_card_header">
<h4>Jeon Somi</h4>
</div>
<p>Black Label Entertainment</p>
</div>
</div>




</div>
</section>

<footer>
    <div class="footer-content">
      <h2>K-Town</h2>
      <p><h4>We all want you to give better KPop albums selling website!</h4><br>
      <h5>Thanks for shopping with us!Have a nice day!</h5></p>
    </div>
    <div class="footer-bottom"><p>Copyright &copy; 2024 K-Town designed by WintWah Team</p></div>
  </footer>

</body>
</html>