<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: purity
  Date: 2022/5/4
  Time: 17:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Demo -3 - week 11</title>
</head>
<body>
<%
    //array
    String[] firstName={"Bill","Scott","Larry"};
    //list
    ArrayList<String> lastName=new ArrayList<String>();
    lastName.add("Ellison");
    lastName.add("Gates");
    lastName.add("McNealy");
    //map
    HashMap<String,String> companyName=new HashMap<String,String>();
    companyName.put("Ellison","Sun");
    companyName.put("Gates","Oracle");
    companyName.put("McNealy","Microsoft");
    //set attribute in any one scope
    request.setAttribute("firstName",firstName);
    request.setAttribute("lastName",lastName);
    request.setAttribute("companyName",companyName);
%>
<h2> get data from Array --> List -->Map - using EL code </h2>
<ul>
    <!--use loop - in jstl - next class-->
    <li>${firstName["0"]}-->${lastName["0"]}-->${companyName["Ellison"]}</li>
    <li>${firstName["1"]}-->${lastName["1"]}-->${companyName[lastName["1"]]}</li>
    <li>${firstName["2"]}-->${lastName["2"]}-->${companyName[lastName["2"]]}</li>
</ul>
</body>
</html>
