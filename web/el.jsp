<%--
  Created by IntelliJ IDEA.
  User: purity
  Date: 2022/5/4
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Demo 1- Week 11</title>
</head>
<body>
<%
    //set attribute
    pageContext.setAttribute("attName","att in page");
    request.setAttribute("attName","att in request");

    session.setAttribute("attName","att in session");
    application.setAttribute("attName","att in application");
%>
<h2> get 4 scope variable -using java code </h2>
att value :<%=pageContext.getAttribute("attName",PageContext.PAGE_SCOPE)%><br><!--att in page-->
att value :<%=pageContext.getAttribute("attName",PageContext.REQUEST_SCOPE)%><br><!--att in request-->
att value :<%=pageContext.getAttribute("attName",PageContext.SESSION_SCOPE)%><br><!--att in session-->
att value :<%=pageContext.getAttribute("attName",PageContext.APPLICATION_SCOPE)%><br><!--att in application-->

Find att : <%=pageContext.findAttribute("attName")%><!--which one ?-->

<h2> get 4 scope variable -using EL code </h2>

Att value : ${attName}<!-- ==findAttribute("attName") which one ?-->

<h2>not find - get Attribute from session</h2>
att value : ${sessionScope.attName}<br><!-- == getAttribute("attName",PageContext.SESSION_SCOPE-->
att value : ${requestScope.attName}<br><!-- == getAttribute("attName",PageContext.REQUEST_SCOPE-->
att value : ${pageScope.attName}<br><!-- == getAttribute("attName",PageContext.PAGE_SCOPE-->
att value : ${applicationScope.attName}<br><!-- == getAttribute("attName",PageContext.APPLICATION_SCOPE-->
</body>
</html>
