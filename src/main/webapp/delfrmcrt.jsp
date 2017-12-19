<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<% 
String idstr=request.getParameter("valu");
String e=(String)session.getAttribute("email"); 
int id = Character.getNumericValue(idstr.charAt(6));
if(e!=null){
 try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/learning","root","sweety");
Statement st=con.createStatement();
st.executeUpdate("delete from fcart where email='"+e+"' and fid="+id);
out.print("removed from cart");
con.close();
}catch(Exception er){
out.print(er);
}
}
else
out.print("please login");
%>