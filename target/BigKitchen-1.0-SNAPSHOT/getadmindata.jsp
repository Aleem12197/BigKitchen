<%@ page import="java.io.*,java.sql.*" %>
<html>
<body>

<FORM ENCTYPE="multipart/form-data" ACTION="uploadFile.jsp" METHOD="POST">
<center>
<table border="0" bgcolor=#ccFDDEE>
<tr>
<center><td colspan="2" align="center"><B>UPLOAD THE IMAGE</B></center></td>
</tr>
<tr><td colspan="2" align="center"> </td></tr>
<tr><td><b>Choose the file To Upload:</b></td>
<td><INPUT NAME="file" TYPE="file"></td>
</tr>
<tr><td colspan="2" align="center"> </td></tr>
<tr><td colspan="2" align="center"><input type="submit" value="Send File"> </td></tr>
</table>
</center>
</FORM>

<h2>Upload product details</h2>
<form method="get" action="./adminmain.jsp">

Name:<input type="text" name="name" size="50"/><br><br>
Path:<input type="text" name="path" size="50"/><br><br>
Category:<input type="text" name="cat" size="50"/><br><br>
Cost:<input type="text" name="cost" size="50"/><br><br>
Description:<input type="text" name="desc" size="50"/><br><br>
<input type="submit" value="Add Food Item"/>
</form>
<button id="bu" onclick="showpics()">View Pictures</button>
<div id="pics" style="display:none">
<button onclick="hidepics()">Hide Pictures</button>
<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/learning","root","sweety");
	PreparedStatement pst=con.prepareStatement("select * from file1");
	ResultSet rs=pst.executeQuery();
	while(rs.next()){
		out.print("<br><img src='"+rs.getString(1)+"'>");
		out.print("<br>Path:<input type='text' value='"+rs.getString(1)+"'>");
		
	}
}catch(Exception e){
	out.print(e);
}
%>
</div>
<h2>Add category</h2>
UNDER:
<select id="maincat">
<option value="southindian">southindian</option>
<option value="chinese">chinese</option>
<option value="italian">italian</option>
<option value="other">other</option>
</select><br><br>
name of the category:<input type="text" id="category" size="50"/><br><br>
<p id="divi">
</p>
<button onclick="addcateg();">Add Category</button>





<script>
function addcateg(){
var ma=document.getElementById("maincat").value;
var ca=document.getElementById("category").value;
alert(ma+ca);
var url="addcateg.jsp?mai="+ma+"&cate="+ca;


if(window.XMLHttpRequest){
request=new XMLHttpRequest();
}
else if(window.ActiveXObject){
request=new ActiveXObject("Microsoft.XMLHTTP");
}

try
{
request.onreadystatechange=getInto;
request.open("GET",url,true);
request.send();
}
catch(e)
{
alert("Unable to connect to server");
}
}

function getInto(){
if(request.readyState==4){
var al=request.responseText;
alert(al);
document.getElementById("category").value="";

document.getElementById("divi").innerHTML=al;

}
}

function showpics(){
document.getElementById("pics").style.display="inline";
document.getElementById("bu").style.display="none";

}
function hidepics(){
document.getElementById("pics").style.display="none";
document.getElementById("bu").style.display="initial";

}
</script>
</body>
</html>