<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>


<html>
<jsp:useBean id="obj" class="user.MailSenderBean" type="user.MailSenderBean" scope="session"/>

<%
String e=(String)session.getAttribute("email");  
String ph=(String)session.getAttribute("phone");
//out.print("Hello "+e);
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con1=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/learning","root","sweety");
Statement st=con1. createStatement();
ResultSet rs=st.executeQuery("select * from fcart where email='"+e+"'");
String newadd;
String tem;
String dt;
String tm;
int m=0;
int n=0;
String msg;
long ct=0;
while(rs.next()){
msg="";
tem="add"+rs.getInt(2);
if(request.getParameter(tem)!=null){
newadd=request.getParameter(tem);
dt=rs.getString(3);
tm=rs.getString(4);
if(dt==null||dt=="null"||dt=="")
dt="today";
if(tm==null||tm=="null"||tm=="")
tm="now";
Statement st1=con1.createStatement();
ct=System.currentTimeMillis();
st1.executeUpdate("insert into forder values('"+e+ct+"','"+rs.getString(1)+"',"+rs.getInt(2)+",'"+dt+"','"+tm+"',"+rs.getInt(5)+",'"+newadd+"','no')");
Statement st2=con1.createStatement();
ResultSet rs2=st2.executeQuery("select name,cost from food where fid="+rs.getInt(2));
if(rs2.next())
msg=msg+"Product:"+rs2.getString(1)+"\n Total Amount:"+rs2.getInt(2)*rs.getInt(5)+"\nDate:"+dt+"Time:"+tm+"Address:"+newadd;

m=obj.sendEmail("syedaleem12197@gmail.com","syedaleem12197@gmail.com","sweety@sweety",e,"Order Confirmation Mail",msg);

//n=obj.sendEmail("syedaleem12197@gmail.com","syedaleem12197@gmail.com","sweety@sweety",ph+"@sms.textlocal.in","Order Confirmation Mail",msg);
st1.executeUpdate("update food set norders=norders+1 where fid="+rs.getInt(2));
st1.executeUpdate("delete from fcart where email='"+e+"' and fid="+rs.getInt(2));

if(m!=0)
out.print("mail sent<br>");
//if(n!=0)
//out.print("msg sent<br>");
}
}
out.print("your cart is empty");
out.print("<br>Go to order view orders");
out.print("<br> Go to home for ordering more food");
con1.close();
}catch(Exception ex){
out.print(ex);
}
%>
</html>