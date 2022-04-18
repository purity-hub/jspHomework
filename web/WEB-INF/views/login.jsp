<%@ page import="jakarta.servlet.http.Cookie" %>
<%@ page import="java.util.Objects" %><%--
  Created by IntelliJ IDEA.
  User: purity
  Date: 2022/3/26
  Time: 18:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
<h1>Login</h1>
<%
if(!(request.getAttribute("message")==null)){
    out.print("<h3>"+request.getAttribute("message")+"</h3>");
}
%>
<%
    Cookie[] allCookies = request.getCookies();
    String username = "",password = "",rememberMeVal = "";
    if(allCookies!=null){
        for (Cookie c : allCookies) {
            if(c.getName().equals("cUsername")){
                username=c.getValue();
            }
            if(c.getName().equals("cPassword")){
                password=c.getValue();
            }
            if(c.getName().equals("rememberMeVal")){
                rememberMeVal=c.getValue();
            }
        }
    }
%>
<form name="login" method="post" action="login">
    Username:<input type="text" name="username" value="<%=username%>"><br/>
    Password:<input type="password" name="password" value="<%=password%>"><br/>
    <input type="checkbox" name="rememberMe" value="1" <%=Objects.equals(rememberMeVal, "1") ? "checked":""%>>
    <input type="submit" value="Login">
</form>
<%@include file="footer.jsp"%>
