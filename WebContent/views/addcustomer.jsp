<!DOCTYPE html>
<%@page import="beans.CustomerInfo"%>
<html>

<head>
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
	
	<title> | Home</title>
	
	<link rel='stylesheet' type='text/css' href='../css/style.css' />
	
	<!--[if IE]>
      <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <script type='text/javascript' src='http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js'></script>
    <script type='text/javascript' src='../js/goback.js'></script>
   
</head>

<body onload="changeHashOnLoad()">

    <?php include('../header.php'); ?>

	<div id="page-wrap">

        <header>
		  <h1>Manager Page</h1>
		
		  <nav>
		      <ul class="group">
		      	  
		      	    
		          <li><a href="managerwithdraw.jsp">Withdraw</a></li>
		          <li><a href="managerdeposit.jsp">Deposit</a></li>
		          <li><a href="managertransfer.jsp">Transfer</a></li>
		          <li><a href="addcustomer.jsp">Add New Customers</a></li>
		           <li><a href="../index.html">Logout</a></li>
		      </ul>
		  </nav>
		</header>
		
		<section id="main-content">
<div id="guts">
		
<h2>Customer Information</h2>
		
<br> <form action="../BankFunctionServlet">
<center> <h2>Account Number</h2><input type="text" name="accno" id="rcorners2"></center>
<center> <h2>User Name</h2><input type="text" name="username" id="rcorners2"></center>
<center> <h2>Password</h2><input type="password" name="password" id="rcorners2"></center>
<center> <h2>Role</h2><input type="text" name="role" id="rcorners2"></center>
<center> <h2>Balance</h2><input type="text" name="balance" id="rcorners2"></center>
<center> <h2>Join Date</h2><input type="datetime-local" name="lastvisiteddate" id="rcorners2"></center>
<br><center><input type="submit" name="function" value="addcustomer" id="rcorners2"></center>
</form>	 

		</div>
		</section>
		
	</div>
	
	<footer>
	  &copy;Mastan Pvt limited
	</footer>

	<?php include('../footer.php'); ?>

</body>

</html>