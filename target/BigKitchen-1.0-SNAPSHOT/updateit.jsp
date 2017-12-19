<%@ page import="java.sql.*" %>
<%
String path=request.getParameter("newpath");

String co=request.getParameter("cost");
String de=request.getParameter("desc");
String act=request.getParameter("isac");
String id=request.getParameter("fid");
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/learning","root","sweety");
	PreparedStatement pst=con.prepareStatement("update food set path=?,cost=?,description=?,isactive=? where fid=?");
	pst.setString(1,path);
	pst.setString(2,co);
	pst.setString(3,de);
	pst.setString(4,act);
	pst.setString(5,id);
	pst.executeUpdate();
	out.print("updated");
}catch(Exception e){
	out.print(e);
}
%>