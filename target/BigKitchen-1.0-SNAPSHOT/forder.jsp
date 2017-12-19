<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>


<html>
<head>
<script>
function check(){
var ads=document.getElementById("adds").value;
var em=document.getElementById("email").value;
var adds=ads.substring(0,ads.length-1);
alert(adds);
var adarr=adds.split(" ");
var addr;
var temp;
for(var i=0;i<adarr.length;i++){
//alert(adarr[i]);
addr="add".concat(adarr[i]);
//alert(addr);
temp=document.getElementById(addr).value;

if(temp==null||temp==""||temp=="null"){
alert("mention address");
return false;
}
}

if(em==null||em=="null"||em==""){
alert("please login");
return false();
}else{
document.orders.submit();
return true;
}

}
</script>
</head>
<body>
<form action='fconfirmo.jsp' name="orders" onsubmit="return check()" method='post' >
<%
String e=(String)session.getAttribute("email");  
//out.print("Hello "+e);
String os="";
if(e!=null){

out.print("<input type='hidden' id='email' value='"+e+"'>");
Cookie ck[]=request.getCookies();
Cookie c=null;
for(int k=0;k<ck.length;k++){
c=ck[k];
if(c.getName().compareTo("fids")==0){
os=c.getValue();
break;
}
}

out.print("<input type='hidden' id='adds' value='"+os+"'>");

try{
Class.forName("com.mysql.jdbc.Driver");
Connection con1=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/learning","root","sweety");
Statement st=con1. createStatement();
ResultSet rs=st.executeQuery("select * from fcart c inner join food f on c.fid=f.fid and c.email='"+e+"' inner join fuserdetails u on c.email=u.email");
String tm,dt;
while(rs.next()){
out.print("<br>");
out.print(rs.getString(7));
out.println(" <br>"+rs.getInt(5));
out.println("<br>Price:"+rs.getInt(10)*rs.getInt(5));
dt=rs.getString(3);
tm=rs.getString(4);
if(dt==null||dt=="null"||dt=="")
dt="today";
if(tm==null||tm=="null"||tm=="")
tm="now";

out.println("<br>Date:"+dt+" Time:"+tm);
out.println("<br><input size='50' type='text' name='add"+rs.getInt(2)+"' id='add"+rs.getInt(2)+"' value='"+rs.getString(15)+"'");
out.print("<br><br>");
}
con1.close();
}catch(Exception ex){
out.print(ex);
}
%>
<input type='submit' value='Place Order' >
<%
}else
out.print("<h1>Please login<h2>");
%>
</form>
</body>
</html>