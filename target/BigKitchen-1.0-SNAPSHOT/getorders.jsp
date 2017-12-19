<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>
<form action="deliver.jsp">
<%
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con1=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/learning","root","sweety");
Statement s=con1.createStatement();
ResultSet r=s.executeQuery("select * from forder where isdelivered='no'");

while(r.next()){
out.print("order id is: "+r.getString(1));
out.print("<br>");

Statement st=con1. createStatement();
ResultSet rs=st.executeQuery("select name from food where fid="+r.getInt(3));
rs.next();
out.print("<h2>'"+rs.getString(1)+"'</h2>");
out.print("<br>");
out.print("Date:"+r.getString(4));
out.print("<br>");
out.print("Time:"+r.getString(5));
out.print("<br>");
out.print("Quantity:"+r.getInt(6));
out.print("<br>");
out.print("delivery address is: "+r.getString(7));
out.print("<br>");
out.print("is delivered?\nno");
out.print("<input type='radio' value='no' name='");
out.print(r.getString(1));
out.print("' checked />");
out.print("\nyes");
out.print("<input type='radio' value='yes' name='");
out.print(r.getString(1));
out.print("' />");

out.print("<hr>");
}
con1.close();
}catch(Exception e){
out.print(e);
}

%>
<input type="submit" value="SAVE">
</form>
</html>