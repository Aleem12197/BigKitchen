<%@ page import="java.io.*" %>
<%
String em=(String)session.getAttribute("email");
if(em!=null){
String a=request.getParameter("val");
//session.setAttribute("itemid",a);
Cookie ck=new Cookie("itemid",a);
response.addCookie(ck);
out.print("itemsessionadded");
}
else 
out.print("please login");
%>