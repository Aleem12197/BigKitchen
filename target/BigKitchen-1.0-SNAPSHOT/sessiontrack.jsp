<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<% 
int flag=0;
String username=request.getParameter("uname");
String em=request.getParameter("emid");        
session.setAttribute("uname",username);  
session.setAttribute("email",em);
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con1=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/learning","root","sweety");
Statement st=con1. createStatement();
ResultSet rs=st.executeQuery("select * from fuserdetails");
while(rs.next()){
if(rs.getString(1).equals(em)){
session.setAttribute("phone",rs.getString(2));
session.setAttribute("address",rs.getString(3));
}
}
con1.close();
}catch(Exception e){
out.print(e);
}
out.print("login done");
%>