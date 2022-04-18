<%@ page import="com.luohongyun.model.User" %><%--
  Created by IntelliJ IDEA.
  User: purity
  Date: 2022/4/4
  Time: 12:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
<%
    User user1 = (User) session.getAttribute("user");
%>
<h1>User Info</h1>
<%
    User user = (User) session.getAttribute("user");
%>
<table>
    <tr><td>ID:</td><td><%=user.getId()%></td></tr>
    <tr><td>Username:</td><td><%=user.getUsername()%></td></tr>
    <tr><td>Password:</td><td><%=user.getPassword()%></td></tr>
    <tr><td>Email:</td><td><%=user.getEmail()%></td></tr>
    <tr><td>Gender:</td><td><%=user.getGender()%></td></tr>
    <tr><td>Birthday:</td><td><%=user.getBirthday()%></td></tr>
    <tr><td><a href="updateUser">Update User</a></td></tr>
</table>

<%@include file="footer.jsp"%>
