<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<html>
<head>
</head>
<body>

<%
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/learning","shabaash","ShaBash@123");
ResultSet rs=null;
Statement ps=con.createStatement();
rs=ps.executeQuery("select fid,name,path,isactive from food");
while(rs.next()){
out.print(rs.getString(2)+"<br>");
out.print("<img src='"+rs.getString(3)+"'>");
out.print("<br>"+rs.getString(4));
out.print("<br><input type='button' id='"+rs.getString(1)+"' value='delete' onclick='deleteitem(this.id)'>");
out.print("<hr>");
}
out.print("<script src='ajax2.js'></script>");
con.close();
}catch(Exception e){
out.print(e);

}

%>
</body>
</html>