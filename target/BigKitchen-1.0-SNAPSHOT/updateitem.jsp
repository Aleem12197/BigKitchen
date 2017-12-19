<%@ page import="java.sql.*" %>
<html>
<head>
</head>
<body>
<%try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/learning","root","sweety");
	PreparedStatement pst=con.prepareStatement("select name,path,category,cost,description,norders,isactive,fid from food");
	ResultSet rs=pst.executeQuery();
	while(rs.next()){
		%>
		<hr>
		Name:<%=rs.getString(1)%><br>
		Pic:<img src="<%=rs.getString(2)%>"><br>
		Path:<input type="text" id="<%=rs.getInt(8)%>path" value="<%=rs.getString(2)%>"><br>
		Category:<%=rs.getString(3)%><br>
		Cost:<input type="text" id="<%=rs.getInt(8)%>cost" value="<%=rs.getInt(4)%>"><br>
		Description:<input type="text" id="<%=rs.getInt(8)%>desc" value="<%=rs.getString(5)%>"><br>
		number of orders:<%=rs.getInt(6)%><br>
		Is Active:<input id="<%=rs.getInt(8)%>act" value="<%=rs.getString(7)%>"><br>
		<button id="<%=rs.getInt(8)%>" onclick="updateitem(this.id)">Update</button>
		
		
		
		<%
		
	}
con.close();
	}catch(Exception e){
		out.print(e);
	}%>
</body>
<script>
function updateitem(id){
	
	var p=document.getElementById(id.concat("path")).value;
	var c=document.getElementById(id.concat("cost")).value;
	var d=document.getElementById(id.concat("desc")).value;
	var i=document.getElementById(id.concat("act")).value;
	var url="updateit.jsp?newpath="+p+"&fid="+id+"&cost="+c+"&desc="+d+"&isac="+i;
	alert(url);
if(window.XMLHttpRequest){
request=new XMLHttpRequest();
}
else if(window.ActiveXObject){
request=new ActiveXObject("Microsoft.XMLHTTP");
}

try
{
request.onreadystatechange=getupfo;
request.open("GET",url,true);
request.send();
}
catch(e)
{
alert("Unable to connect to server");
}
}
function getupfo(){
if(request.readyState==4){
var al=request.responseText;
alert(al);
//location.reload(true);
//document.getElementById(v).value="added to cart";
}
}

</script>
</html>