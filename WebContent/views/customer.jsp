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
<div id="guts">
		
		  <h2>Account Details</h2>
		
		          <br>
		          
<%@page import="java.util.ArrayList"%>
<%
CustomerInfo list=(CustomerInfo)request.getAttribute("xyz");
%>
<Center><div id="pricing-table" class="clear">
    <div class="plan">
        <ul>
            <li>Account Number</li>
            <li>Name</li>
            <li>Balance</li>
			<li>Last Visited date</li>			
        </ul>
    </div>
    <div class="plan">
        <ul>
            <li><%=list.getAccno() %></li>
            <li><%=list.getUsername() %></li>
            <li><%=list.getBalance()%></li>
			<li><%=list.getLastvisiteddate() %></li>			
        </ul>
    </div> 	
</div></Center>
<%--<Center><table id ="rcorners2" border="4px"  class="rwd-table">
<tr>
<td>
Account Number
</td>
<td >
Name
</td>
<td >
Balance
</td>
<td >
Last Visited Date
</td>
</tr>


<tr >
<td ><%=list.getAccno()%></td>
<td ><%=list.getUsername() %></td>
<td ><%=list.getBalance()%></td>
<td ><%=list.getLastvisiteddate() %></td>
</tr>



</table></Center>--%>
	
		</div>
		</section>
		
	</div>
	
	<footer>
	  &copy;Mastan Pvt limited
	</footer>

	<?php include('../footer.php'); ?>

</body>

</html>