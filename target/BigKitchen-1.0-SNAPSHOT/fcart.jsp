<%@ page import="java.sql.*" %>
<%@ page import="java.lang.StringBuilder" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>

<html>
<head>
<script src="ajax1.js" ></script>
</head>
<body>
<center>
<h1>CART</h1></center>
<% 
String name=(String)session.getAttribute("uname");  
//out.print("Hello "+name);

String ad=(String)session.getAttribute("address");
String e=(String)session.getAttribute("email");  
//out.print("Hello "+e);
if(name!=null){
Date dt= new Date();
Calendar c=Calendar.getInstance();
String dates[]=new String[10];
dates[0]=new SimpleDateFormat("yyyy-MM-dd").format(dt);
c.add(Calendar.DATE, 1);
dt = c.getTime();
dates[1]=new SimpleDateFormat("yyyy-MM-dd").format(dt);
c.add(Calendar.DATE, 1);
dt = c.getTime();
dates[2]=new SimpleDateFormat("yyyy-MM-dd").format(dt);
c.add(Calendar.DATE, 1);
dt = c.getTime();
dates[3]=new SimpleDateFormat("yyyy-MM-dd").format(dt);


try{
Class.forName("com.mysql.jdbc.Driver");
Connection con1=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/learning","root","sweety");
Statement st=con1. createStatement();
ResultSet rs=st.executeQuery("select * from fcart c inner join food f on c.fid=f.fid and c.email='"+e+"'");
%>
<form action="forder.jsp" name="foodcart" onsubmit="return checkadd()" method="post">
<table style="width:100%" >
<%
int a[]=new int[100];
int sum=0,i=0,f=0;

String val;
while(rs.next()){
f++;
a[i]=rs.getInt(2);
      out.print("<tr><td>");
       out.print("<img src='"+rs.getString(8)+"'><br><input onclick='deletethis(this.id)' type='button' id='delete"+rs.getInt(2)+"' value='Remove from Cart'></td>"+"<td><h3>"+rs.getString(7)+"</h3><br><h1>"+rs.getInt(10)+"each");
      out.print("</h1></td><td>Quantity:<input type='number' value='"+rs.getInt(5)+"' placeholder='quantity' id='quantity"+rs.getInt(2)+"'><br><br>");


out.print("Date:<select id='date"+rs.getInt(2)+"'>");
out.print("<option></option>");
for(int t=0;t<4;t++){
val=dates[t];
out.print("<option value='"+val+"' ");
if(val.equals(rs.getString(3)))
out.print("selected");
out.print(">");
out.print(val+"</option>");
}
/*out.print("<option value=''></option>");
out.print("<option value=''></option>");
out.print("<option value=''></option>");
out.print("<option value=''></option>");
*/
out.print("</select>");
//out.print("<input type='date' value='"+rs.getString(3)+"' id='date"+rs.getInt(2)+"'>");
out.print("<br><br>Time:<input type='time' value='"+rs.getString(4)+"' id='time"+rs.getInt(2)+"'><br><br><input type='button' value='save' onclick='reply_click(this.id)' id='"+rs.getInt(2)+"'></td></tr>");
sum=sum+rs.getInt(10)*rs.getInt(5);
i++;
}

out.print("</table>");
if(f==0){
out.print("empty cart");
%>
<jsp:include page="main.jsp"/>  
<%
}
else{

int b[]=new int[f];
for(int j=0;j<f;j++)
b[j]=a[j];
StringBuilder sb=new StringBuilder(b.length);
for(int m:b){
sb.append(m);
sb.append(" ");
}

String ids=sb.toString();
Cookie ck=new Cookie("fids",ids);
response.addCookie(ck);
//session.setAttribute("fids",b);
out.print("<input type='hidden' id='email' value='"+e+"'>");
out.print("<input type='hidden' id='add' value='"+ad+"'><input type='hidden' name='amount' value='"+sum+"'/><center><p>total amount is Rs."+sum+"</p>");

out.print("<input type='submit' value='");
out.print("Buy Now'>");

out.print("</center>");
}
out.print("</form>");
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