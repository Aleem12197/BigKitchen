<%@ page import="java.sql.*" %>
<%
String vid=request.getParameter("fooid");
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/learning","root","sweety");
Statement st=con.createStatement();
st.executeUpdate("delete from food where fid='"+vid+"'");
out.print("deleted");
con.close();
}catch(Exception e){
out.print(e);
}
%>