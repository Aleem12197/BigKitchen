<%@ page import="java.sql.*"%>

<%
String maincat=request.getParameter("mai");
String sucat=request.getParameter("cate");
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/learning","root","sweety");
	PreparedStatement pst=con.prepareStatement("insert into categ values(?,?)");
	pst.setString(1,maincat);
	pst.setString(2,sucat);
	pst.executeUpdate();
	con.close();
	
}catch(Exception e){
	out.print(e);
}

%>
