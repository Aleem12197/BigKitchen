<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import ="java.sql.*" %>
<html>
<head>
<script>
function check(){
var em=document.getElementById("email").value;
var d=document.getElementById("date").value;
var t=document.getElementById("time").value;
var dt=new Date();
dtnew = [
  dt.getFullYear(),
  ('0' + (dt.getMonth() + 1)).slice(-2),
  ('0' + dt.getDate()).slice(-2)
].join('-');
var ad=document.getElementById("address").value;
var tm=[('0'+dt.getHours()).slice(-2),('0'+dt.getMinutes()).slice(-2)].join(':');
var len=ad.split(' ').length-1;
if(em==null||em=="null"||em==""){
alert("please login");
return false;
}

else if(len==ad.length||ad==null||ad=="null"||ad==""||ad.length==0){
alert("address cannot be empty");
return false;
}
else if(d!=""&&t==""){
alert("also provide time");
return false;
}
else if(t!=""&&d==""){
alert("also provide date");
return false;
}
else if(tm>t && dtnew==d){
alert("not allowed");
return false;
}
else{
alert("submitting");
document.order1.submit();
return true;
}
}
</script>
</head>
<body>
<form action="fconfirmo1.jsp" onsubmit="return check();" name="order1" method="post">
<%
String idstr="";
String e=(String)session.getAttribute("email");
Cookie c1=null;
Cookie ck[]=request.getCookies();
for(int i=0;i<ck.length;i++){
c1=ck[i];
if((c1.getName()).compareTo("itemid")==0){
idstr=c1.getValue();
break;
}
}
int id=Integer.parseInt(idstr);
out.print("<input type='hidden' id='email' value='"+e+"' ");

try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/learning","root","sweety");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select name,cost from food where fid="+id);
if(rs.next()){
out.print("<h2>"+rs.getString(1)+"</h2><br>");
out.print("Rs."+ rs.getInt(2)+" for each item<br>");
}
out.print("<input size='60' id='address' type='text' name='deladd' value='"+(String)session.getAttribute("address")+"'><br>");
out.print("<input type='number' value='1' name='quantity' max='5'><br>");
Date dt=new Date();
Calendar c=Calendar.getInstance();
String dates[]=new String[10];
dates[0]=new SimpleDateFormat("yyyy-MM-dd").format(dt);
c.add(Calendar.DATE,1);
dt=c.getTime();
dates[1]=new SimpleDateFormat("yyyy-MM-dd").format(dt);
c.add(Calendar.DATE, 1);
dt = c.getTime();
dates[2]=new SimpleDateFormat("yyyy-MM-dd").format(dt);
c.add(Calendar.DATE, 1);
dt = c.getTime();
dates[3]=new SimpleDateFormat("yyyy-MM-dd").format(dt);
out.print("Date:");
out.print("<select id='date' name='date'>");
out.print("<option></option>");
out.print("<option value='"+dates[0]+"'>"+dates[0]+"</option>");
out.print("<option value='"+dates[1]+"'>"+dates[1]+"</option>");
out.print("<option value='"+dates[2]+"'>"+dates[2]+"</option>");
out.print("<option value='"+dates[3]+"'>"+dates[3]+"</option>");

out.print("</select><br>");
out.print("Time:");
out.print("<input type='time' id='time' name='time'><br>");
con.close();
}catch(Exception ex){
out.print(ex);
}
%>
<input type="submit" value='Place Order'>
</form>
</body>
</html>