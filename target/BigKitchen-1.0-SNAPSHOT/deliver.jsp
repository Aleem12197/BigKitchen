<%@ page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/learning","root","sweety");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select orderid from forder where isdelivered='no'");
String ny,cid;
while(rs.next()){
cid=rs.getString(1);
ny=request.getParameter(cid);
out.print(ny);
if(ny.equals("yes")){
Statement s=con.createStatement();
s.executeUpdate("update forder set isdelivered='yes' where orderid='"+cid+"'");
}
}
con.close();
}catch(Exception e){
out.print(e);
}
%>
<jsp:include page="getorders.jsp"/>  