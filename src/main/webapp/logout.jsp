<%@ page import="java.io.*" %>
<%
String e=(String)session.getAttribute("email");
if(e!=null){           
session.invalidate();  
out.print("You are successfully logged out!");  
}
else
out.print("you are not logged in");
%>