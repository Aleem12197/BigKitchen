<%@ page contentType="text/html" language="java" import="java.io.*,java.sql.*" %> 
<html> 
<head>
  <title>BIRYANI</title>
  

 <script src="ajax.js">
</script>
</head>
 
<body> 
<% 
try 
{  
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/learning","root","sweety");

%> 

<table style="width:100%" > 

<% 
String categor=(String)session.getAttribute("catego");
PreparedStatement pst = con.prepareStatement("select * from food where category='"+categor+"'"); 
ResultSet rs=pst.executeQuery(); 
int i=0;
out.print("<tr>");
while(rs.next()) 
{ 
if(i<3){
i++;
out.print("<td> ");
out.print("<img src='");
out.print(rs.getString(3));
out.print("'><br>");
out.print("<h3>");
out.print(rs.getString(2));
out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#8377;");
out.print(rs.getInt(5));
out.print("/-</h3><p>");
out.print(rs.getString(6));
out.print("</p>");
out.print("<input type='button' onclick='reply_click(this.id)' id='");
out.print(rs.getString(1));
out.print("' value='Add to cart' >");
out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
out.print("<input type='button' onclick='reply(this.id)' id='");
out.print(rs.getString(1));
out.print("' value='View Item' >");

out.print("</td>"); 
}else{
i=1;
out.print("</tr><tr><td>");
out.print("<img src='");
out.print(rs.getString(3));
out.print("'><br>");
out.print("<h3>");
out.print(rs.getString(2));
out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#8377;");
out.print(rs.getInt(5));
out.print("/-</h3><p>");
out.print(rs.getString(6));
out.print("</p>");
out.print("<input type='button' onclick='reply_click(this.id)' id='");
out.print(rs.getString(1));
out.print("' value='Add to cart' >");
out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
out.print("<input type='button' onclick='reply(this.id)' id='");
out.print(rs.getString(1));
out.print("' value='View Item' >");

out.print("</td>"); 

}

}
out.print("</tr>");
pst.close(); 
con.close(); 
} 
catch(SQLException e) 
{ 
out.println ( e); 
} 
catch (ClassNotFoundException e) 
{ 
out.println( e ); 
} 

%> 

</table> 

</body> 
</html>