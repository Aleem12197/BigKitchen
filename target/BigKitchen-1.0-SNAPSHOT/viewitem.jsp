<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<script>
function check(){
var em=document.getElementById("email").value;
var ad=document.getElementById("address").value;
if(em=="null"){
alert("please login");
return false;
}else if(ad=="null"||ad.length==0){
alert("please provide phone number and address");
return false;
}else{
alert(ad);
document.nocart.submit();
return true;
}
}

function addcomment(){
var co=document.getElementById("comm").value;
var len=co.split(' ').length-1;
alert(len);

if(co==null||co==""||len==co.length){

alert("this comment is not allowed");

}
else{
alert(co);
var url="addtcomments.jsp?comment="+co;

if(window.XMLHttpRequest){
request=new XMLHttpRequest();
}
else if(window.ActiveXObject){
request=new ActiveXObject("Microsoft.XMLHTTP");
}

try
{
request.onreadystatechange=getInfo;
request.open("GET",url,true);
request.send();
}
catch(e)
{
alert("Unable to connect to server");
}
}
}

function getInfo(){
if(request.readyState==4){
var al=request.responseText;
//alert(al);
//var al=request.responseHTML;
var b=al.substring(8,20);
//alert(b);
if(b=="please login"){
alert(b);
}
else{
document.getElementById("comm").value="";
document.getElementById("commentsdiv").innerHTML=al;
}
}
}







</script>
</head>
<body>
<form action="forder1.jsp" name="nocart" onsubmit="return check()" method="post">

<%
String addr=(String)session.getAttribute("address");
String em=(String)session.getAttribute("email");
out.print("<input type='hidden' value='"+em+"' id='email'>");
out.print("<input type='hidden' value='"+addr+"' id='address'>");
String idstr="";
Cookie c=null;
Cookie ck[]=request.getCookies();
for(int i=0;i<ck.length;i++){
c=ck[i];
if((c.getName()).compareTo("itemid") == 0 ) {
idstr = c.getValue();
//out.print(idstr);
break;
}
}
int id=Integer.parseInt(idstr);
//out.print("<input type='hidden' value='"+id+"' name='check'>");
//out.print(id);
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/learning","root","sweety");
//out.print("connected");
Statement st=con.createStatement();
Statement st1=con.createStatement();

ResultSet rs=st.executeQuery("select * from food where fid="+id);
ResultSet rs1=st1.executeQuery("select username,comment from fcomments where fid="+id);

if(rs.next()){
out.print("<h2>"+rs.getString(2)+"</h2><br>");
out.print("Cost:"+rs.getInt(5)+"<br>");
out.print("<img src='"+rs.getString(3)+"'></img><br>");
out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
out.print("<input type='submit' value='Buy now'><br>");
out.print(rs.getString(6)+"<br>");
out.print("<input type='text' size='60' id='comm'><input type='button' onclick='addcomment()' value='review'><br>");
out.print("<div id='commentsdiv'>");
while(rs1.next()){
out.print(rs1.getString(1)+": "+rs1.getString(2)+"<br>");

}
out.print("</div>");
}
con.close();
}catch(Exception ex){
out.print(ex);
}
%>
</form>
</body>
</html>