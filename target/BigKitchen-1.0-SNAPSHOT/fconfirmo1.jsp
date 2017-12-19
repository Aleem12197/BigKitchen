<%@ page import="java.sql.*" %>
<jsp:useBean id="obj" class="user.MailSenderBean" type="user.MailSenderBean" scope="session"/>
<%
String dt=request.getParameter("date");
String tm=request.getParameter("time");
String add=request.getParameter("deladd");
String q=request.getParameter("quantity");
String em=(String)session.getAttribute("email");
if(dt==null||dt=="null"||dt=="")
dt="today";
if(tm==null||tm=="null"||tm=="")
tm="now";
String idstr="";
Cookie c=null;
Cookie ck[]=request.getCookies();
for(int i=0;i<ck.length;i++){
c=ck[i];
if(c.getName().compareTo("itemid")==0){
idstr=c.getValue();
break;
}
}
int id=Integer.parseInt(idstr);
int m=0;
String msg="";
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/learning","root","sweety");
Statement st=con.createStatement();
st.executeUpdate("insert into forder values('"+em+System.currentTimeMillis()+"','"+em+"',"+id+",'"+dt+"','"+tm+"',"+q+",'"+add+"','no')");
out.print("order placed successfully<br>");
st.executeUpdate("update food set norders=norders+1 where fid="+id);
Statement st2=con.createStatement();
ResultSet rs2=st2.executeQuery("select name,cost from food where fid="+id);
if(rs2.next())
msg=msg+"Product:"+rs2.getString(1)+"\n"+"Total Amount:"+rs2.getInt(2)*Integer.parseInt(q)+"\n"+"Date:"+dt+" Time:"+tm+"\n"+"Address:"+add;
m=obj.sendEmail("syedaleem12197@gmail.com","syedaleem12197@gmail.com","sweety@sweety",em,"Order Confirmation Mail",msg);
if(m!=0)
out.print("order confirmation email is sent<br>");
out.print("<br>Go to order view orders");
out.print("<br> Go to home for ordering more food");

con.close();

}catch(Exception ex){
out.print(ex);
}
%>