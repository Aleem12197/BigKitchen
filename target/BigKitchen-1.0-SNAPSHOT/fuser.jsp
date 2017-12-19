<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<% 
String ph=request.getParameter("phn");
String e=(String)session.getAttribute("email");  
String ad=request.getParameter("addr");
if(e!=null){
session.setAttribute("phone",ph);
session.setAttribute("address",ad);
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/learning","root","sweety");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select email from fuserdetails");
int l=0;
while(rs.next()){
if(rs.getString(1).equals(e))
l=1;
}
if(l==1){
st.executeUpdate("update fuserdetails set phone='"+ph+"', addr='"+ad+"' where email='"+e+"'");
out.print("updated");

}else{
st.executeUpdate("insert into fuserdetails values('"+e+"','"+ph+"','"+ad+"')");
out.print("saved");
}
st.close();
con.close();
}catch(Exception er){
out.print(er);
}

}else
out.print("<h2>please login</h2>");
%>