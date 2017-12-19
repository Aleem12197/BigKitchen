<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<% 
String idstr=request.getParameter("val");
int id=Integer.parseInt(idstr);
String e=(String)session.getAttribute("email");  
String qstr=request.getParameter("qua");
int q=Integer.parseInt(qstr);
String d=request.getParameter("dt");
String t=request.getParameter("tm");

if(e!=null){
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/learning","root","sweety");
Statement st=con.createStatement();

st.executeUpdate("update fcart set dateofdel='"+d+"',timerange='"+t+"',quantity="+q+" where email='"+e+"' and fid="+id);
out.print("saved");

st.close();
con.close();
}catch(Exception er){
out.print(er);
}

}else
out.print("<h2>please login</h2>");
%>
