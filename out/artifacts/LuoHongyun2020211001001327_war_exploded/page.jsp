<%--
  Created by IntelliJ IDEA.
  User: purity
  Date: 2022/4/30
  Time: 9:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Demo#1- Week 10</title>
</head>
<body>
<h2>Use of pageContext to set,get,remove attribute from 4 scop,request,session,application</h2>
<%
    pageContext.setAttribute("attName","in page");
    request.setAttribute("attName","in request");
    session.setAttribute("attName","in session");
    //application.setAttribute("attName","in application");//use implicit object
    //set attribute -using page context
    pageContext.setAttribute("attName","in application",PageContext.APPLICATION_SCOPE);
%>
<h2>Get attribute using implicit object- way1</h2>
Att Value : <%=pageContext.getAttribute("attName")%><br><%--in page--%>
Att Value : <%=request.getAttribute("attName")%><br><%--in request--%>
Att Value : <%=session.getAttribute("attName")%><br><%--in session--%>
Att Value : <%=application.getAttribute("attName")%><br><%--in application--%>
<h2>Get attribute using pageContext- way2</h2>
Att Value <%=pageContext.getAttribute("attName",PageContext.PAGE_SCOPE)%><%--in page--%>
Att Value <%=pageContext.getAttribute("attName",PageContext.REQUEST_SCOPE)%><%--in request--%>
Att Value <%=pageContext.getAttribute("attName",PageContext.SESSION_SCOPE)%><%--in session--%>
Att Value <%=pageContext.getAttribute("attName",PageContext.APPLICATION_SCOPE)%><%--in application--%>
<h2>Use findAttribute of pageContext-search -page-request-session-application</h2>
Att Value : <%=pageContext.findAttribute("attName")%>(which one ?)<%--in page--%>
</body>
</html>
