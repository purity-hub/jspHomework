<%@include file="../header.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<section id="z`z`">
		<div class="container">
		<div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="<%=basePath %>admin/home">Admin</a></li>
				  <li class="active">User</li>
				</ol>
			</div>
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>Modules</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="<%=basePath%>admin/home">Home</a></li>
								<li><a href="<%=basePath%>admin/productList">Product</a></li>
								<li><a href="<%=basePath%>admin/orderList">Order</a></li>
								<li><a href="<%=basePath%>admin/userList">User</a></li>
							</ul>
						</div>
					</div>
		<div class="table-responsive col-sm-8">
		<h2 class="title text-center">User <strong>List</strong></h2>
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="description"><strong>Username</strong></td>
							<td class="description"><strong>Password</strong></td>
							<td class="description"><strong>Email</strong></td>
							<td class="description"><strong>Gender</strong></td>
							<td class="description"><strong>Date of Birth</strong></td>

							<td ></td>
						</tr>
					</thead>
					<tbody>
					<!-- loop_start -->
					<sql:setDataSource var="myDs"
									   driver="com.mysql.cj.jdbc.Driver"
									   url="jdbc:mysql://localhost:3306/userdb?serverTimezone=UTC"
									   user="root"
									   password="123456"/>
					<sql:query var="allUser" dataSource="${myDs}">
						select * from usertable;
					</sql:query>
					<c:set var="pagesize" value="8" scope="page" />
						<c:forEach var="row" items="${allUser.rows}" begin="${param.start}" end="${param.start+pagesize}">
						<tr>
							<td class="cart_description">
								<p>${row.username}</p>
							</td>
								<td class="cart_description">
								<p>${row.password}</p>
							</td>
							<td class="cart_description">
								<p>${row.email} </p>
							</td>
							<td class="cart_description">
							<p>${row.gender} </p>
							</td>
							<td class="cart_description">
								<p >${row.birthday}</p>
							</td>

							<td class="cart_delete">
							   <a class="cart_quantity_update" href="<%=basePath %>admin/userEdit?userId=${row.id}" ><i class="fa fa-edit"></i></a>
								<a class="cart_quantity_delete" href="<%=basePath%>admin/userDelete?userId=${row.id}" ><i class="fa fa-times"></i></a>
							</td>
						</tr>
						</c:forEach>
						<!-- loop_end -->
		</tbody>
		</table>
			<c:set var="number" value="${allUser.rowCount}" scope="page" />
			<fmt:formatNumber var="pagenumber" value="${(number+pagesize-1)/pagesize}" pattern="0" />

			<ul class="pagination">
				<c:choose>
					<c:when test="${param.start==0}">
						<li class="disabled"><a href="#">&laquo;</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="<%=basePath%>admin/userList?start=${param.start-pagesize}">&laquo;</a></li>
					</c:otherwise>
						</c:choose>
							<li><a href="">1</a></li>
							<li><a href="">${pagenumber}</a></li>
											<c:choose>
								<c:when test="${param.start+pagesize>=number}">
									<li class="disabled"><a href="#">&raquo;</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="<%=basePath%>admin/userList?start=${param.start+pagesize}">&raquo;</a></li>
								</c:otherwise>
											</c:choose>
						</ul>
		</div>
		</div>
		</section>
 <%@include file="../footer.jsp" %>
