<%
String cate=request.getParameter("cat");
session.setAttribute("catego",cate);  
out.print(cate+"done");
%>