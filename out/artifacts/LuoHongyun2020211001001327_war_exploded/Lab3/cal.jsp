<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: purity
  Date: 2022/5/29
  Time: 17:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cal</title>
</head>
<body>
<form method="post" action="<c:url value="/CalServlet"/>" name="myForm" id="myForm">
    <label>
        First Val:
        <input type="text" name="firstVal" value="<%=session.getAttribute("cFirstVal")!=null?session.getAttribute("cFirstVal"):""%>">
    </label>
    <label>
        Enter a Name:
        <input type="text" name="cName" value="<%=session.getAttribute("cName")!=null?session.getAttribute("cName"):""%>">
    </label><br>
    <label>
        Second Val:
        <input type="text" name="secondVal" value="<%=session.getAttribute("cSecondVal")!=null?session.getAttribute("cSecondVal"):""%>">
    </label>
    <label>
        Length:
        <input type="text" name="computeLength" value="<%=session.getAttribute("cLength")!=null?session.getAttribute("cLength"):""%>">
    </label><br>
    <label>
        Result:
        <input type="text" name="result" value="<%=session.getAttribute("cResult")!=null?session.getAttribute("cResult"):""%>">
    </label><br>
    <input type="hidden" name="action" value="">
<%--    set value of <input type=hidden name=action >--%>
    <button type="submit" name="action" value="add" onclick="return checkInput('add')">add</button>
    <button type="submit" name="action" value="subtarat" onclick="return checkInput('subtarat')">subtarat</button>
    <button type="submit" name="action" value="multiply" onclick="return checkInput('multiply')">multiply</button>
    <button type="submit" name="action" value="divide" onclick="return checkInput('divide')">divide</button>
    <button type="submit" name="action" value="computerLength" onclick="return checkInput('computerLength')">computerLength</button>
    <button type="submit" name="action" value="reset" onclick="return checkInput('reset')">clear</button>
</form>
</body>
<script>
    //??????????????????????????????
    function checkInput(action) {
        var firstVal = document.getElementsByName("firstVal")[0].value;
        var secondVal = document.getElementsByName("secondVal")[0].value;
        var cName = document.getElementsByName("cName")[0].value;
        document.getElementsByName("action")[0].value = action;
        if(action==="add"||action==="subtarat"||action==="multiply"||action==="divide") {
            //?????????????????????????????????????????????
            var reg = /^[0-9]*$/;
            if(!reg.test(firstVal) || firstVal==="") {
                alert("First Val is not a number!");
                return false;
            }
            if(!reg.test(secondVal) || secondVal==="") {
                alert("Second Val is not a number!");
                return false;
            }
        }
        if(action==="computerLength") {
            //?????????????????????cName???????????????
            var reg1 = /^[a-zA-Z]+$/;
            if(!reg1.test(cName)) {
                alert("Name is not valid!");
                return false;
            }
        }
        if(action==="reset"){
            document.getElementsByName("firstVal")[0].value="";
            document.getElementsByName("secondVal")[0].value="";
            document.getElementsByName("cName")[0].value="";
            document.getElementsByName("computeLength")[0].value="";
            document.getElementsByName("result")[0].value="";
            return false;
        }
    }
</script>
</html>
