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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script type='text/javascript' src='js/goback.js'></script>
    <script type='text/javascript' src='js/pageheightadjust.js'></script>
    <script type='text/javascript' src='js/hideshow.js'></script>
    <script type='text/javascript' src='js/addphotohideshow.js'></script>
    <script type="text/javascript">
    window.onbeforeunload = function() {
        location.replace("index.html");
    }
</script>
</head>

<body onload="changeHashOnLoad()">

    <?php include('../header.php'); ?>

	<div id="page-wrap">

        <header>
		  <h1>Manager Page</h1>
		
		  <nav>
		      <ul class="group">
		     
		          <li><a href="views/managerwithdraw.jsp">Withdraw</a></li>
		          <li><a href="views/managerdeposit.jsp">Deposit</a></li>
		          <li><a href="views/managertransfer.jsp">Transfer</a></li>
		      <li><a href="views/addcustomer.jsp">Add New Customers</a></li>
		       <li style="position: static; right: 30px;"><a style="position: static; right: 30px;" href="index.html" >logout</a></li>
		      </ul>
		  </nav>
		</header>
		
		<section id="main-content">
	<li><button onclick="setheight()" style="color:navy; border:thick; font:cursive; border-radius: 10px;" >Show all Customers</button></li>

	
	
	<center><div id="guts">
		<br>
	 <div id="myDiv">
<%@page import="java.util.ArrayList"%>
<%
ArrayList<CustomerInfo> list=(ArrayList<CustomerInfo>)request.getAttribute("key");
ArrayList<String> user=(ArrayList<String>)request.getAttribute("image");
%>

<div id="pricing-table" class="clear">
 <%
 for(int i=0;i<list.size();i++)
{
CustomerInfo temp=list.get(i);
%>
<div class="plan">
        <ul>
            <li>Account Number&nbsp&nbsp:&nbsp&nbsp<%=temp.getAccno()%></li>
            <li>Name&nbsp&nbsp:&nbsp&nbsp<%=temp.getUsername()%></li>
            <li>Balance&nbsp&nbsp:&nbsp&nbsp<%=temp.getBalance()%></li>
            <li>Last Visited Date&nbsp&nbsp:&nbsp&nbsp<%=temp.getLastvisiteddate()%></li>
						
</ul>
</div>
<%} %>
<br>
</div>
</div></div>
		</section>
		
	</div>
	
	<footer>
	  &copy;Mastan Pvt limited
	</footer>

	<?php include('../footer.php'); ?>

</body>

</html>