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
		       <li><a href="index.html" >logout</a></li>
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
%>

<Center><div id="pricing-table" class="clear">
<% for(int i=0;i<list.size();i++)
{
CustomerInfo temp=list.get(i);
//String cocn="employeeupdate.jsp?id="+temp.id+"&name="+temp.name+ "&salary="+temp.salary+"&managername="+temp.managername;

 %>
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
            <li><%=temp.getAccno()%></li>
            <li><%= temp.getUsername()%></li>
            <li><%=temp.getBalance() %></li>
			<li><%=temp.getLastvisiteddate()%></li>			
        </ul>
       </div>
       <%} %>
     	<br>
</div></Center>
<>
<%--<table id="rcorners2" border="2">
<tr id="rcorners2">
<td id="rcorners2">
Account Number
</td>
<td id="rcorners2">
Name
</td>
<td id="rcorners2">
Balance
</td>
<td id="rcorners2">
Last Visited Date
</td>
</tr>
<% for(int i=0;i<list.size();i++)
{
CustomerInfo temp=list.get(i);
//String cocn="employeeupdate.jsp?id="+temp.id+"&name="+temp.name+ "&salary="+temp.salary+"&managername="+temp.managername;

 %>

<tr id="rcorners2">
<td id="rcorners2"><%=temp.getAccno() %></td>
<td id="rcorners2"> <%=temp.getUsername() %></td>
<td id="rcorners2"><%=temp.getBalance()%></td>
<td id="rcorners2"><%=temp.getLastvisiteddate() %></td>
</tr>
<%} %>


</table>--%>
		</div>
		</section>
		
	</div>
	
	<footer>
	  &copy;Mastan Pvt limited
	</footer>

	<?php include('../footer.php'); ?>

</body>

</html>