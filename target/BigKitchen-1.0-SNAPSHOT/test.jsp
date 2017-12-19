<%@ page import="java.io.*" %>
<% 
String name=(String)session.getAttribute("uname");  
out.print("Hello "+name);
String ph=(String)session.getAttribute("phone");
String e=(String)session.getAttribute("email");  
out.print("Hello "+e);
//int[] fidstr = (int[]) session.getAttribute( "fids" );
String p=(String)session.getAttribute("address");  
out.print("Hello "+p);
out.print(ph);
//out.print(fidstr[1]);
//out.print(fidstr[0]);
%>