<%--
  Created by IntelliJ IDEA.
  User: purity
  Date: 2022/5/14
  Time: 9:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>&lt;fmt:formatNumber&gt; Demo</title>
</head>
<body>
<h1>&lt;fmt:formatNumber&gt; Demo</h1>
The Account Balance can be displayed using various ways:
<c:set var="accountBalance" value="9500.60" />
<p>as it is:<strong><fmt:formatNumber value="${accountBalance}" /></strong></p>
<p>max. interger digits 3:
    <strong>
        <fmt:formatNumber type="number" maxIntegerDigits="3" value="${accountBalance}" />
    </strong>
</p>
<p>max. fraction digits 1:
    <strong>
        <fmt:formatNumber type="number" maxFractionDigits="3" value="${accountBalance}" />
    </strong>
</p>
<p>no grouping:
    <strong>
        <fmt:formatNumber type="number" groupingUsed="false" value="${accountBalance}" />
    </strong>
</p>
<p>percent with max. integer digits 3:
    <strong>
        <fmt:formatNumber type="percent" maxIntegerDigits="3" value="${accountBalance}" />
    </strong>
</p>
<p>percent with min. fraction digits 10:
    <strong>
        <fmt:formatNumber type="percent" minFractionDigits="10" value="${accountBalance}" />
    </strong>
</p>
<p>pattern ###.###E0
    <strong>
        <fmt:formatNumber type="number" pattern="###.###E0" value="${accountBalance}" />
    </strong>
</p>
<p>account balance in USA:
    <fmt:setLocale value="en_US" />
    <strong>
        <fmt:formatNumber value="${accountBalance}" type="currency" />
    </strong>
</p>
<p>account balance in Canda
    <fmt:setLocale value="fr_CA" />
    <strong>
        <fmt:formatNumber value="${accountBalance}" type="currency" />
    </strong>
</p>
</body>
</html>
