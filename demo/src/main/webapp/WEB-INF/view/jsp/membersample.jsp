<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%-- core : if, foreach --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <%-- fmt : format 날짜 --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html>
<html>
<head>
<%@ include file="./common/head.jspf"%>
	<style>
        th { text-align: center; width: 2%; background-color: dimgray; height: 50px; }
        td { height: 50px; text-align: center; }
    </style>
</head>
<body>
	<%@ include file="./common/top.jspf"%>

	<div class="container" style="margin-top: 80px">
		<div class="row">
			<%@ include file="./common/aside.jspf" %>
			<!-- ================= Main ==================== -->
			<div class="col-9">
           		<table>
                	<tr>
	                    <th>No.</th>
	                    <th>ID</th>
	                    <th>이름</th>
	                    <th>ZipCode</th>
	                    <th>City</th>
	                    <th>Country</th>
	                    <th>Car No</th>
	                    <th>Car Name</th>
	                    <th>차량 색</th>
	                    <th>Car Size</th>
	                    <th>Car Tire</th>
	                </tr>
               <c:forEach var="mem" items="${member}" varStatus="loop">
                    <tr style="background-color : ${loop.index mod 2 eq 1 ? 'rgb(211, 209, 209)' : ''}">
                        <td>${loop.index+1}</td>
                        <td>${mem.id}</td>
                        <td>${mem.name}</td>
                        <td>${mem.addr.zipCode}</td>
                        <td>${mem.addr.city}</td>
                        <td>${mem.addr.country}</td>
                        <td>${mem.car.carNo}</td>
                        <td>${mem.car.name}</td>
                        <td>${mem.car.color}</td>
                        <td>${mem.car.size}</td>
                        <td>${mem.car.tire}</td>
                    </tr>
               </c:forEach>
           		</table>
			</div>
			<!-- ================= Main ==================== -->
		</div>
	</div>

	<%@ include file="./common/bottom.jspf"%>
</body>
</html>