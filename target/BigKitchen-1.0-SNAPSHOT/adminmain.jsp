<%@ page language="java" import="java.sql.*,java.io.*" %> 
<% 
try 
{ 
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/learning","root","sweety");
 
PreparedStatement pst = con.prepareStatement("insert into food(name,path,category,cost,description) values(?,?,?,?,?)"); 
String name=request.getParameter("name");
String filepath=request.getParameter("path");
String cat=request.getParameter("cat");
int cost=Integer.parseInt(request.getParameter("cost"));
String desc=request.getParameter("desc"); 
pst.setString(1,name);
pst.setString(2,filepath);
pst.setString(3,cat);
pst.setInt(4,cost);
pst.setString(5,desc); 
pst.executeUpdate(); 
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
<jsp:include page="getadmindata.jsp"/>

 