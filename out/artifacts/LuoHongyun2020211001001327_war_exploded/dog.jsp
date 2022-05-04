<%@ page import="com.luohongyun.week11.Person" %>
<%@ page import="com.luohongyun.week11.Dog" %><%--
  Created by IntelliJ IDEA.
  User: purity
  Date: 2022/5/4
  Time: 16:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Demo 2- week 11</title>
</head>
<body>
<%
    //create object
    Person person = new Person();
    person.setName("Luohongyun");

    Dog dog = new Dog();
    dog.setName("dog");
    person.setDog(dog);
    request.setAttribute("person", person);
%>
<h2>get persons's dog name -using java code</h2>
<%
    Person p = (Person) pageContext.findAttribute("person");
    Dog d = p.getDog();
    out.println(p.getName()+" has a dog named "+d.getName());
%>
<h2>get persons's dog name -using EL code</h2>
Persons's dog name is ${person.dog.name}
</body>
</html>
