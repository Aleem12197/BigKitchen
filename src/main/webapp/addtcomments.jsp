<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>


<%
String em=(String)session.getAttribute("email");
String un=(String)session.getAttribute("uname");
if(em!=null){
//String idstr=(String)session.getAttribute("itemid");
String idstr="";
Cookie c=null;
Cookie ck[]=request.getCookies();
for(int i=0;i<ck.length;i++){
c=ck[i];
if((c.getName()).compareTo("itemid") == 0 ) {
idstr = c.getValue();
//out.print(idstr);
break;
}
}


int id=Integer.parseInt(idstr);
String co=request.getParameter("comment");
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/learning","root","sweety");
//out.print("connected");
Statement st=con.createStatement();
st.executeUpdate("insert into fcomments values("+id+",'"+em+"','"+un+"','"+co+"')");
ResultSet rs1=st.executeQuery("select username,comment from fcomments where fid="+id);
while(rs1.next()){
out.print(rs1.getString(1)+": "+rs1.getString(2)+"<br>");

}
con.close();
}catch(Exception ex){
out.print(ex);
}
}
else
out.print("please login");
%>