<!DOCTYPE html>
<%@page import="beans.CustomerInfo"%>
<html>

<head>
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
	
	<title> | Home</title>
	
<link rel='stylesheet' type='text/css' href='css/style.css' />
	
	<!--[if IE]>
      <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <script type='text/javascript' src='http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js'></script>
    <script type='text/javascript' src='js/goback.js'></script>
    <script type='text/javascript' src='js/hideshow.js'></script>
    <script type='text/javascript' src='js/pageheightadjust.js'></script>
    
</head>

<body onload="changeHashOnLoad()">

    <?php include('../header.php'); ?>

<div id="page-wrap">

        <header>
		  <h1>Customer Page</h1>
		
		  <nav>
		      <ul class="group"> 
		      <li><a href="views/withdraw.jsp">Withdraw</a></li>
		          <li><a href="views/deposit.jsp">Deposit</a></li>
		          <li><a href="views/transfer.jsp">Transfer</a></li>	  
		          <li><a href="index.html" >logout</a></li>
		      </ul>
		      
		  </nav>
		</header>
		
<section id="main-content">
		<li><button onclick="setheight()" style="color:navy; border:thick; font:cursive; border-radius: 10px;" >Account Info</button></li>
<div id="guts">		          
		<div id="myDiv">   
<h2>Account Details</h2>  
<%@page import="java.util.ArrayList"%>
<%
CustomerInfo list=(CustomerInfo)request.getAttribute("xyz");
%>
<div id="pricing-table" class="clear">
    <div class="plan">
        <ul>
            <li>Account Number&nbsp&nbsp:&nbsp&nbsp<%=list.getAccno()%></li>
            <li>Name&nbsp&nbsp:&nbsp&nbsp<%=list.getUsername()%></li>
            <li>Balance&nbsp&nbsp:&nbsp&nbsp<%=list.getBalance()%></li>
            <li>Last Visited Date&nbsp&nbsp:&nbsp&nbsp<%=list.getLastvisiteddate()%></li>
						
</ul>
</div>
	</div>
		</div></div>
	</section></div>
	<footer>
	  &copy;Mastan Pvt limited
	</footer>

	<?php include('../footer.php'); ?>

</body>

</html>