<%--
  Created by IntelliJ IDEA.
  User: purity
  Date: 2022/3/3
  Time: 16:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
</head>
<body>
    <form action="${pageContext.request.contextPath}/hello" name="register" onsubmit="return validation()" method="post">
        <input type="text" name="username" placeholder="Username"><br>
        <input type="password" name="password" placeholder="password"><br>
        <input type="email" name="email" placeholder="Email"><br>
        Gender<input type="radio" value="Male" name="gender">Male
        <input type="radio" value="Female" name="gender">Female<br>
        <input type="date" placeholder="Date od Birth(yyyy-mm-dd)"><br>
        <input type="submit" value="提交">
    </form>
    <script>
        function validation(){
            let username = document.forms["register"]["username"].value;
            if(username == null || username == ''){
                alert("username must be required")
                return false;
            }
            let password = document.forms["register"]["password"].value;
            if(password.length<8){
                alert("at least 8 characters")
                return false;
            }
        }
    </script>
</body>
</html>
