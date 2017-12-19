<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>
<head>
<script src="ajax2.js"></script>
</head>
<body>
Click <a href="fhistory.jsp">here</a> to view history
<center>
<h1>YOUR ORDERS</h1></center>
<%

String e=(String)session.getAttribute("email");  
//out.print("Hello "+e);
if(e!=null){
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con1=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/learning","root","sweety");
Statement st=con1. createStatement();
ResultSet rs=st.executeQuery("select * from forder c inner join food f on c.fid=f.fid and c.email='"+e+"' and isdelivered='no'");
%>

<table style="width:100%" >
<%
int a[]=new int[100];
int sum=0,i=0,f=0;
while(rs.next()){
f++;
      out.print("<tr><td>");
       out.print("<img src='"+rs.getString(11)+"'><br><input onclick='deletethis(this.id)' type='button' id='"+rs.getString(1)+"' value='cancel order'></td>"+"<td><h3>"+rs.getString(10)+"</h3><br>"+rs.getString(7)+"</td>");
out.print("<td>"+rs.getString(6)+"<br>"+rs.getString(4)+" "+rs.getString(5)+"</td>");
out.print("</tr>");      
}

out.print("</table>");
if(f==0)
out.print("no orders available");


//for(int j=0;j<i;j++)
//out.print(a[j]);
out.print("</body>");
con1.close();
}catch(Exception er){
out.print(er);
}
}else
out.print("<h2>Please login</h2>");
%>
</html>