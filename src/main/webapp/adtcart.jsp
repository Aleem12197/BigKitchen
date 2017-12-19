<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<% 
String idstr=request.getParameter("val");
int id=Integer.parseInt(idstr);
String e=(String)session.getAttribute("email");  

if(e!=null){
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/learning","root","sweety");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select email,fid from fcart");
int l=0;
while(rs.next()){
if(rs.getString(1).equals(e)&&rs.getInt(2)==id){
out.print("already in cart");
l=1;
}
}
if(l==0){
st.executeUpdate("insert into fcart(email,fid) values('"+e+"',"+id+")");
out.print("added to cart successfully");
}
st.close();
con.close();
}catch(Exception er){
out.print(er);
}

}else
out.print("please login");
%>
