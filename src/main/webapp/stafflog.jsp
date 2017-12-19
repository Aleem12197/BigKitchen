<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>

<% 	
if(request.getParameter("login").equals("staff@bigkit.com") ){
if( request.getParameter("password").equals("BiGKit@123")){
out.print("login done");
%>
<br>
<jsp:include page="getorders.jsp"/>
<%		
}else
out.print("wrong password");
}else
out.print("wrong id");

%>
  
</html>
