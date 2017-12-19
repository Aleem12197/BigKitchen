<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%
String oid=request.getParameter("valu");
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/learning","root","sweety");
Statement st= con.createStatement();
st.executeUpdate("delete from forder where orderid='"+oid+"'");
//st.executeUpdate("update food set norders=norders-1 where fid=");
out.print("order cancelled");
con.close();
}catch(Exception ex){
out.print(ex);
}
%>